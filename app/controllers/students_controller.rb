class StudentsController < ApplicationController
  
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student_name = session[:student_name]
    session[:student_name] = nil
  end

  def create
    @student = Student.create(first_name: params[:student][:first_name], last_name: params[:student][:last_name])
    session[:student_name] = @student.to_s
    redirect_to new_student_path
  end

end
