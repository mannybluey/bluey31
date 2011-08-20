I18n.backend.class.send(:include, I18n::Backend::Fallbacks)

#I18n.fallbacks.map('de_DE' => 'en', 'en_US' => 'en', 'en_AU' => 'en') # to be used later