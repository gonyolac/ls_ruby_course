def five_num(array)
  @array = array.sort
  @median = find_median(@array)

  if @array.size.odd?
    @lower = @array[0..((@array.size/2) -1)] << @median
    @upper = @array - @lower
  else
    @lower = @array[0..((@array.size/2) - 1)]
    @upper = @array[((@array.size/2))..(@array.size-1)]
  end

  @q1 = find_median(@lower)
  @q3 = find_median(@upper)

  return_array = [array.min, @q1, @median, @q3 , array.max]
end

def find_median(arr)
  arr.size.odd? ? arr[(arr.size/2)].to_f : (arr[(arr.size / 2) - 1] + arr[(arr.size / 2)]).to_f / 2
end