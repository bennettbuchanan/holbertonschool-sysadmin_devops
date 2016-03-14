#!/usr/bin/ruby
folder = ARGV[0]

Dir.foreach(folder) do |fname|
  if fname.include? "bread"
  	puts fname
 	end
end