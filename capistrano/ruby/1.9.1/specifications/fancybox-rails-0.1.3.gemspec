# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{fancybox-rails}
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Chris Mytton}]
  s.date = %q{2011-08-11}
  s.description = %q{This gem provides jQuery FancyBox for your Rails 3.1 application.}
  s.email = [%q{self@hecticjeff.net}]
  s.homepage = %q{https://github.com/hecticjeff/fancybox-rails}
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{Use FancyBox with Rails 3.1}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, [">= 3.1.0.rc"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<rails>, ["~> 3.1"])
    else
      s.add_dependency(%q<railties>, [">= 3.1.0.rc"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<rails>, ["~> 3.1"])
    end
  else
    s.add_dependency(%q<railties>, [">= 3.1.0.rc"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<rails>, ["~> 3.1"])
  end
end
