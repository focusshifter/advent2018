input = File.readlines('input.txt', chomp: true).first

def react(str)
  chars = str.chars
  i = 0
  while i < chars.length - 1
    if (chars[i] != chars[i + 1]) && chars[i].casecmp(chars[i + 1]).zero?
      2.times { chars.delete_at(i) }
      i -= 1 if i > 0
    else
      i += 1
    end
  end

  chars
end

uniq_chars = input.downcase.chars.uniq

lengths = {}

best_char = uniq_chars.min_by do |char|
  lengths[char] = react(input.gsub(/#{char}/i, '')).count
end

puts lengths[best_char]
