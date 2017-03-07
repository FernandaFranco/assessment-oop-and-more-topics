# each

def each(array)
  index = 0
  while index < array.size
    yield(array[index])
    index += 1
  end

  array
end

# each([1, 2, 3, 4, 5]) do |num|
#   puts num
# end

# p each([1, 2, 3, 4, 5]) {|num| "do nothing"}.select{ |num| num.odd? }     # => [1, 3, 5]

# select

# def select(array)
#   index = 0
#   result = []
#   each(array) do |element|
#     result << element if yield(element)
#   end

#   result
# end
# array = [1, 2, 3, 4, 5]

# p select(array) { |num| num.odd? }       # => [1, 3, 5]
# p select(array) { |num| puts num }       # => [], because "puts num" returns nil and evaluates to false
# p select(array) { |num| num + 1 }   

def reduce(array, acc = 0)
  each(array) do |element|
    acc = yield(acc, element)
  end

  acc
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined met

def map(array)
  result = []
  each(array) do |element|
    result << yield(element)
  end

  result
end

p map(array) { |num| num.odd? ? num : 'even!' }
