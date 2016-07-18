class AddPremiumToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :premium, :boolean, null: false, default: false
  end
end
