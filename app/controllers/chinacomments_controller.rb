class ChinacommentsController < ApplicationController
  before_action :find_post, only: [:create, :edit, :update, :destroy]
  before_filter :require_permission, only: [:edit, :update, :destroy]

  before_action :authenticate_student!, only: [:create]

  def create
    @chinapost = Chinapost.find(params[:chinapost_id])

    @chinacomment = @chinapost.chinacomments.create(params[:chinacomment].permit(:comment))
    @chinacomment.student = current_student if current_student
    @chinacomment.save

    if @chinacomment.save
      redirect_to chinapost_path(@chinapost)
    else
      render 'new'
    end
  end

  def destroy
    @chinacomment = @chinapost.chinacomments.find(params[:id])
    @chinacomment.destroy
    redirect_to chinapost_path(@chinapost)
  end
  def edit
    @chinacomment = @chinapost.chinacomments.find(params[:id])
  end

  def update
    @chinacomment = @chinapost.chinacomments.find(params[:id])

    if @chinacomment.update(params[:chinacomment].permit(:comment))
      redirect_to chinapost_path(@chinapost)
    else
      render 'edit'
    end
  end

  private
  def find_post
    @chinapost = Chinapost.find(params[:chinapost_id])
  end
  def require_permission
    @chinacomment = Chinacomment.find(params[:id])
    if current_student.id != @chinacomment.student_id
      redirect_to root_path, notice: "Sorry, you're not allowed"
    end

  end

end
