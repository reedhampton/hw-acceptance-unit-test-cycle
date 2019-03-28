FactoryBot.define do
  factory :movie do
    title { 'Title' }
    rating { 'G' }
    description { 'This is a movie' }
    release_date { '2019-03-28' }
  end
end