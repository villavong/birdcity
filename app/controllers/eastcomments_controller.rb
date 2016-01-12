class EastcommentsController < ApplicationController
  before_action :find_post, only: [:create, :edit, :update, :destroy]
  before_filter :require_permission, only: [:edit, :update, :destroy]
  before_action :authenticate_student!, only: [:create]


  def create
    @eastpost = Eastpost.find(params[:eastpost_id])

    @eastcomment = @eastpost.eastcomments.create(params[:eastcomment].permit(:comment))
    @eastcomment.student = current_student if current_student
    @eastcomment.save

    if @eastcomment.save
      redirect_to eastpost_path(@eastpost)
    else
      render 'new'
    end
  end

  def destroy
    @eastcomment = @eastpost.eastcomments.find(params[:id])
    @eastcomment.destroy
    redirect_to eastpost_path(@eastpost)
  end
  def edit
    @eastcomment = @eastpost.eastcomments.find(params[:id])
  end

  def update
    @eastcomment = @eastpost.eastcomments.find(params[:id])

    if @eastcomment.update(params[:eastcomment].permit(:comment))
      redirect_to eastpost_path(@eastpost)
    else
      render 'edit'
    end
  end

  private
  def find_post
    @eastpost = Eastpost.find(params[:eastpost_id])
  end
  def require_permission
    @eastcomment = Eastcomment.find(params[:id])
    if current_student.id != @eastcomment.student_id
      redirect_to root_path, notice: "Sorry, you're not allowed"
    end

  end

end
