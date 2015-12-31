class StudentsController < ApplicationController
  before_action :find_student, only: [:show]



    def index
      if params[:search]
        @students = Student.search(params[:search]).paginate(:page => params[:page], :per_page => 25)
      else
        @students = Student.all.paginate(:page => params[:page], :per_page => 25)
      end
    end

    def show

    end




    private


    def find_student
      if params[:id].nil?
        @student = current_student
      else
        @student = Student.find(params[:id])
      end

    end
end
