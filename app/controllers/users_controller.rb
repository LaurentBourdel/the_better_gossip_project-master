require 'bcrypt'
class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def index
  end

  def new
  end

  def create
    if params[:password_digest] == '' || params[:email] == ''
      flash[:Notice] = "Utilisateur non créé"
      render '/users/new'
     else
      @user = User.new
      @user = User.create('last_name': params[:last_name], 'first_name': params[:first_name], 'email': params[:email], 'age': params[:age], 'description': params[:description], 'city_id': params[:city].to_i, 'password': params[:password_digest])
      flash[:Notice] = "Utilisateur créé !"
      log_in(@user)
      redirect_to '/'
     end
  end

  def edit   
  end

  def update  
  end

  def destroy 
  end
  
end
