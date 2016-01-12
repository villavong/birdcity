class TokyocommentsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :destroy]
  before_filter :require_permission, only: [:edit, :update, :destroy]
  before_action :authenticate_student!, only: [:create]


  def create
    @tokyopost = Tokyopost.find(params[:tokyopost_id])

    @tokyocomment = @tokyopost.tokyocomments.create(params[:tokyocomment].permit(:comment))
    @tokyocomment.student = current_student if current_student
    @tokyocomment.save

    if @tokyocomment.save
      redirect_to tokyopost_path(@tokyopost)
    else
      render 'new'
    end
  end

  def destroy
    @tokyocomment = @tokyopost.tokyocomments.find(params[:id])
    @tokyocomment.destroy
    redirect_to tokyopost_path(@tokyopost)
  end
  def edit
    @tokyocomment = @tokyopost.tokyocomments.find(params[:id])
  end

  def update
    @tokyocomment = @tokyopost.tokyocomments.find(params[:id])

    if @tokyocomment.update(params[:tokyocomment].permit(:comment))
      redirect_to tokyopost_path(@tokyopost)
    else
      render 'edit'
    end
  end

  private
  def find_post
    @tokyopost = Tokyopost.find(params[:tokyopost_id])
  end
  def require_permission
    @tokyocomment = Tokyocomment.find(params[:id])
    if current_student.id != @tokyocomment.student_id
      redirect_to root_path, notice: "Sorry, you're not allowed"
    end

  end

end
