require 'byebug'

#time: n^2
#space: n(1)
def bad_two_sum?(array, target)
  array.each.with_index do |el1, idx1|
    array.each.with_index do |el2, idx2|
        if el1 + el2 == target && idx2 > idx1
            return true 
        end
    end
  end
  false 
end

def okay_two_sum?(array, target)
  array.sort!

  array.each_with_index do |ele, i|
    new_target = target - ele

    remaining_array = array[0...i] + array[i+1..-1]

    search = bsearch(remaining_array, new_target)
    if search
      return true
    end
  end

  false
  
end

def bsearch(array, target)
  mid_idx = array.length/2

  return true if target == array[mid_idx]
  return false if array.length < 1

  if target < array[mid_idx]
    return bsearch(array[0...mid_idx], target)
  else
    return bsearch(array[mid_idx+1..-1], target)
  end

  nil
  
end


def two_sum?(array, target) 
  hash = Hash.new(0)

  array.each do |ele|
    hash[ele] += 1
  end

  hash.each do |k, v|
    new_target = target - k
    hash[k] -= 1
    if hash[new_target] != 0
        return true
    end
  end

  false
end