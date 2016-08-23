---
video_url: https://www.youtube.com/embed/jQz7ps-MYYw  
name: "Ruby On Rails - Migrations"
premium: false
published_at: 23-08-2016
---

Migrations are a convenient way to alter your database schema over time in a
consistent and easy way.

Each migration updates the *db/schema.rb*, you can always check it to see where
your database configuration stands.


## Commands to Know:

rake db:migrate  # Migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)

rake db:rollback # Rolls the schema back to the previous version (specify steps w/ STEP=n) 

rake -T # see all of the available rake tasks

rake db:migrate:status  # Display status of migrations


Modify existing tables
* rails generate migration add_XXX_to_TABLENAME
* rails generate migration remove_XXX_from_TABLENAME  

### More Helpful Resources
* [Rails Migrations Guide](http://guides.rubyonrails.org/active_record_migrations.html)
