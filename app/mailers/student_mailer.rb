class StudentMailer < ApplicationMailer
  default from: "asyao8903@gmail.com"

  def welcom_email(student)
    @student = student
    @url = 'http://www.google.com'
    mail(to: @student.email, subjecti: 'test welcome eamil')
end
