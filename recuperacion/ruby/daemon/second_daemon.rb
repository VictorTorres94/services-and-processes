#!/usr/bin/env ruby
#second_daemon.rb


puts "About to daemonize."
fork do
	loop do
	puts "I'm a daemon, doing daemon things."
	sleep 2
	end
end

puts "The subprocess has become a daemon."
puts "But I'm going to stick around for a while."
sleep 10
puts "Okay, now I'm done."
