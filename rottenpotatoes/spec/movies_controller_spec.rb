require 'rails_helper'

describe MoviesController, :type => :controller do
    
  describe 'Test the sim_search function functionality' do
    #The movie "Title" was created by facotrybot with no director
    it "When the specified movie has no director, we should return to the /movies page" do
      Movie.stub(:sim_movies).with('Title').and_return(nil)
      get :sim_search, { title: 'Title' }
      expect(response).to redirect_to(movies_path)
    end
  end
end