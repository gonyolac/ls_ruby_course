def mixed_fraction(fraction)
  return "0" if fraction.to_r == 0
  base = fraction
  fraction.count('-') == 2 ? base = base.gsub('-','') : nil
  fraction.index('-') == fraction.index('/') + 1 ? base = base.gsub('-','').prepend('-').to_r : nil
  binding.pry
  base = base.to_r
  base < 0 ? sign = '-' : sign = ''

  whole = base.numerator.abs / base.denominator.abs
  base.abs - whole.to_r == 0 ? base = '' : base = base.abs - whole.to_r
  whole > 0 ? "#{sign}#{whole} #{base}".strip : "#{sign}#{base}"
end