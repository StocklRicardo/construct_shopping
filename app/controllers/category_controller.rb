class CategoryController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.find_or_create_by(params_category)
    
    if @category.save!
      redirect_to category_index_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    if @category.update(params[:id])
      redirect_to category_index_path
    else
    render 'edit'
    end
  end

  def destroy
    @category = category.find(params[:id])
    @category.destroy
    redirect_to category_index_path
  end


  private

  def params_category
    params.require(:category).permit(:name, :id)
  end

end
