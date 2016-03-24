#!/usr/bin/ruby
from = ARGV[0].match(/from:(\S*)\](.*)/)
to = ARGV[0].match(/to:(\S*)\](.*)/)
flags = ARGV[0].match(/flags:(\S*)\](.*)/)
# index 1 is the content after the colon and before the closing brace
from = from[1]
to = to[1]
flags = flags[1]
print from + "," + to + "," + flags + "\n"
