#!/usr/bin/ruby
regex = ARGV[0].scan(/[A-Z!]/)
concatenated = ""
regex.each { |regex| concatenated << "#{regex}" }
puts concatenated
