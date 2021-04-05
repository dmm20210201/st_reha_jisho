class CreateRehabilitaionComments < ActiveRecord::Migration[5.2]
  def change
    create_table :rehabilitaion_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :rehabilitation_id

      t.timestamps
    end
  end
end
