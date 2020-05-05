class GossipsController < ApplicationController

  def index
   @gossip = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create

  	puts "$" * 60
    puts "ceci est le contenu de params :"
    puts params
    puts "$" * 60
  	@gossip = Gossip.new('title' => params[:title], 'content' => params[:content], user_id: '1') # avec xxx qui sont les données obtenues à partir du formulaire

  if @gossip.save # essaie de sauvegarder en base @gossip
    puts "The super potin was succesfully saved !"
    redirect_to '/'
  else
    puts "Error : you need to complete this field / the title must be at least 3 characters longue / etc."
    render '/gossips/new'
  end

  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end
end
