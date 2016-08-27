# Loos controller
class LoosController < ApplicationController

  def index
    @loos = Loo.all
  end

  def new
    @loo = Loo.new
  end

  def create
    @loo = Loo.create(loo_params)
    redirect_to '/loos'
  end

  def show
    @loo = Loo.find(params[:id])
  end

  def edit
    @loo = Loo.find(params[:id])
  end

  def update
    @loo = Loo.find(params[:id])
    @loo.update(loo_params)
    redirect_to "/loos/#{@loo.id}"
  end

  def destroy
    @loo = Loo.find(params[:id])
    @loo.destroy
    flash[:notice] = "Loo Deleted Successfully"
    redirect_to '/loos'
  end
  private

  def loo_params
    params.require(:loo).permit(:title, :image)
  end

end
