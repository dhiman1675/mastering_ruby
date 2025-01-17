# frozen_string_literal: true

def jump_search(arr, target)
  n = arr.length
  step = Math.sqrt(n).to_i
  prev = 0

  while arr[[step, n].min - 1] < target
    prev = step
    step += Math.sqrt(n).to_i
    return -1 if prev >= n
  end

  while arr[prev] < target
    prev += 1
    return -1 if prev == [step, n].min
  end

  return prev if arr[prev] == target

  -1
end

input = [1, 4, 7, 9, 11, 15, 17, 22, 28, 33, 36, 41, 46, 49, 51]
puts jump_search(input, 51)
