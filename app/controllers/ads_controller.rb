class AdsController < ApplicationController

  def index
    @ads = Ad.all
  end

  def new 
    @ad = Ad.new

  end

  def create
    @user = current_user
    @ad = @user.ads.new(params_ad)

    if @ad.save!
      redirect_to category_path(@ad.category.id), notice: "Ads creating sussefully!"
    else
      render :new
    end
  end
  
  def edit
    @ad = Ad.find(params[:id])
  end

  def update
    @ad = Ad.find(params[:id])
    if @ad.update(params_ad)
      redirect_to category_path(@ad.category.id), notice: "Ads updating sussefully!"
    else
      render :edit
    end
  end

  def show
    @ad = Ad.find(params[:id])
    if @ad.user.id == current_user.id
     @ad
    else
      render :index, notice: "Deu ruim"
    end
  end

  def destroy
    @ads = Ad.find(params[:id])
    category = @ads.category
    @ads.destroy
    redirect_to category_path(category.id)
  end

  private

  def params_ad
    params.require(:ad).permit(:id, :title, :category_id, :price, :description)
  end
end
