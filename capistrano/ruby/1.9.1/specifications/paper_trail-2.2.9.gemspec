# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{paper_trail}
  s.version = "2.2.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Andy Stewart}]
  s.date = %q{2011-07-22}
  s.description = %q{Track changes to your models' data.  Good for auditing or versioning.}
  s.email = %q{boss@airbladesoftware.com}
  s.homepage = %q{http://github.com/airblade/paper_trail}
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{Track changes to your models' data.  Good for auditing or versioning.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 3"])
      s.add_development_dependency(%q<shoulda>, ["= 2.10.3"])
      s.add_development_dependency(%q<sqlite3-ruby>, ["~> 1.2"])
      s.add_development_dependency(%q<capybara>, [">= 0.4.0"])
      s.add_development_dependency(%q<turn>, [">= 0"])
    else
      s.add_dependency(%q<rails>, ["~> 3"])
      s.add_dependency(%q<shoulda>, ["= 2.10.3"])
      s.add_dependency(%q<sqlite3-ruby>, ["~> 1.2"])
      s.add_dependency(%q<capybara>, [">= 0.4.0"])
      s.add_dependency(%q<turn>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3"])
    s.add_dependency(%q<shoulda>, ["= 2.10.3"])
    s.add_dependency(%q<sqlite3-ruby>, ["~> 1.2"])
    s.add_dependency(%q<capybara>, [">= 0.4.0"])
    s.add_dependency(%q<turn>, [">= 0"])
  end
end
