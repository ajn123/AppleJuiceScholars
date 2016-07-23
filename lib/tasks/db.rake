namespace :db do
  task populate: :environment do
    Article.destroy_all

    puts Dir.pwd
    a = File.join("lib", "assets", "articles", "*.md")
    Dir.glob(a).each do |file|
      puts file
      File.open(file, "r") do |f|
        contents = f.read
        markdown = Metadown.render(contents)
        puts markdown.metadata
        md = markdown.metadata
        puts markdown.output
        Article.create!(name: md["name"], 
                        premium: md["premium"], 
                        video_url: md["video_url"],
                        content: markdown.output)
      end
    end
    
    puts "Article Count: #{Article.count}"
  end

  task new_blog: :environment do
    
  end
end
