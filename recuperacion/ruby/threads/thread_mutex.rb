#!/usr/bin/env ruby
#thread_mutex.rb
#require 'thread'
class Object
	def synchronize
		mutex.synchronize {yield self}
	end
	def mutex
		@mutex ||= Mutex.new
	end
end

list = []
list2 = []

h1 = Thread.new do

list.synchronize {|element| sleep 1; 2.times{element.push "Thread 1"}}
puts "#{list}"
end

h2 = Thread.new do
list2.synchronize {|element| sleep 2; 3.times{element.push "Thread 2"}}
puts "#{list2}"
end

sleep 3
puts "#{list} +  #{list2}"
