class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :position
      t.string :title
      t.boolean :is_done

      t.timestamps
    end
  end
end
