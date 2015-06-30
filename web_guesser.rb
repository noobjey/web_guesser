require 'sinatra'
require 'sinatra/reloader'

set :secret_number, Random.rand(100)

get '/' do
  guess   = params["guess"]
  message =''

  if !guess.nil?
    message = check_guess(guess)
  end

  erb :index, :locals => { secret_number: settings.secret_number, message: message }

end

def to_high?(guess)
  guess.to_i > settings.secret_number
end

def to_low?(guess)
  guess.to_i < settings.secret_number
end

def way_to_high?(guess)
  guess.to_i > settings.secret_number + 5
end

def way_to_low?(guess)
  guess.to_i < settings.secret_number - 5
end

def correct?(guess)
  guess.to_i.eql?(settings.secret_number)
end

def check_guess(guess)
  if correct?(guess)
    "You got it right!<br/>The secret number is: #{settings.secret_number}"
  elsif way_to_high?(guess)
    "Way to High"
  elsif to_high?(guess)
    "To High"
  elsif way_to_low?(guess)
    "Way to Low"
  elsif to_low?(guess)
    "To Low"
  else
    ''
  end
end
