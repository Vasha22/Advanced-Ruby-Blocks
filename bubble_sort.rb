def bubble_sort (arr)	
  n = arr.length
   
  loop do
  	swapped = false
  	(n-1).times	do |idx|
  	  if arr[idx] > arr[idx + 1]
  	    arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
  	    swapped = true
  	  end
  	end
  	break if swapped == false
  end
  puts "Here is the sorted array: #{arr}."
end

def bubble_sort_by (arr)
  n = arr.length
  i = 0
  (n-1).times do 
    i = 0
    while i < n-1
      if yield(arr[i], arr[i+1]) > 0
        arr[i], arr[i+1] = arr[i+1], arr[i]
        
      end
    i += 1
    end
  
  end
  puts "Here is the sorted array by length: #{arr}"
end


numbers = [0,2,2,3,4,78]
bubble_sort(numbers)

bubble_sort_by(["hi", "hello","hey"]) do |left,right|
    left.length - right.length
end