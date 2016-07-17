class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :video_url
      t.string :name
      t.text :content

      t.timestamps null: false
    end
  end
end
