class GameController < ApplicationController
    def index
      session[:target] ||= rand(1..100)
      session[:message] = "Guess a number between 1 and 100"
    end
  
    def guess
      target = session[:target]
      guess = params[:guess].to_i
  
      if guess < target
        session[:message] = "Too low! Try again."
      elsif guess > target
        session[:message] = "Too high! Try again."
      else
        session[:message] = "You got it! The number was #{target}. Play again!"
        session[:target] = rand(1..100) # Reset the game
      end
  
      redirect_to root_path
    end
  end
