class AddCodenameToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :codename, :string
  end
end
