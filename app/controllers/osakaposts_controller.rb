class OsakapostsController < ApplicationController
  before_action :require_permission, only: [:edit, :update, :destroy]

  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_student!, only: [:new, :create]

  def index
    @osakaposts = Osakapost.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 25)
  end

  def show
  end

  def new
    @osakapost = current_student.osakaposts.build
  end
  def create
    @osakapost = current_student.osakaposts.build(post_params)

    if @osakapost.save
      redirect_to @osakapost
    else
      render 'new'
    end
  end
  def edit
  end

  def update
    if @osakapost.update (post_params)
      redirect_to @osakapost
    else
      render 'edit'
    end

  end


  def destroy
    @osakapost.destroy
    redirect_to osakaposts_path
  end

  private

  def find_post
    @osakapost = Osakapost.find(params[:id])
  end


  def post_params
    params.require(:osakapost).permit(:title, :content, :photo)
  end
  def require_permission
    @osakapost = Osakapost.find(params[:id])
    if current_student.id != @osakapost.student_id
      redirect_to root_path, notice: "Sorry, you're not allowed"
    end

  end
end
