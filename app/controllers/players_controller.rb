class PlayersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_player, only: [:show, :edit, :update, :destroy]
  def index
    @players = Player.all
  end

  def new
    @player = Player.new
    @entity = Entity.new
  end

  def show
  end

  def create
    me = current_user
    @player = me.build_player(player_params)
    @entity = @player.build_entity(entity_params)
    if @player.save && @entity.save
      #flash[:info] = "Point on the map created"
      redirect_to players_path
    else
      render 'new'
    end
  end

  def destroy
    Player.find(params[:id]).destroy
    #flash[:success] = "Point deleted"
    redirect_to players_path
  end

  def edit
  end

  def update
    if @player.update_attributes(player_params)
      #flash[:success] = "Point updated"
      redirect_to @player
    else
      render 'edit'
    end
  end

  private

    def player_params
      params.require(:player).permit(:username)
    end

    def entity_params
      params.require(:entity).permit(:map_point_id, :name, :description)
    end


    def set_player
      @player = Player.find(params[:id])
    end
end