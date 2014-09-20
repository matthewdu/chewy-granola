class RenameColumnPublishedDate < ActiveRecord::Migration
  def change
  	rename_column :books, :published_date, :publication_date
  end
end
