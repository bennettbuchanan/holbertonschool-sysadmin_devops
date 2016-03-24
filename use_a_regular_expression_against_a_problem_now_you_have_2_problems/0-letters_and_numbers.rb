#!/usr/bin/ruby
regex = ARGV[0].scan(/[a-z A-Z 0-9]/)
concatenated = ""
regex.each { |regex| concatenated << "#{regex}" }
puts concatenated
