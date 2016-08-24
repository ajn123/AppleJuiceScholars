require "#{Rails.root}/app/helpers/application_helper"
include ApplicationHelper

namespace :db do
  task populate: :environment do
    Article.destroy_all

    puts Dir.pwd
    a = File.join("lib", "assets", "articles", "*.md")
    Dir.glob(a).reject { |name| /.*(template|NEW_ARTICLE).*/ =~ name }.each do |file|
      File.open(file, "r") do |f|
        contents = f.read
        mkdown = Metadown.render(contents)
        md = mkdown.metadata
        
        unrendered_content = contents.sub(/^---(\n|.)*---/, '')
        puts unrendered_content

        Article.create!(name: md["name"], 
                        premium: md["premium"], 
                        video_url: md["video_url"],
                        content: markdown(unrendered_content),
                        published_at: Date.parse(md['published_at']) )
      end
    end
    
    puts "Article Count: #{Article.count}"
  end

  task new_blog: :environment do
    cp 'lib/assets/articles/template.md', "lib/assets/articles/NEW_ARTICLE#{Time.now.strftime("%s")}.md"
    puts 'new article created!'
  end
end
