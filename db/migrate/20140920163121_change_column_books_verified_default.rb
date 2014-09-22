class ChangeColumnBooksVerifiedDefault < ActiveRecord::Migration
  def change
  	change_column :books, :verified, :boolean, default: false
  end
end
