class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :hometown
      t.string :skill
      t.string :iconic_item
    end
  end
end
