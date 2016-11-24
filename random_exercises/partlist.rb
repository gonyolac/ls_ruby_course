def partlist(arr)
  splits = []
  (0..arr.size-2).each do |x|
    splits << [arr[0..x].join(' '), arr[x+1..-1].join(' ')]
  end
  splits
end

p partlist(["az", "toto", "picaro", "zone", "kiwi"])