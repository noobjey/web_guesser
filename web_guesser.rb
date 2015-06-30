require 'sinatra'
require 'sinatra/reloader'

secret_number = Random.rand(100)

get '/' do
  "The secret number is #{secret_number}".upcase
end
