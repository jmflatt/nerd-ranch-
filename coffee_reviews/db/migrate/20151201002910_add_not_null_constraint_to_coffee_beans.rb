class AddNotNullConstraintToCoffeeBeans < ActiveRecord::Migration
  def change
    change_column :coffee_beans, :name, :string, null: false
  end
end
