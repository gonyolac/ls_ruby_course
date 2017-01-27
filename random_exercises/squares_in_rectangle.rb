def sqInRect(lng, wdth)
  return nil if lng == wdth
  final = []
  array = [lng, wdth]
  loop do
    break if array.reduce(:*) <= 0
    final << array.min
    array = array.map {|x| x == array.max ? x -= array.min : x}
  end
  final
end