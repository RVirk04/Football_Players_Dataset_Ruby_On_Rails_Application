class PlayersController < ApplicationController
  def index
    @players = Player.includes(:country).all.paginate(page: params[:page], per_page: 10)
  end

  def show
    @player = Player.find(params[:id])
  end
end
