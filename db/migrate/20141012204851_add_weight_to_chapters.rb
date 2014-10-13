class AddWeightToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :weight, :integer
  end
end
