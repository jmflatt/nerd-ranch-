class AddForeignKeyConstraintToCoffeeBeansUsingFoerigner < ActiveRecord::Migration
  def change
    add_foreign_key(:coffee_beans, :roasters)
  end
end
