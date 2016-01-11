class AddShortcodeToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :shortcode, :string
  end
end
