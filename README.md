# Lilac - EmmiaSilk.com
This repository makes up the app I will use for my website after I can afford
to actually pay for a web server.

## Prerequisites
* Ruby - 2.4.4+
* Rails - 5.2.0
* Node.js - 6.0.0?
* Yarn - ???

## Getting the server running
After cloning the repository, you should theoretically be able to run the
following commands to get the server in a functional state. I make no promises
to whether this will actually work.
```shell
# Clone database
git clone https://github.com/EmmiaSilk/lilac-emmiasilk.com.git
cd lilac-emmiasilk.com
# Install gem dependencies
bundle install
# Install npm modules in `node_modules`
yarn install
# Generate secret key
rake secret
```

Before you can seed the database, you will have to setup some seed data. In
`db/seed_data/`, copy `default_users_example.yml` to `default_users.yml` and
give each default user a unique email and password.

Then you can create the database file and fill it with the seed values.
```shell
rails db:schema:load
rails db:seed
```

Finally, run the server using
```shell
rails server
```

## Development notes
When editing stylesheets, you will want to have the webpacker development
server running. This will let your scss code automatically get sent to your
browser.
```shell
bin/webpack-dev-server
```
