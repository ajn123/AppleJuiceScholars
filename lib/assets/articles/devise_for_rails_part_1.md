---
video_url: https://www.youtube.com/embed/rrC37eeMNIY
name: "Devise For Rails - Part 1"
premium: false
published_at: 20/08/2016
---

First install Devise

``` ruby
rails generate devise:install
```

Generate a model for whatever authenticated member you want to create. (User or Admin).  Whatever name you choose will be used for devise helper methods later on.

```ruby
rails generate devise User
```

If I choose a devise model name of User then these helper methods are generated:

```ruby
user_signed_in?  # Check if you are signed in

current_user # Get the model of the logged in user

user_session # Get the current session object
```

Notice that if your Devise model is called Member instead of User, the helper methods would change above by replacing user with member.

To customize your login and sign in forms, you can generate Devise views and
customize them

```ruby
rails g devise:views
```

[Check out Part 2](http://localhost:3000/articles/devise-for-rails-part-2)

See the devise [documentation](https://github.com/plataformatec/devise) for more advanced advice.
