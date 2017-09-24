class AddRemark < ActiveRecord::Migration[5.1]
  def change
    add_column :dictionaries, :remark, :string
  end
end
