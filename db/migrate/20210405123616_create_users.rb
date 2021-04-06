class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name_kana
      t.string :affiliation
      t.text :introduction
      t.string :profile_image

      t.timestamps
    end
  end
end
