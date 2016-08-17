require 'optparse'
require 'ostruct'
require 'pp'

class AWS_parser

  #
  # Return a structure describing the options.
  #
  def self.parse(args)
    # The options specified on the command line will be collected in *options*.
    # We set default values here.
    options = OpenStruct.new
    options.encoding = "utf8"
    options.verbose = false

    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: ./by 0-basic_aws_s3_script.rb [-a list]"

      opts.separator ""
      opts.separator "Specific options:"

      # Take an aciton as argument
      opts.on("-a", "--action [ACTION]", Array, "List of actions") do |action|
        options.action = action
      end

      # Boolean switch.
      opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
        options.verbose = v
      end

      opts.separator ""
      opts.separator "Common options:"

      # No argument, shows at tail.  This will print an options summary.
      # Try it and see!
      opts.on_tail("-h", "--help", "Show this message") do
        puts opts
        exit
      end
    end

    opt_parser.parse!(args)
    options
  end  # parse()

end  # class AWS_parser

options = AWS_parser.parse(ARGV)
pp options.action
