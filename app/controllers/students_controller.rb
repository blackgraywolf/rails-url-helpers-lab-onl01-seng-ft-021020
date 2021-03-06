require 'pry'
class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
       @student = Student.find(params[:id])
  end
  
  def activate
  # binding.pry
    puts "reached the activate method"
    @student = set_student
    puts "Student = #{@student}"
    puts "Current status is #{@student.active}"
    @student.active = !@student.active 
    puts "after !@student.active is run = #{@student.active}"
    @student.save
    redirect_to student_path(@student)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end