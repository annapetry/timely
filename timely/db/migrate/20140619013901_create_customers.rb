class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|

      t.string :name, :city, :state, :email
      t.integer :balance, :employees, :zipcode
      t.timestamps
    end
  end
end
