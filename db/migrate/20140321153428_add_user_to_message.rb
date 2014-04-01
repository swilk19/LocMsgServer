class AddUserToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :author_id, :int
  end
end
