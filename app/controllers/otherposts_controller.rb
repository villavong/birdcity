class OtherpostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_student!, except: [:index, :show]

  def index
    @otherposts = Otherpost.all.order("created_at DESC")
  end

  def show
  end

  def new
    @otherpost = current_student.otherposts.build
  end
  def create
    @otherpost = current_student.otherposts.build(post_params)

    if @otherpost.save
      redirect_to @otherpost
    else
      render 'new'
    end
  end
  def edit
  end

  def update
    if @otherpost.update (post_params)
      redirect_to @otherpost
    else
      render 'edit'
    end

  end


  def destroy
    @otherpost.destroy
    redirect_to otherposts_path
  end

  private

  def find_post
    @otherpost = Otherpost.find(params[:id])
  end


  def post_params
    params.require(:otherpost).permit(:title, :content, :photo)
  end
end
