class VietpostsController < ApplicationController
  before_filter :require_permission, only: [:edit, :update, :destroy]

  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_student!, only: [:new, :create, :show]
  def index

    if params[:search]
      @vietposts = Vietpost.search(params[:search]).paginate(:page => params[:page], :per_page => 25)
    else
      @vietposts = Vietpost.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 25)
    end
  end

  def show
  end

  def new
    @vietpost = current_student.vietposts.build
  end
  def create
    @vietpost = current_student.vietposts.build(post_params)

    if @vietpost.save
      redirect_to @vietpost
    else
      render 'new'
    end
  end
  def edit
  end

  def update
    if @vietpost.update (post_params)
      redirect_to @vietpost
    else
      render 'edit'
    end

  end


  def destroy
    @vietpost.destroy
    redirect_to vietposts_path
  end

  private

  def find_post
    @vietpost = Vietpost.find(params[:id])
  end


  def post_params
    params.require(:vietpost).permit(:title, :content, :photo)
  end
  def require_permission
    @vietpost = Vietpost.find(params[:id])
    if current_student.id != @vietpost.student_id
      redirect_to root_path, notice: "Sorry, you're not allowed"
    end

  end

end
