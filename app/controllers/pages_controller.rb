class PagesController < ApplicationController
  before_action :require_user, only: [ :dashboard ]

  def home
  end

  def dashboard
    @tricks = Trick.all
  end
end
