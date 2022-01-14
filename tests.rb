require_relative 'custom_enumerables'

def multiply_els(arr)
  arr.my_inject {|memo, item| memo * item}
end


numbers = [1, 2, 3, 4, 5]

numbers.my_each { |item| puts item }
puts "\n my_each VS each\n\n"
numbers.each  { |item| puts item }
puts "---------\n"

numbers.my_each_with_index { |item, index| puts "#{index}: #{item}" }
puts "\n my_each_with_index VS each_With_index \n\n"
numbers.each_with_index { |item, index| puts "#{index}: #{item}" }
puts "---------\n"

p numbers.my_select { |item| item > 2 }
puts "\n my_select VS select \n\n"
p numbers.select { |item| item > 2 }
puts "---------\n"

p numbers.my_all? { |item| item < 11 }
puts "\n my_all? VS all? \n\n"
p numbers.all? { |item| item < 11 }
puts "---------\n"

p numbers.my_any? { |item| item == 4 }
puts "\n my_any? VS any? \n\n"
p numbers.any? { |item| item == 4 }
puts "---------\n"

p numbers.my_none? { |item| item > 11 }
puts "\n my_any? VS any? \n\n"
p numbers.none? { |item| item > 11 }
puts "---------\n"

p numbers.my_count { |item| item.odd? }
puts "\n my_count? VS count \n\n"
p numbers.count { |item| item.odd? }
puts "---------\n"

p numbers.my_map { |item| item + 1 }
puts "\n my_map VS map \n\n"
p numbers.map { |item| item + 1 }
puts "---------\n"

p numbers.my_inject { |memo, item| memo + item }
puts "\n my_inject VS inject \n\n"
p numbers.inject { |memo, item| memo + item }
puts "---------\n"

p [2,4,5].my_inject { |memo, item| memo * item }
puts "\n my_inject VS inject \n\n"
p [2,4,5].inject { |memo, item| memo * item }
puts "---------\n"

puts multiply_els([2,4,5])

map_proc = Proc.new { |item| item + 1 }

p numbers.my_map(&map_proc)