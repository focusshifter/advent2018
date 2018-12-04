input = File.readlines('input.txt', chomp: true).sort

timeline = Hash.new { |hash, key| hash[key] = Hash.new([]) }

current_guard = nil
start_mark = 0

input.each do |line|
  case line
  # [1518-11-01 00:00] Guard #10 begins shift
  # $1 - day
  # $2 - minute
  # $3 - guard_num
  when /\[\d{4}-\d{2}-(\d{2}) \d{2}:(\d{2})\] Guard #(\d+) begins shift/
    current_guard = $3.to_i
    start_mark = 0
  # [1518-11-01 00:05] falls asleep
  when /\[\d{4}-\d{2}-(\d{2}) \d{2}:(\d{2})\] falls asleep/
    start_mark = $2.to_i
  # [1518-11-01 00:25] wakes up
  when /\[\d{4}-\d{2}-(\d{2}) \d{2}:(\d{2})\] wakes up/
    current_day = $1.to_i
    current_minute = $2.to_i
    timeline[current_guard][current_day] += [(start_mark..(current_minute - 1))]
  else
    raise 'Unrecognized input'
  end
end

sleep_by_guard = timeline.transform_values do |day|
  day.values.flatten
end

sleep_by_guard_sum = sleep_by_guard.transform_values do |ranges|
  ranges.map(&:count).sum
end

sleepy_guard = sleep_by_guard_sum.max_by { |_guard, sum| sum }.first

sleepy_ranges = sleep_by_guard[sleepy_guard]

occurences = sleepy_ranges.each_with_object(Array.new(60, 0)) do |range, occurences|
  range.each { |element| occurences[element] += 1 }
end

puts sleepy_guard * occurences.index(occurences.max)
