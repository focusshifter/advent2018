input = File.readlines('input.txt', chomp: true).first

chars = input.chars
i = 0
while i < chars.length - 1
  if (chars[i] != chars[i + 1]) && chars[i].casecmp(chars[i + 1]).zero?
    2.times { chars.delete_at(i) }
    i -= 1 if i > 0
  else
    i += 1
  end
end

puts chars.count
