class SouthpostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_student!, except: [:index, :show]

  def index
    @southposts = Southpost.all.order("created_at DESC")
  end

  def show
  end

  def new
    @southpost = current_student.southposts.build
  end
  def create
    @southpost = current_student.southposts.build(post_params)

    if @southpost.save
      redirect_to @southpost
    else
      render 'new'
    end
  end
  def edit
  end

  def update
    if @southpost.update (post_params)
      redirect_to @southpost
    else
      render 'edit'
    end

  end


  def destroy
    @southpost.destroy
    redirect_to southposts_path
  end

  private

  def find_post
    @southpost = Southpost.find(params[:id])
  end


  def post_params
    params.require(:southpost).permit(:title, :content, :photo)
  end
end
