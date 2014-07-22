class AddChapterIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :chapter_id, :integer
  end
end
