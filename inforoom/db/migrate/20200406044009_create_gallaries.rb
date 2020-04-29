class CreateGallaries < ActiveRecord::Migration[6.0]
  def change
    create_table :gallaries do |t|
      t.string :name
      t.text :detail

      t.timestamps
    end
  end
end
