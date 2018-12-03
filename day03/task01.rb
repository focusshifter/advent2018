input = File.readlines('input.txt', chomp: true)

def paint(canvas, coords)
  coords['w'].times do |i|
    coords['h'].times do |j|
      x = coords['x1'] + i
      y = coords['y1'] + j
      canvas[[x, y]] += 1
    end
  end
  canvas
end

squares = input.map do |str|
  coords = str.match(/\#(?<id>\d+) @ (?<x1>\d+),(?<y1>\d+): (?<w>\d+)x(?<h>\d+)/)
              .named_captures
  coords.transform_values!(&:to_i)
  coords['x2'] = coords['x1'] + coords['w']
  coords['y2'] = coords['y1'] + coords['h']
  coords
end

canvas = Hash.new(0)

squares.each do |coords|
  canvas = paint(canvas, coords)
end

puts canvas.values.reject { |value| value < 2 }.count
