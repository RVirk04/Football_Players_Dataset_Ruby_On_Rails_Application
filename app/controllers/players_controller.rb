class PlayersController < ApplicationController
  def index
    @players =  Player.includes(:country).paginate(page: params[:page], per_page: 10).search(params[:keyword], params[:search_category])
  end

  def show
    @player = Player.find(params[:id])
  end

  # def new
  #   @player = Player.new
  # end

  # def edit

  # end

  # def create
  #   @player = Player.new(task_params)

  #   respond_to do |format|
  #     if @player.save
  #       format.html {redirect_to @player, notice: "Player was added successfully!"}
  #       format.csv { send_data @players.to_csv, filename: "players.csv"}
  #     else
  #       format.html { remder :new}
  #       format.csv { remder csv: @task.errors}
  #     end
  #   end
  # end

  # def update
  #   respond_to do |task_params|
  #     if @player.save
  #       format.html {redirect_to @player, notice: "Player was updated successfully!"}
  #       format.csv { send_data @players.to_csv, filename: "players.csv"}
  #     else
  #       format.html { remder :edit}
  #       format.csv { remder csv: @task.errors}
  #     end
  #   end
  # end

  # def destroy
  #   @player.destroy
  #   respond_to |format|
  #   format.html {redirect_to player_path, notice: "Player was updated successfully!"}
  #   format.csv { head :no content}
  # end

  # private
  #   def set_task

  #   end
  #   def task_params

  #   end
end
