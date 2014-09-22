class ChangeColumnBooks < ActiveRecord::Migration
  def change
  	change_column :books, :seller_phone_number, :string
  end
end
