# -*- encoding: utf-8 -*-
# stub: rubocop-packaging 0.5.2 ruby lib

Gem::Specification.new do |s|
  s.name = "rubocop-packaging".freeze
  s.version = "0.5.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "homepage_uri" => "https://github.com/utkarsh2102/rubocop-packaging", "rubygems_mfa_required" => "true", "source_code_uri" => "https://github.com/utkarsh2102/rubocop-packaging" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Utkarsh Gupta".freeze]
  s.date = "2022-08-11"
  s.description = "A collection of RuboCop cops to check for downstream compatibility issues in the\nRuby code.\n".freeze
  s.email = ["utkarsh@debian.org".freeze]
  s.homepage = "https://github.com/utkarsh2102/rubocop-packaging".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6.0".freeze)
  s.rubygems_version = "3.3.7".freeze
  s.summary = "Automatic downstream compatibility checking tool for Ruby code".freeze

  s.installed_by_version = "3.3.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bump>.freeze, ["~> 0.8"])
    s.add_development_dependency(%q<pry>.freeze, ["~> 0.13"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<yard>.freeze, ["~> 0.9"])
    s.add_runtime_dependency(%q<rubocop>.freeze, [">= 1.33", "< 2.0"])
  else
    s.add_dependency(%q<bump>.freeze, ["~> 0.8"])
    s.add_dependency(%q<pry>.freeze, ["~> 0.13"])
    s.add_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.9"])
    s.add_dependency(%q<rubocop>.freeze, [">= 1.33", "< 2.0"])
  end
end
