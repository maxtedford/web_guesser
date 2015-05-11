require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)

get "/" do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end

def check_guess(guess)
  if guess.to_i > SECRET_NUMBER + 5
    "Way too high!"
  elsif guess.to_i > SECRET_NUMBER && guess.to_i <= SECRET_NUMBER + 5
    "Too high!"
  elsif guess.to_i < SECRET_NUMBER - 5
    "Way too low!"
  elsif guess.to_i < SECRET_NUMBER && guess.to_i >= SECRET_NUMBER - 5
    "Too low!"
  else
    "Correct! The secret number is #{SECRET_NUMBER}"
  end
end
