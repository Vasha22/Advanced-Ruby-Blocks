module Enumerable
  def my_each
   	for i in self
  	 yield(i)
   	end
   	self
  end

  def my_each_with_index
  	i = 0
  	while i < self.length
  	 yield(self[i], i)
  	 i += 1
  	end
  	self
  end

  def my_select
    i = 0
    arr = []
    while i < self.length
 	  arr << self[i] if yield(self[i])
 	  i += 1
    end
    arr
  end

  def my_all
  	i = 0
  	while i < self.length
  	return false if !yield(self[i])
  	i += 1
  	end
  	return true
  end

  def my_any
  	i = 0
  	while i < self.length
  	return true if yield(self[i])
  	i += 1 
  	end
  	return false
  end

  def my_none
  	i = 0
  	while i < self.length
  	  return false if yield(self[i])
  	  i += 1
  	end
  	return true
  end

  def my_count(arg = nil)
  	i = 0
  	counter = 0
   	while i < self.length
  	  if block_given? && arg == nil
  	  	counter += 1 if yield(self[i])
  	  elsif arg != nil && !block_given?
  	    if self[i] == arg
  	      counter += 1
  	    end
  	  else
  	  	counter += 1
  	  end		
  	  i += 1
  	end
  	counter
  end

  def my_map(arg=nil)
		arr = []
		i = 0
		if arg != nil && arg.respond_to?(:call)
		  while i < self.length
			  arr << arg.call(self[i])
			  i += 1
		  end
		elsif arg == nil && block_given?
		  while i < self.length
			  arr << yield(self[i])
			  i += 1
		  end
		end
	arr
  end

  def my_inject (accumulator = 0, &block)
    self.my_each do |item|
      accumulator = block.call(accumulator, item)
    end
    accumulator
  end


  def multiply_els
  	self.my_inject (1) {|memo, i| memo * i}
  end
end



[1,3,5].my_each {|i| puts i}
[1,3,5].my_each_with_index {|num, idx| puts "#{idx}: #{num}"}
[1,3,5].my_select {|i| i == 5}
[[1,3,5], [1,6,7]].my_all {|i| i.include?(1)}
[1,3,5].my_any {|i| i == 3}
[1,3,5].my_none {|i| i == 0}
[1,3,5].my_count {|i| i > 2}
[1,3,5,7].my_count
[1,3,5,5,3,1,1,1,1].my_count(1)
[1,3,5,7].my_inject(1) {|memo, i| memo + i }
[2,4,6,8,10].multiply_els
my_proc = Proc.new {|i| i*4}
[1,3,5].my_map(&my_proc) 