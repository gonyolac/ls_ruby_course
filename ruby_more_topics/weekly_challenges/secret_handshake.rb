class SecretHandshake
  def initialize(input)
    input.to_s != "0" ? @input = input.to_i.to_s(2) : nil
  end

  def commands
    handshake_array = []
    @input[-1] == "1" ? handshake_array << "wink" : nil
    @input[-2] == "1" ? handshake_array << "double blink" : nil
    @input[-3] == "1" ? handshake_array << "close your eyes" : nil
    @input[-4] == "1" ? handshake_array << "jump" : nil
    @input[-5] == "1" ? handshake_array.reverse! : nil
    handshake_array
  end
end