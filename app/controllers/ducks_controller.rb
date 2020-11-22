class DucksController < ApplicationController

  def index
    @ducks = Duck.all
  end

  def show
    @duck = Duck.find(params[:id])
  end

  def edit
    @duck = Duck.find(params[:id]) 
  end

  def update
    duck = Duck.find(params[:id]) 
    duck.update(strong_params)
    redirect_to duck_path(duck) 
  end

  def new
    @duck = Duck.new
  end

  def create
    duck = Duck.create(strong_params)
    if duck.valid?
      redirect_to duck_path(duck)
    else
      flash[:duck_errors] = student.errors.full_messages
      redirect_to show_path
    end
  end

  private

  def strong_params
    params.require(:duck).permit(:name, :description, :student_id)
  end

end
