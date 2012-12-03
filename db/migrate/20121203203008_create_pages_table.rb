class CreatePagesTable < ActiveRecord::Migration
  def up
    create_table :pages do |t|
      t.integer :fb_id, :null => false, :limit => 8 # Big INT to save FB Pages ID
    end

    add_index :pages, :fb_id
  end

  def down
    drop_table :pages
  end
end
