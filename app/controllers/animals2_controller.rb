class AnimalsController < ApplicationController

  def index
    @animals = Animal.new
  end

  def show
    @animal = Animal.find(params[:id])
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      flash[:notice] = "This was a new success"
      redirect_to @animal
    end
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update(animal_params)
      flash[:notice] = "This was updated"
      redirect_to @animal
    else
      render :edit
    end
  end

  def destroy
    animal = Animal.find(params[:id])
    animal.destroy
    redirect_to animal_path
  end

  def animal_params
    params.require(:animal).permit(:name, :type, :id)
  end

end