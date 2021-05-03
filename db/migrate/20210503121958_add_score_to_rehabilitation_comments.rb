class AddScoreToRehabilitationComments < ActiveRecord::Migration[5.2]
  def change
    add_column :rehabilitation_comments, :score, :decimal, precision: 5, scale: 3
  end
end