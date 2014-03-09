#!/usr/bin/env ruby
#first_threads.rb

x = 0
h1 = Thread.new do
	while x > -5
		x -= 1
		puts "X baja y ahora vale #{x}\n"
		sleep 2
	end
	puts "X ya ha llegado a -5\n"
end

h2 = Thread.new do
while x < 5
	x += 2
	puts "X sube y ahora vale #{x}\n"
	sleep 2
end
	puts "X ya ha llegado a 5"
end


h1.join
h2.join
