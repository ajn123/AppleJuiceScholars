git push heroku; 
heroku run rake db:migrate;
heroku run rake db:populate; 
heroku restart; 
