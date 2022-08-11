class CreateMangas < ActiveRecord::Migration[7.0]
  def change
    create_table :mangas do |t|
      t.string :title
      t.integer :year
      t.string :author

      t.timestamps
    end
  end
end
