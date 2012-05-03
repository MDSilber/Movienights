class SetRoleDefault < ActiveRecord::Migration
  def self.up
    change_column :users, :role, :string, :default => "User"
  end

  def self.down
    #You can't currently remove default values in rails
    raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end
end
