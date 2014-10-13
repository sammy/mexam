class AddReferenceToChapters < ActiveRecord::Migration
  change_table :chapters do |t|
    t.references :headchapter
  end
end
