def zebulansNightmare(functionName)
  functionName.split('_').map.with_index {|string, idx| idx == 0 ? string : string.capitalize}.join('')
end

p zebulansNightmare('123_case')