class AddReferencesToChapters < ActiveRecord::Migration
  change_table :chapters do |t|
    t.references :headchapter_id
  end
end
