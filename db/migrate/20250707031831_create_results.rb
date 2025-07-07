class CreateResults < ActiveRecord::Migration[8.0]
  def change
    create_table :results do |t|
      t.references :page, null: false, foreign_key: true
      t.boolean :success

      t.timestamps
    end
  end
end
