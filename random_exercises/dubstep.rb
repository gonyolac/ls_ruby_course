def song_decoder(song)
  song.gsub(/(WUB)/,' ').split(' ').join(' ')
end

p song_decoder("AWUBWUBWUBBWUBWUBWUBCWUBFUCKWUB")