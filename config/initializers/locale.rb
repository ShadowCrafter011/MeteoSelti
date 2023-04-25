I18n.available_locales = [:de, :fr, :it, :en]
I18n.default_locale = :en
I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]