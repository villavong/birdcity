class PostsController < ApplicationController
  before_action :find_student, only: [:edit, :update, :destroy]
  before_action :authenticate_student!, except: [:index, :show]

  before_filter :require_permission, only: [:new, :edit, :update, :destroy]

  def new
    @post = current_student.posts.build
  end
  def create
    @student = Student.find(params[:student_id])


    @post = @student.posts.build(params[:post].permit(:title, :content, :photo))
    @post.author_email = current_student.email
    @post.author_id = current_student.id
    @post.save

    if @post.save
      redirect_to student_path(@student)
    else
      render 'new'
    end
  end

  def destroy
    @post = @student.posts.find(params[:id])
    @post.destroy
    redirect_to student_path(@student)
  end
  def edit
    @post = @student.posts.find(params[:id])
  end

  def update
    @post = @student.posts.find(params[:id])

    if @post.update(params[:post].permit(:title, :content, :photo))
      redirect_to student_path(@student)
    else
      render 'edit'
    end
  end

  private
  def find_student
    @student = Student.find(params[:student_id])
  end
  def require_permission
    @post = Post.find(params[:id])
    if current_student.id != @post.student_id
      redirect_to root_path, notice: "Sorry, you're not allowed"
    end

  end



end
