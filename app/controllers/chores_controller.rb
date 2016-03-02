class ChoresController < ApplicationController
  def index
    @chores = Chore.all
  end

  def new
    @chore = Chore.new
  end

  def create
    @chore = Chore.new(chore_params)

    if @chore.save
      redirect_to chores_path
    else
      render :new
    end
  end

  def edit
    @chore = Chore.find(params[:id])
  end

  def update
    @chore = Chore.find(params[:id])

    if @chore.update(chore_params)
      redirect_to chores_path
    else
      render :edit
    end
  end

private
  def chore_params
    params.require(:chore).permit(:title)
  end




end
