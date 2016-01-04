class EastpostsController < ApplicationController
  before_filter :require_permission, only: [:edit, :update, :destroy]

  before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_student!

  def index
    @eastposts = Eastpost.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 25)
  end

  def show
  end

  def new
    @eastpost = current_student.eastposts.build
  end
  def create
    @eastpost = current_student.eastposts.build(post_params)

    if @eastpost.save
      redirect_to @eastpost
    else
      render 'new'
    end
  end
  def edit
  end

  def update
		if @eastpost.update (post_params)
			redirect_to @eastpost
		else
			render 'edit'
		end

	end


  def destroy
    @eastpost.destroy
    redirect_to eastposts_path
  end

  private

  def find_post
    @eastpost = Eastpost.find(params[:id])
  end


  def post_params
    params.require(:eastpost).permit(:title, :content, :photo)
  end
  def require_permission
    @eastpost = Eastpost.find(params[:id])
    if current_student.id != @eastpost.student_id
      redirect_to root_path, notice: "Sorry, you're not allowed"
    end

  end

end
