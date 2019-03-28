class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.sim_movies passed_movie
    dir = Movie.find_by(title: passed_movie).director

    movies_with_dir = Movie.where(director: dir)
  end
end
