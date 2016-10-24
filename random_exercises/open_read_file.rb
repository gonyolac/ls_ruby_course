#python runserver.py -a ptc -u cmartin0001 -u cmartin0003 -u cmartin0004 -u cmartin0005 -u cmartin0006 -u cmartin0007 -u cmartin0008 -p 36y808vw -k AIzaSyBBwfObpl2_YmEGpROmNzp1kd5eKoBllVg -l '-6.207099, 106.810187' -st 10 -sd 8

class TextAnalyzer
  def process
    file = File.open('sample_text.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts "#{file.split('/n/n').count paragraph}" }
analyzer.process { |file| puts "#{file.split('/n').count lines}" }
analyzer.process { |file| puts "#{file.split(' ').count words}" }