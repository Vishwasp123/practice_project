class AddCountryAttrInEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column :employees ,:country ,:string
  end
end
