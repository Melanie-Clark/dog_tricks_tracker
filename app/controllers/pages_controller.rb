class PagesController < ApplicationController
  before_action :require_user, only: [ :dashboard ]

  def home
    redirect_to dashboard_path if current_user
  end

  def dashboard
    @tricks = Trick.all
  end

  def save_tricks
    params[:tricks]&.each do |id, data|
      trick = Trick.find(id)
      trick.update(complete: data[:complete] == "1")
    end
    redirect_to dashboard_path, notice: "Progress saved!"
  end
end
