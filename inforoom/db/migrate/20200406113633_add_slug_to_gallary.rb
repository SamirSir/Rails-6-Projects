class AddSlugToGallary < ActiveRecord::Migration[6.0]
  def change
    add_column :gallaries, :slug, :string
    add_index :gallaries, :slug, unique: true
  end
end
