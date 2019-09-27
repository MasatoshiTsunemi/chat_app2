class DeleteColumnFromMessage < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :room
  end
end
