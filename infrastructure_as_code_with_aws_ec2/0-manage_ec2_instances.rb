#!/usr/bin/env ruby

require 'optparse'
require 'aws-sdk'
require 'yaml'

options = {}
OptionParser.new do |opts|
  opts.on("-aACTION", "--action=ACTION", "Action to take.") do |a|
    options[:action] = a
  end
  opts.on("-iINSTANCE_ID", "--instance_id=INSTANCE_ID", "ID of the instance.") do |i|
	  options[:instance_id] = i
  end
  opts.on("-v", "--[no-]verbose", "Run verbosely.") do |v|
    options.verbose = v
  end
  opts.on_tail("-h", "--help", "Show help message.") do
    puts opts
    exit
  end
end.parse!

case options[:action]
when "launch"
  config = YAML.load_file('config.yaml')

  ec2 = Aws::EC2::Client.new({
    region: 'us-west-2',
    access_key_id: config['access_key_id'],
    secret_access_key: config['secret_access_key']
  })

  resp = ec2.run_instances({
    dry_run: false,
    image_id: config['image_id'],
    min_count: 1,
    max_count: 1,
    key_pair: config[:key_pair],
    instance_type: config['instance_type'],
    security_group_ids: config['security_group_ids'],
    placement: {
      availability_zone: config['availability-zone'],
    }
  })

  puts resp.instances[0].instance_id
  resp = ec2.wait_until(:instance_running, instance_ids:[resp.instances[0].instance_id])
  puts resp.reservations[0].instances[0].public_dns_name

when "stop"
  resp = client.stop_instances({
    dry_run: false,
    instance_ids: [resp.instances[0].instance_id], # required
    force: false,
  })

when "start"
  resp = client.start_instances({
    instance_ids: [resp.instances[0].instance_id], # required
    dry_run: false,
  })

  resp = ec2.wait_until(:instance_running, instance_ids:[options[:instance_id]])
  puts resp.reservations[0].instances[0].public_dns_name

when "terminate"
  resp = client.terminate_instances({
    dry_run: false,
    instance_ids: [options[:instance_id]], # required
  })
end
