class SouthcommentsController < ApplicationController
  before_action :find_post, only: [:create, :edit, :update, :destroy]


  def create
    @southpost = Southpost.find(params[:southpost_id])

    @southcomment = @southpost.southcomments.create(params[:southcomment].permit(:comment))
    @southcomment.student = current_student if current_student
    @southcomment.save

    if @southcomment.save
      redirect_to southpost_path(@southpost)
    else
      render 'new'
    end
  end

  def destroy
    @southcomment = @southpost.southcomments.find(params[:id])
    @southcomment.destroy
    redirect_to southpost_path(@southpost)
  end
  def edit
    @southcomment = @southpost.southcomments.find(params[:id])
  end

  def update
    @southcomment = @southpost.southcomments.find(params[:id])

    if @southcomment.update(params[:southcomment].permit(:comment))
      redirect_to southpost_path(@southpost)
    else
      render 'edit'
    end
  end

  private
  def find_post
    @southpost = Southpost.find(params[:southpost_id])
  end
end
