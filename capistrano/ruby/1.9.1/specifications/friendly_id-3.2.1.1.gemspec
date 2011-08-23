# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{friendly_id}
  s.version = "3.2.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Norman Clarke}, %q{Adrian Mugnolo}, %q{Emilio Tagua}]
  s.date = %q{2011-03-23}
  s.description = %q{    FriendlyId is the "Swiss Army bulldozer" of slugging and permalink plugins
    for Ruby on Rails. It allows you to create pretty URL's and work with
    human-friendly strings as if they were numeric ids for ActiveRecord models.
}
  s.email = [%q{norman@njclarke.com}, %q{adrian@mugnolo.com}, %q{miloops@gmail.com}]
  s.homepage = %q{http://norman.github.com/friendly_id}
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{friendly-id}
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{A comprehensive slugging and pretty-URL plugin.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<babosa>, ["~> 0.3.0"])
      s.add_development_dependency(%q<activerecord>, ["~> 3.0.0"])
      s.add_development_dependency(%q<mocha>, ["~> 0.9"])
      s.add_development_dependency(%q<sqlite3>, ["~> 1.3"])
    else
      s.add_dependency(%q<babosa>, ["~> 0.3.0"])
      s.add_dependency(%q<activerecord>, ["~> 3.0.0"])
      s.add_dependency(%q<mocha>, ["~> 0.9"])
      s.add_dependency(%q<sqlite3>, ["~> 1.3"])
    end
  else
    s.add_dependency(%q<babosa>, ["~> 0.3.0"])
    s.add_dependency(%q<activerecord>, ["~> 3.0.0"])
    s.add_dependency(%q<mocha>, ["~> 0.9"])
    s.add_dependency(%q<sqlite3>, ["~> 1.3"])
  end
end
