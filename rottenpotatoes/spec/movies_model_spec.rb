require 'rails_helper'
require 'pp'

describe Movie do
  describe "Find all the similar movies" do
    jackson_movie_one = FactoryBot.build(:movie, title: "Lord of the Rings", director: 'Peter Jackson')
    tarantino_movie_one = FactoryBot.build(:movie, title: 'The Hateful Eight', director: 'Quentin Tarantino')
    FactoryBot.build(:movie, title: 'Once Upon A Time in Hollywood', director: 'Quentin Tarantino')

    context "There exists a similar movie with the same director" do
      it "finds the other tarantino movie correctly" do
        Movie.sim_movies(tarantino_movie_one.title).each do |movie|
            expect(movie.title).to eql("The Hateful Eight").or eq("Once Upon A Time in Hollywood")
        end
        
        Movie.sim_movies(tarantino_movie_one.title).each do |movie|
            expect(movie.title).to_not eql("Lord of the Rings")
        end
        
      end
    end

    context "There DOES NOT exist a similar movie with the same director" do
      it 'Checks the sad path of no other movies for this director existing' do
        Movie.sim_movies(jackson_movie_one.title).each do |movie|
            expect(movie.title).to eql("Lord of the Rings")
        end
        
        Movie.sim_movies(jackson_movie_one.title).each do |movie|
            expect(movie.title).to_not eql("The Hateful Eight")
        end
        
        Movie.sim_movies(jackson_movie_one.title).each do |movie|
            expect(movie.title).to_not eql("Once Upon A Time in Hollywood")
        end
      end
    end
  end
end