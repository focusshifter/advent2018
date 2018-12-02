input = File.readlines('input.txt', chomp: true)

length = input.first.length

result = []

length.times do |i|
  processed_input = input.map do |str|
    str.slice(0, i).to_s + str.slice(i + 1, length).to_s
  end

  result = processed_input.group_by { |e| e }.values.reject { |value| value.count < 2 }

  break if result.count > 0
end

puts result.first.first
