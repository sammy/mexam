class AddExamIdToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :exam_id, :integer
  end
end
