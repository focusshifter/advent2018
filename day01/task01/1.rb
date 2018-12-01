input = File.readlines('input.txt').map(&:to_i)

puts "Task 1: #{input.sum}"

steps = {}
current = 0

input.cycle do |element|
  steps[current] = steps[current].to_i + 1
  break if steps[current] > 1
  current += element
  # puts steps.inspect
  # puts "#{current}, #{steps.count}"
end

puts "Task 2: #{current}"
