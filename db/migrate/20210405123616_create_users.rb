class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :name_kana
      t.string :email
      t.string :encrypted_password
      t.string :affiliation
      t.text :introduction
      t.string :profile_image

      t.timestamps
    end
  end
end
