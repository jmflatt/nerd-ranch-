class AddForeignKeyConstraintToCoffeeBeans < ActiveRecord::Migration
  def up
    execute <<-SQL
    ALTER TABLE coffee_beans
      ADD CONSTRAINT fk_coffee_beans_roasters
      FOREIGN KEY (roaster_id)
      REFERENCES roasters(id)
    SQL
  end

  def down
      execute <<-SQL
      ALTER TABLE coffee_beans
        DROP CONSTRAINT fk_coffee_beans_roasters
      SQL
  end 
end
