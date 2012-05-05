class AddValueToRankings < ActiveRecord::Migration
  
  def change
    add_column :rankings, :value, :integer
  end

end
