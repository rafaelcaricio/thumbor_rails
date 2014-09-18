# Thumbor Rails [<img src="https://secure.travis-ci.org/rafaelcaricio/thumbor_rails.png?branch=master" alt="Build Status" />](https://travis-ci.org/rafaelcaricio/thumbor_rails)

https://github.com/rafaelcaricio/thumbor_rails

## DESCRIPTION

thumbor_rails is a client to make easier to use the thumbor imaging service (http://github.com/globocom/thumbor) in Ruby and Rails projects.

## Installation

You can use this gem by putting the following inside your Gemfile:

```
gem "thumbor_rails", "1.0.1"
```

Now generate the thumbor basic client configuration:

```
rails g thumbor_rails:install
```

It will generate the basic configuration in `config/initializers/thumbor_rails.rb`, which has the following configuration options available:

- `server_url`. _Required_. The location of your Thumbor server. If `server_url` contains `%d`, it will be interpolated to 0-3, [just like `asset_host` for Rails](http://api.rubyonrails.org/classes/ActionView/Helpers/AssetUrlHelper.html).
- `sercurity_key`. Optional. This must match your [Thumbor server's security key](https://github.com/thumbor/thumbor/wiki/Security#stopping-tampering).
- `force_no_protocol_in_source_url`. Optional, defaults to `false`. If true, the protocol is removed from any image source passed into `thumbor_url`. This may be done for aesthetic reasons, or due to certain CDN/server configurations.


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

### thumbor_image_tag

The `thumbor_image_tag` helper allows you to simplify the usage when creating a simple image tag in your views. It returns a complete image tag with the generated thumbor url in the `src` attribute of the `img` tag. Example:

```ruby
<%= thumbor_image_tag "http://myimage.jpg", unsafe: true, width: 100, height: 100 %>
```

Will result in something like:

```html
<img alt="Myimage" src="http://thumbor.example.com/unsafe/100x100/http://myimage.jpg" />
```

## Maintainers

- Rafael Caricio ([@rafaelcaricio](https://coderwall.com/rafaelcaricio))

and [contributors](https://github.com/rafaelcaricio/thumbor_rails/graphs/contributors).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Extras

If you do not have yet an instance of thumbor for you. You can get one for [free up and running](https://github.com/rafaelcaricio/thumbor-openshift-example) in the OpenShift Cloud.
