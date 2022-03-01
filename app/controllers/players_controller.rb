class PlayersController < ApplicationController
  def index
    @players = Player.includes(:country).all
  end

  def show
    @player = Player.find(params[:id])
  end
end
