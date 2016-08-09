#!/usr/bin/env ruby

require 'optparse'
require 'aws-sdk'
require 'yaml'


options = {}

OptionParser.new do |parser|
  parser.on("-aACTION", "--action=ACTION", "Name to say hello to") do |a|
    options[:action] = a
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

  this_instance = ec2.run_instances({
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
when "start"
  puts "Start."
when "stop"
  resp = client.stop_instances({
  dry_run: false,
  instance_ids: ["String"],
  force: false,
  })
when "terminate"
  puts "terminate."
end
