class GossipsController < ApplicationController

  before_action :authenticate_user, only: [:new, :create, :show]
  
  def index
   @gossip = Gossip.all
  end

  def show
    if logged_in?
      @gossip = Gossip.find(params[:id])
    else
      flash[:notice] = "Connect to your account before !"
      redirect_to new_session_path
    end
  end

  def new
    if logged_in?
      @gossip = Gossip.new
    else
      flash[:notice] = "Connect to your account before !"
      redirect_to new_session_path
    end
  end

  def create
  	@gossip = Gossip.new('title' => params[:title], 'content' => params[:content], 'user_id' => current_user.id) 
    if @gossip.save 
      redirect_to '/'
    else
      render '/gossips/new'
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update('title' => params[:title], 'content' => params[:content], 'user_id' => @gossip.user_id)
      redirect_to @gossip
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Vous devez être connecté"
      redirect_to new_session_path
    end
  end

end
