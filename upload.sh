git push heroku; 
git push origin master; 
heroku run rake db:migrate;
heroku run rake db:populate; 
heroku restart; 
