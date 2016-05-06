# Activeadmin::Umeditor
integrate [umeditor](http://ueditor.baidu.com/website/umeditor.html) with activeadmin, it do not support image upload yet(still working on it) 

## Installation

Add this to your Gemfile:

```ruby
gem 'activeadmin-umeditor', git: 'https://github.com/ACzero/activeadmin-umeditor'
```

Run the command to install umeditor:

```ruby
rails generate active_admin:umeditor
```
this command will copy the umeditor's plugin files to your public folder, umeditor will load them when it is instantiated,
you can place them to the server you like, but don't forget to change to `UMEDITOR_HOME_URL` in configure

## Usage

just specify the `as` option of your` input`:

```ruby
ActiveAdmin.register Article do
  form do |f|
    f.inputs do
      f.input :title
      f.input :content, as: :um_editor
    end
    
    f.actions
  end
end
```

you can set a default value by this way:

```ruby
f.input :content, input_html: { value: 'default content' }
```
it will overwirte the value store in your object.content


## Configuration

create the initializer first:

```ruby
config/initializers/activeadmin-umeditor.rb
```

add your custom config in the initializer:

```ruby
ActiveAdmin::Umeditor.config_umeditor do |config|
  config['toolbar'] = ['undo redo | bold italic']
end
```

you need to clear the file in `tmp/cache/` to see the config change

```
rm -rf tmp/cache
```

to learn more about what you can config, check [here](https://github.com/ACzero/activeadmin-umeditor/blob/master/vendor/assets/javascripts/active_admin/umeditor/umeditor.config.js#L131)

## TODO
1. image upload support

...

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
