# Thumbor Rails

https://github.com/rafaelcaricio/thumbor_rails

## DESCRIPTION

thumbor_rails is a client to make easier to use the thumbor imaging service (http://github.com/globocom/thumbor) in Ruby and Rails projects.

## Installation

You can use this gem by putting the following inside your Gemfile:

```
gem "thumbor_rails", "0.1.0"
```

Now generate the thumbor basic client configuration:

```
rails g thumbor_rails:install
```

It will generate the basic configuration in `config/initializers/thumbor_rails.rb` and you have to update the values of `server_url` to point to your thumbor server and the `security_key` to have your security key.

That's all.

## Usage

There are two basic helpers you can use in your views:

```
thumbor_url
thumbor_image_tag
```

### thumbor_url

The `thumbor_url` helper allows you to to generate a thumbor url, a simple use is:

```ruby
<%= thumbor_url "http://example.com/awesome_image.jpg" %>
```

Of course, you can pass various parameters to thumbor as described in the [ruby-thumbor gem](https://github.com/thumbor/ruby-thumbor#usage). An exemple would be:

```ruby
<%= thumbor_url "http://example.com/awesome_image.jpg", width: 200, height: 300 %>
```
