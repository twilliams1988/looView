class CreateLoos < ActiveRecord::Migration[5.0]
  def change
    create_table :loos do |t|
      t.string :title
      t.integer :likes

      t.timestamps
    end
  end
end
