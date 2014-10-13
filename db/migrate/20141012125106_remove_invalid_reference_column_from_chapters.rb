class RemoveInvalidReferenceColumnFromChapters < ActiveRecord::Migration
  def change
    remove_column :chapters, :headchapter_id_id
  end
end
