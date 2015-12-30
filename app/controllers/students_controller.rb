class StudentsController < ApplicationController



  def index
    if params[:search]
      @students = Student.search(params[:search])
    else
      @students = Student.all
    end
  end
end
