class AddCreatedAtAndUpdatedAtToCoffeeBeansTable < ActiveRecord::Migration
  def change
    add_column :coffee_beans, :updated_at, :datetime
    add_column :coffee_beans, :created_at, :datetime
  end
end
