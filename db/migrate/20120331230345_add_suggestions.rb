class AddSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.integer :movie_id
      t.integer :event_id
    end
  end
end
