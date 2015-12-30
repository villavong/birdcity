class StudentsController < ApplicationController



  def index
      query = params[:q].presence || "*"
      @students = Student.search(query)
  end

end
