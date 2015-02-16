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
      flash[:notice] = "HELL YEAH! NICE CREATION"
      redirect_to @animal
    end
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update(animal_params)
      flash[:notice] = "OH SNAP! YOU JUST UPDATED THAT SHIT"
      redirect_to @animal
    else
      render :edit
    end
  end

  def destroy
    animal = Animal.find(params[:id])
    animal.destroy
    redirect_to animals_path
  end

  def animal_params
    params.require(:animal).permit(:name, :type, :age)
  end

end
