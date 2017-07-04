class AddSiteToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :site, :string
  end
end
