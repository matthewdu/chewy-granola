class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
    	t.string :course_code

    	t.string :title
    	t.string :author
    	t.string :publisher
    	t.datetime :published_date

    	t.string :seller_name
    	t.string :seller_email
    	t.integer :seller_phone_number

    	t.boolean :verified
    	t.timestamps
    end

    add_index :books, :course_code
    add_index :books, :seller_email
  end
end
