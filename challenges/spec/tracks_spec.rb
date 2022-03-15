require 'tracks'

RSpec.describe "MyMusic class" do

  context "given an song with a title" do
    it "returns a message and adds to tracks array" do
      tracks = MyMusic.new
      expect(tracks.add("Lalisa", "Money")).to eq "Track added: Money by Lalisa."
      expect(tracks.add("Twice", "Fancy")).to eq "Track added: Fancy by Twice."
    end
  end

  context "calling my_tracks method" do
    it "returns a list of tracks added" do
      tracks = MyMusic.new
      tracks.add("Lalisa", "Money")  
      tracks.add("Twice", "Fancy") 
      tracks.add("Itzy", "Not Shy")
      tracks.add("Twice", "What Is Love")
      expect(tracks.my_tracks).to eq "My music: Money by Lalisa, Fancy by Twice, Not Shy by Itzy, What Is Love by Twice"
    end
  end

  context "when given missing title and/or artist" do
    it "fails" do
      tracks = MyMusic.new

      expect { tracks.add("", "Icy")}.to raise_error "Artist missing. Please try again."
      expect { tracks.add("Itzy", "")}.to raise_error "Title missing. Please try again."
      expect { tracks.add("", "")}.to raise_error "Artist and title missing. Please try again."
    end
  end

  context "when given a track that already exists" do
    it "fails" do
      tracks = MyMusic.new
      tracks.add("Lalisa", "Money") 
      expect { tracks.add("Lalisa", "Money")}.to raise_error "Track already exists."
    end
  end

end