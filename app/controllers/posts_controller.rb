class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_filter :require_permission, only: [:edit, :update, :destroy]
  before_action :authenticate_student!, only: [:new, :create]

  def show
  end

  def new
    @post = current_student.posts.build
  end
  def create
    @post = current_student.posts.build(post_params)

    if @post.save
      redirect_to @student
    else
      render 'new'
    end
  end
  def edit
  end

  def update
    if @post.update (post_params)
      redirect_to @student
    else
      render 'edit'
    end

  end


  def destroy
    @post.destroy
    redirect_to student_posts_path
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end


  def post_params
    params.require(:post).permit(:title, :content, :photo)
  end

  def require_permission
    @post = Post.find(params[:id])
    if current_student.id != @post.student_id
      redirect_to root_path, notice: "Sorry, you're not allowed"
    end

  end


end
