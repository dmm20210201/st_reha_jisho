class AddUserIdToRehabilitations < ActiveRecord::Migration[5.2]
  def change
    add_column :rehabilitations, :user_id, :integer
  end
end
