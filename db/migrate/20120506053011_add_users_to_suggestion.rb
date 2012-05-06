class AddUsersToSuggestion < ActiveRecord::Migration
  def change
    add_column :suggestions, :user_id, :integer

  end
end
