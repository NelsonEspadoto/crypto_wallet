class WelcomeController < ApplicationController
  def index
    cookies[:curso] = "Curso de Ruby on Rails [cookies]"
    session[:curso] = "Curso de Ruby on Rails [session]"
  end
end
