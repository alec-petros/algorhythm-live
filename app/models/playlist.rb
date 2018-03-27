class Playlist < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :tracks
  has_and_belongs_to_many :artists
  has_and_belongs_to_many :genres
  accepts_nested_attributes_for :tracks, :artists

  def generate
    args = {}
    if !tracks.empty?
      args[:seed_tracks] = tracks.map(&:spot_id)
    end
    if !artists.empty?
      args[:seed_artists] = artists.map(&:spot_id)
    end
    if !genres.empty?
      args[:seed_genres] = genres.map(&:name).map(&:downcase)
    end
    RSpotify::Recommendations.generate(args)
  end

  def tracks_string
    output = tracks.map(&:name).join(", ")
    output
  end

  def artists_string
    output = artists.map(&:name).join(", ")
    output
  end

  def genres_string
    output = genres.map(&:name).join(", ")
    output
  end

  def render_attributes(artists, tracks, genres)
    # byebug
    artists.each do |k, obj|
      self.artists << Artist.find_artist(obj[:spot_id])
    end
    tracks.each do |k, obj|
      self.tracks << Track.find_track(obj[:spot_id])
    end
    genres.split(", ").each do |genre|
      self.genres << Genre.find_or_create_by(name: genre)
    end
  end
end
