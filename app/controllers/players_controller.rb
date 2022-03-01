class PlayersController < ApplicationController
  def index
    @players = Player.includes(:country).all
  end

  def show
  end
end
