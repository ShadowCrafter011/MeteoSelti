I18n.available_locales = [:de]
I18n.default_locale = :de
I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]