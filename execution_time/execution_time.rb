def my_min_p1(array)
  array.each_with_index do |el1, idx1|
    found = true  
    array.each_with_index do |el2, idx2|
      if idx2 > idx1
        if el2 < el1
          found = false 
        end
      end
    end
    if found == true 
      return el1
    end
  end
end

def my_min_p2(array)
  lowest = array[0]
  array.each do |el|
    if el < lowest
      lowest = el
    end
  end
  lowest
end

def largest_contiguous_subsum_p1(list)

  subs = []

  list.each_with_index do |el1, i|
    list.each_with_index do |el2, j|
      subs << list[i..j] if j >= i
    end
  end

  subs.map do |ele|
    ele.inject(&:+)
  end.max

end

def largest_contiguous_subsum_p2(list)

  largest = 0
  running = 0

  list.each_with_index do |ele, i|
    if ele > 0 
      if i == list.length-1
        running += ele
        if running > largest
          largest = running
        end
      else
        running += ele
      end
    else
      if running > largest
        largest = running
        running = 0
      end
    end
  end
  
  
  if largest == 0
    return list.max
  end
end