class CreateLessons < ActiveRecord::Migration
  def self.up
    create_table :lessons, :force => true do |t|
      t.string :title
      t.integer :student_id
      t.timestamps
    end
  end

  def self.down
    drop_table :lessons
  end
end
