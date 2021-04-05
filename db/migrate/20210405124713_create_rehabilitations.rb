class CreateRehabilitations < ActiveRecord::Migration[5.2]
  def change
    create_table :rehabilitations do |t|
      t.string :training_name
      t.string :speech_pathological_findings
      t.text :adaptation_precautions
      t.text :items
      t.text :training_content
      t.string :training_image

      t.timestamps
    end
  end
end
