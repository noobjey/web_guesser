require 'sinatra'
require 'sinatra/reloader'

secret_number = Random.rand(100)

get '/' do
  secret_number
  erb :index, :locals => {secret_number: secret_number }
end
