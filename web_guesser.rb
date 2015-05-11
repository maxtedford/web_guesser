require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)
number = SECRET_NUMBER

get "/" do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:number => number, :message => message}
end

def check_guess(guess)
  number = SECRET_NUMBER
  if guess.to_i > number + 5
    "Way too high!"
  elsif guess.to_i > number && guess.to_i <= number + 5
    "Too high!"
  elsif guess.to_i < number - 5
    "Way too low!"
  elsif guess.to_i < number && guess.to_i >= number - 5
    "Too low!"
  else
    "Correct! The secret number is #{number}"
  end
end
