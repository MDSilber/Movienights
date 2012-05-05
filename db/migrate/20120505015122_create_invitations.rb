class CreateInvitations < ActiveRecord::Migration
  def up
    create_table :invitations do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end
end
