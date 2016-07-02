#!/usr/bin/ruby
webserver = {}
webserver['46-web-01'] = 0
webserver['46-web-02'] = 0
100.times do
  result=`curl -s http://52.91.119.16/loadbalancer.html`
  if result.include?('46-web-02')
    webserver['46-web-02'] += 1
  else
    webserver['46-web-01'] += 1
  end
end

puts webserver.inspect
