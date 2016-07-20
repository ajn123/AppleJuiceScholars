class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :video_url, default: ""
      t.string :name, default: ""
      t.text :content, default: ""

      t.timestamps null: false
    end
  end
end
