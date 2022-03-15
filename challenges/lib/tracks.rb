class MyMusic

  def initialize
    @my_music = []
  end

  def add(artist, title)
    fail "Artist and title missing. Please try again." if artist.empty? && title.empty?   #order of fail conditions matter
    fail "Artist missing. Please try again." if artist.empty?
    fail "Title missing. Please try again." if title.empty?
    fail "Track already exists." if @my_music.include? "#{title} by #{artist}"
    added_track = "#{title} by #{artist}"
    @my_music << added_track
    return "Track added: #{title} by #{artist}."
  end

  def my_tracks
    return "My music: #{@my_music.join(", ")}"
  end
end