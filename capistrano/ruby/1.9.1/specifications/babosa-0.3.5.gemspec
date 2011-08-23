# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{babosa}
  s.version = "0.3.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Norman Clarke}]
  s.date = %q{2011-06-08}
  s.description = %q{    A library for creating slugs. Babosa an extraction and improvement of the
    string code from FriendlyId, intended to help developers create similar
    libraries or plugins.
}
  s.email = %q{norman@njclarke.com}
  s.homepage = %q{http://norman.github.com/babosa}
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{[none]}
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{A library for creating slugs.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<activesupport>, [">= 2.3.0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.5.0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<activesupport>, [">= 2.3.0"])
      s.add_dependency(%q<rspec>, ["~> 2.5.0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 2.3.0"])
    s.add_dependency(%q<rspec>, ["~> 2.5.0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end
