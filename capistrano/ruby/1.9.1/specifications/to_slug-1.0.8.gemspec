# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{to_slug}
  s.version = "1.0.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Eric Boehs}]
  s.date = %q{2011-03-17}
  s.description = %q{This gem makes URL friendly strings out of not so pretty strings.}
  s.email = [%q{ericboehs@gmail.com}]
  s.homepage = %q{https://ericboehs.com}
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{to_slug}
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{Adds a to_slug method to ruby's String class}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 2.4.0"])
    else
      s.add_dependency(%q<rspec>, ["~> 2.4.0"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 2.4.0"])
  end
end
