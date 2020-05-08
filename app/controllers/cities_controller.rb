class CitiesController < ApplicationController

  def index
    
  end

  def show
  	puts "$" * 60
    puts "ceci est le contenu de params :"
    puts params
    puts "$" * 60
    @city = City.find(params[:id])
  end

  def new
    
  end

  def create
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end
end