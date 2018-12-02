input = File.readlines('input.txt', chomp: true)

counts = {
  doubles: 0,
  triples: 0
}

input.each do |str|
  str_counts = str.split('').each_with_object(Hash.new(0)) do |char, total|
    total[char] += 1
  end.values

  counts[:doubles] += 1 if str_counts.include? 2
  counts[:triples] += 1 if str_counts.include? 3
end

puts counts[:doubles] * counts[:triples]
