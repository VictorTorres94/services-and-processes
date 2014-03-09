#!/usr/bin/env ruby
#seconde_threads.rb

counter = 0
h1 = Thread.new do
#	1.upto(50) { counter += 1; }
	while counter < 50
	counter += 1
	sleep 1
	puts "el contador esta en #{counter}."
	end
end

h1.join unless ARGV[0]

puts "El contador ha llegado hasta #{counter}."
