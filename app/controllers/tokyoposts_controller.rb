class TokyopostsController < ApplicationController
  before_action :require_permission, only: [:edit, :update, :destroy]

  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_student!, only: [:new, :create]

  def index
    if params[:search]
      @tokyoposts = Tokyopost.search(params[:search]).paginate(:page => params[:page], :per_page => 25)
    else
      @tokyoposts = Tokyopost.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 25)
    end
  end

  def show
  end

  def new
    @tokyopost = current_student.tokyoposts.build
  end
  def create
    @tokyopost = current_student.tokyoposts.build(post_params)

    if @tokyopost.save
      redirect_to @tokyopost
    else
      render 'new'
    end
  end
  def edit
  end

  def update
    if @tokyopost.update (post_params)
      redirect_to @tokyopost
    else
      render 'edit'
    end

  end


  def destroy
    @tokyopost.destroy
    redirect_to tokyoposts_path
  end

  private

  def find_post
    @tokyopost = Tokyopost.find(params[:id])
  end


  def post_params
    params.require(:tokyopost).permit(:title, :content, :photo)
  end
  def require_permission
    @tokyopost = Tokyopost.find(params[:id])
    if current_student.id != @tokyopost.student_id
      redirect_to root_path, notice: "Sorry, you're not allowed"
    end

  end
end
