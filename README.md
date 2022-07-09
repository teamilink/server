# iLink - Server

- After `git pull`, don't forget to run `bundle install` and `bundle update`
- Be aware which branch you are
- For database, `rails db:drop`, `rails db:create`, `rails db:migrate`, `rails db:seed`
  - or, `rails db:drop db:create db:migrate db:seed` -> sometimes not working
  - `rails db:reset` might cause migration errors when deploying
