class AddConstraintOnOriginsCountry < ActiveRecord::Migration
  def up
    change_column :origins, :country, :string, limit: 3
  end

  def down
    change_column :origins, :country, :string
  end
end
