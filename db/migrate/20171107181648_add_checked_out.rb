class AddCheckedOut < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :checked_out, :boolean 
  end
end
