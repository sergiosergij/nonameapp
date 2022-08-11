class MangasController < ApplicationController
  def index
    @mangas = Manga.all
  end

  def show
    @manga = Manga.find(params[:id])
  end

  def new 
    @manga = Manga.new
  end

  def edit
  end

  def create
    @manga = Manga.new(params.require(:manga).permit(:title, :year, :author, :file))
    @manga.save
    redirect_to root_path
  end

  def update
  end

  def destroy
    #@manga = Manga.find(params[:id])
    #@manga.file.purge 
  end
  

end
