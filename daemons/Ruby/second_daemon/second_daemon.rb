#!/usr/bin/env ruby
#second_daemon.rb

require 'tempfile'
require 'daemonize'

include Daemonize

puts "About to daemonize."
fork do
  daemonize
  log = Tempfile.new('daemon.log')
  loop do
     log.puts "I'm a daemon, doing daemon things."
     log.flush
     sleep 5
  end
end

puts 'Subprocess has become a daemon.'
puts "But I'm going to stick around for a while."
sleep 10
puts "Okay, now I'm done."
