require_relative '../spec_helper'

RSpec.describe LessonsController, :type => :controller do
  describe 'PUT #update' do

    before do
      @student = Student.new(name: 'Nitin Misra')
      @student.save!
      @lesson = @student.lessons.new(title: 'Title Before')
      @lesson.save!
    end

    it 'creates version with request info' do
      # Settings should be blank initially.
      expect(VestalVersions.vestal_versions_store).to eq({})

      put :update, student_id: @student.id, id: @lesson.id

      @lesson.reload

      version = @lesson.versions.last

      expect(version.user).to        eq(VestalVersions.vestal_versions_store[:user])
      expect(version.ip_address).to  eq(VestalVersions.vestal_versions_store[:ip_address])
      expect(version.user_agent).to  eq(VestalVersions.vestal_versions_store[:user_agent])
      expect(version.request_url).to eq(VestalVersions.vestal_versions_store[:request_url])
    end

  end
end
