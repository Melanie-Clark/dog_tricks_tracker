class PagesController < ApplicationController
  def home
  end
  
  def dashboard
    @tricks = Trick.all
  end
end