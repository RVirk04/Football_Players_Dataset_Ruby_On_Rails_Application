class PlayersController < ApplicationController
  def index
    @players =  Player.includes(:country).paginate(page: params[:page], per_page: 10).search(params[:keyword], params[:search_category])
  end

  def show
    @player = Player.find(params[:id])
  end

end
