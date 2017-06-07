class CreateLibcompls < ActiveRecord::Migration[5.1]
  def change
    create_table :libcompls do |t|
      t.integer :libindex, null: false
      t.integer :area_id
      t.integer :question_index
      t.string :compliance_task, null: false
      t.string :compliance_details
      t.string :frequency
      t.string :website_link
      t.string :form_link
      t.string :task_details
      t.date :date
      t.boolean :demo

      t.timestamps
    end
  end
end
