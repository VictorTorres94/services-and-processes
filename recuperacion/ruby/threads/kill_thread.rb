#!/usr/bin/env ruby
#kill_thread.rb


class CounterThread < Thread
	def initialize
		@count = 0
		@continue = true
		super do
			@count += 1 while @continue
		end
	end
	def stop
		@continue = false
	end
	def numero?
		@count
	end
end

counter = CounterThread.new
sleep 2
counter.stop
puts "I counted up to #{counter.numero?} before I was cruelly stopped."

