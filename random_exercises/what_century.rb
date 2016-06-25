def century(year)
  century = 0
  if year % 100 == 0
    century = year / 100
  else
    century = (year / 100) + 1
  end
  
  final = ''
  if (10..20).to_a.include?(century)
    final = century.to_s + 'th'
  elsif century.to_s.chars.last == '1'
    final = century.to_s + 'st'
  elsif century.to_s.chars.last == '2'
    final = century.to_s + 'nd'
  elsif century.to_s.chars.last == '3'
    final = century.to_s + 'rd'
  else
    final = century.to_s + 'th'
  end
  final
end