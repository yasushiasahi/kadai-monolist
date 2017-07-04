class ChangeSiteToItems < ActiveRecord::Migration[5.0]
  def change
    # [形式] change_column(テーブル名, カラム名, データタイプ, オプション)
    change_column :items, :site, :text
  end
end
