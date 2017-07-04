class ChangeUrlToItems < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :url, :text
    change_column :items, :site, :string
  end
end
