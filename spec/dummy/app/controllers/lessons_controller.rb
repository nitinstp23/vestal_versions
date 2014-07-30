class LessonsController < ApplicationController
  before_filter :find_student

  # VestalVersions before filter
  before_filter :set_vestal_versions_request_info

  def update
    lesson = @student.lessons.find(params[:id])
    lesson.title = 'Title After'
    lesson.save

    render nothing: true
  end

  private

  def find_student
    @student = Student.find(params[:student_id])
  end

  # Override VestalVersions `user_for_vestal_versions`
  def user_for_vestal_versions
    @student
  end
end
