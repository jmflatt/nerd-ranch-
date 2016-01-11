class AddClosedToComments < ActiveRecord::Migration
  def change
    add_column :comments, :closed, :boolean
  end
end
