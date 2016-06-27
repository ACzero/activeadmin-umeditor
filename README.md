# Activeadmin::Umeditor
integrate [umeditor](http://ueditor.baidu.com/website/umeditor.html) with activeadmin, with image upload support

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
(PS: the default UMEDITOR_HOME_URL is "/active_admin/umeditor/", and umeditor will request the plugins in "public" folder)

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

if you want to use the default image upload controller to handle uploaded image, add this to your 'config/routes.rb'

```ruby
mount ActiveAdmin::Umeditor::Engine => "/active_admin/umeditor"
```

## UMEditor Configuration

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

## Upload Configration
if you use the default controller, by default, the uploaded images file will be saved to "public/app/active_admin/umeditor/uploads"
you can config the upload path in initializer:

```ruby
ActiveAdmin::Umeditor.config_uploader do |uploader|
  # this will set the path where uploaded images is saved
  uploader.image_save_path = Rails.root.join('public', 'uploads')
  
  # this will set the path of uploaded image url
  uploader.image_url_base = "uploads"
  
  # if image_url_prefix is not set, the prefix will be request.protocol + request.host_with_port
  uploader.image_url_prefix = "http://localhost:3000/"
end
```

use custom controller to handle uploaded image, set the uploaded path of umeditor first:

```ruby
ActiveAdmin::Umeditor.config_umeditor do |config|
  config['imageUrl'] = "your/controller/path"
end
```

then response to umeditor like this in your controller:

```ruby
class YourController < ApplicationController
  def your_action
    render html: {
      state: "SUCCESS",
      url: "image_url",
      name: "title",
      originalName: ""
    }.to_json
  end
end
```

you can see the [the php version](https://github.com/fex-team/umeditor/blob/dev/php/Uploader.class.php) for more information

## TODO
1. better support for upload

...

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
