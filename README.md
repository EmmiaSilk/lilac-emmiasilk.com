# Lilac - EmmiaSilk.com

This repository makes up the app I will use for my website after I can afford to actually pay for a web server.

## Prerequisites
* Ruby - 2.4.4+
* Rails - 5.2.0
* Node.js - 6.0.0?
* Yarn - ???

## Getting the server running
After cloning the repository, you should theoretically be able to run the following commands to get the server in a functional state. I make no promises to whether this will actually work.
```shell
git clone https://github.com/EmmiaSilk/lilac-emmiasilk.com.git
cd lilac-emmiasilk.com
bundle install
yarn install
rails db:migrate
```


To run the server
```shell
rails server
```

When editing stylesheets, you will want to have the webpacker development server running. This will let your scss code automatically get sent to your browser.
```shell
bin/webpack-dev-server
```
