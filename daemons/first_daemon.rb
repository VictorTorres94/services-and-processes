#! /usr/bin/env ruby
#daemonize.rb

require 'tempfile'

puts 'About to daemonize.'
Process.daemon
log= Tempfile.new('daemon.log')
loop do
log.puts"I'm a deamon doing daemon things."
log.flush
sleep 5

end
