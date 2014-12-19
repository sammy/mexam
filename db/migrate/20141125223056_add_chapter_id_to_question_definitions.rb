class AddChapterIdToQuestionDefinitions < ActiveRecord::Migration
  def change
    add_column :question_definitions, :chapter_id, :integer
  end
end
