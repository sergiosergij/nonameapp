class DropMangas < ActiveRecord::Migration[7.0]
  def change
    drop_table :mangas, force: :cascade, if_exists: true
  end
end
