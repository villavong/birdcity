class ChinapostsController < ApplicationController
  before_filter :require_permission, only: [:edit, :update, :destroy]

  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_student!, only: [:new, :create, :show]
  def index
    @chinaposts = Chinapost.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 25)
  end

  def show
  end

  def new
    @chinapost = current_student.chinaposts.build
  end
  def create
    @chinapost = current_student.chinaposts.build(post_params)

    if @chinapost.save
      redirect_to @chinapost
    else
      render 'new'
    end
  end
  def edit
  end

  def update
    if @chinapost.update (post_params)
      redirect_to @chinapost
    else
      render 'edit'
    end

  end


  def destroy
    @chinapost.destroy
    redirect_to chinaposts_path
  end

  private

  def find_post
    @chinapost = Chinapost.find(params[:id])
  end


  def post_params
    params.require(:chinapost).permit(:title, :content, :photo)
  end
  def require_permission
    @chinapost = Chinapost.find(params[:id])
    if current_student.id != @chinapost.student_id
      redirect_to root_path, notice: "Sorry, you're not allowed"
    end

  end

end
