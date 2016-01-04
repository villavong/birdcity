class OtherpostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_student!
  before_filter :require_permission, only: [:edit, :update, :destroy]


  def index
    @otherposts = Otherpost.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 25)
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

  def require_permission
    @otherpost = Otherpost.find(params[:id])
    if current_student.id != @otherpost.student_id
      redirect_to root_path, notice: "Sorry, you're not allowed"
    end

  end

end
