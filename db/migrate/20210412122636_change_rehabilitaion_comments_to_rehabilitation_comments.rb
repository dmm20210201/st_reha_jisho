class ChangeRehabilitaionCommentsToRehabilitationComments < ActiveRecord::Migration[5.2]
  def change
    rename_table :rehabilitaion_comments, :rehabilitation_comments
  end
end
