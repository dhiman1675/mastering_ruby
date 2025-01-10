# frozen_string_literal: true

def bubble_sort(arr)
  loop do
    done = true
    (0...arr.length - 1).each do |i|
      if arr[i + 1] && arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        done = false
      end
    end
    break if done
  end
  arr
end

def bubble_sort2(arr)
  done = false
  until done
    done = true
    (0...arr.length - 1).each do |i|
      next unless arr[i] > arr[i + 1]

      arr[i], arr[i + 1] = arr[i + 1], arr[i]
      done = false
    end
  end
  arr
end

input1 = [9, 2, 1, 4, 3, 8]

puts bubble_sort(input1).join(',')
puts bubble_sort2(input1).join(',')
