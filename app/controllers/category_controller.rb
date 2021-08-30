class CategoryController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @user = current_user
    @category = @user.categories.new(params_category)
    
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
    @category = Category.find(params[:id])
      if @category.update params_category
        redirect_to category_index_path
      else
        render 'edit'
      end
  end

  def show
    @category = Category.find(params[:id])
    if @category.user_id == current_user.id
     @category
    else
      render :index, notice: "Deu ruim"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to category_index_path
  end


  private

  def params_category
    params.require(:category).permit(:name, :id)
  end

end
