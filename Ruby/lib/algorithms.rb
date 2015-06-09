# Write a method that will sum the digits of a positive integer.
# If it is greater than or equal to 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the "digital root".
# Do not use string conversion within your method.
require 'byebug'

def digital_root(number)
  return number if number < 10
  sum = 0
  until number < 10
    sum += (number % 10)
    number /= 10
  end
  sum += number
  digital_root(sum)
end

# Write a function that takes a message and an increment amount and outputs the same letters shifted by that amount in the alphabet.
# Assume lowercase and no punctuation.
# Preserve spaces.
def caesar_cipher(string, shift)
  shifted = ""
  letters = ("a".."z").to_a
  string.each_char do |char|
    old_idx = letters.find_index(char)
    if old_idx
      shifted << letters[(old_idx + shift) % 26]
    else
      shifted << " "
    end
  end

  shifted
end

# Write a function that takes two strings and returns the longest common substring.
def common_substrings(string_one, string_two)
  if string_one.length <= string_two.length
    longer_string = string_two
    shorter_string = string_one
  else
    longer_string = string_one
    shorter_string = string_two
  end


  length = shorter_string.length
  until length == 0
    shorter_string_subs = []
    (0..shorter_string.length - length).each do |start|
      sub = shorter_string[start...start + length]
      return sub if longer_string.include?(sub)
    end

    length -= 1
  end
  return ""
end

# Write a function that takes an array of integers and returns their sum.
# Use recursion.
def sum_rec(numbers)
  return 0 if numbers.empty?
  num = numbers.pop
  num + sum_rec(numbers)
end

# Write a function which returns the first n elements from the fibonnacci sequence, given n.
def fibs(n)
  return [] if n == 0
  return [0] if n == 1
  return [0, 1] if n == 2
  prev_fibs = fibs(n - 1)
  prev_fibs << (prev_fibs[-1] + prev_fibs[-2])
end

# Write a function that takes a string and returns true if it's a palindrome, false if it's not.
# Your solution should take less time and memory than rebuilding the string backward and comparing the two.
def is_palindrome?(string)
  (0...((string.length) / 2)).each do |left|
    return false unless string[left] == string[-(left + 1)]
  end
  return true
end

# Implement the Folding Cipher.
# It folds the alphabet in half and uses the adjacent letter.
# a <=> z, b <=> y, c <=> x, m <=> n.
def folding_cipher(string)
  letters = ("a".."z").to_a
  cipher = {}
  (0..12).each do |idx|
    front = letters[idx]
    back = letters[-(idx + 1)]
    cipher[front] = back
    cipher[back] = front
  end

  ciphered = ""
  string.each_char do |char|
    ciphered << cipher[char]
  end

  ciphered
end

# Write a method that finds all the unique substrings for a word.
def uniq_subs(string)
  subs = []
  prev_subs = {}

  (0...string.length).each do |first|
    (first...string.length).each do |last|
      sub = string[first..last]
      unless prev_subs[sub]
        subs << sub
        prev_subs[sub] = true
      end
    end
  end

  subs
end

# Given an array of integers (positive and negative) find the largest contiguous subsum (sum of a subarray).
# You can solve this trivially in O(n**2) time by considering all subarrays.
# Try to solve it in O(n) time with O(1) memory.
def lcs(array)
  old = 0
  current = 0
  array.each do |num|
    current += num
    if current < 0
      current = 0
    elsif current > old
      old = current
    end
  end

  old
end

# Write a function that takes a year (four digit integer) and returns an array with the 10 closest subsequent years that meet the following condition:
# the first two digits summed with the last two digits are equal to the middle two digits.
def silly_years(year)
  years = []
  until years.length == 10
    year_str = year.to_s
    if (year_str[0..1].to_i + year_str[2..3].to_i == year_str[1..2].to_i)
      years << year
    end
    year += 1
  end

  years
end

# Given an array of integers, return all pairs that sum up to a specified value k.
# List the pairs in [min, max] order.
# Time complexity: O(n).
# Return a set.
def pair_sum(array, k)

end

# Given a matrix of integers and coordinates of a rectangular region within the matrix.
# Find the sum of numbers falling inside the rectangle.
# Time complexity: O(number of rows * number of columns).
def matrix_region_sum(matrix, top_left_coords, bottom_right_coords)

end

# Implement Merge Sort (Hint: this typically involves a helper function)
def merge_sort(array)

end

def merge(left, right)

end

# Implement binary search.
# Return nil if the target isn't found.
def binary_search(array, target)

end

# Given a list of numbers in an array, replace all the numbers
# with the product of all other numbers. Do this in O(n) time without
# using division.
def productify(array)

end

# Write a function that takes an array and returns all of its subsets.
def subsets(array)

end

# Take a string and return the indices of the start/end of the longest palindrome it contains.
# Your palindrome checker could reverse the string and compare it to the original, but that takes extra memory.
# Instead, you should be able to solve the problem with O(1) memory.
def longest_palindrome(string)

end

# Given two arrays, find the intersection of both sets.
# It should be trivial to write an O(n**2) solution. Use sorting to solve in O(nlog(n)).
# Next, improve this to O(n) time (maybe use a non-array datastructure).
def fast_intersection(array_one, array_two)

end

# Write a function that takes two arrays of integers and returns an array with all the subsets commmon to both.
# Don't generate all subsets of both array, which would take time exponential time.
# Instead, directly generate the subsets of both.
def common_subsets(array_one, array_two)

end

# Given an array and index,
# find if it's possible to reach 0 by starting at the index
# and repeatedly moving left/right by the distance found at array[index].
def can_win?(array, index)

end

# Assume an array of length n, containing the numbers 1..n in jumbled order.
# "Sort" this array in O(n) time.
# You should be able to do this without looking at the input.
def sort1(array)

end

# Assume an array of length n with numbers in the range 1..N (N >= n).
# Sort this array in O(n + N) time.
# You may use O(N) memory.
def sort2(array, max_value)

end

# Say I give you an array of n strings, each of length k.
# Merge sort can sort this in O(knlog(n)), since comparing a pair of strings takes O(k) time.
# Sort the strings in O(kn).
# Hint: do not compare any two strings.
# All strings contain only lowercase letters a..z without whitespace or punctuation.
def sort3(array, length)

end

# Given an array, move all zeros to the end.
# The order of non-zero elements does not matter.
# Try to accomplish this in O(n) time and O(1) space.
def move_zeros(array)

end

# Implement the 'look and say' function.
#'Look and say' takes an input array and outputs an array.
# The output array describes the count of the elements in the input array as they appear in order.
def look_and_say(array)

end

# Implement a stack with a method max that returns the maximum value.
# It should run in O(1) time.
class MaxStack
  def initialize
  end

  def push(value)
  end

  def pop
  end

  def max
  end
end
