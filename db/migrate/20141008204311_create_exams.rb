class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :title
      t.string :codename
      t.timestamps
    end
  end
end
