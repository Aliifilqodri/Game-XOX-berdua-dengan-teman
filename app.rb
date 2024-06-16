require 'sinatra'
require 'json'

set :bind, '0.0.0.0'

high_scores = []

post '/score' do
  request.body.rewind
  data = JSON.parse(request.body.read)
  high_scores << data['score']
  high_scores = high_scores.sort.reverse.take(10)

  content_type :json
  { high_scores: high_scores }.to_json
end

get '/scores' do
  content_type :json
  { high_scores: high_scores }.to_json
end
