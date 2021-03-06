# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ukrainian}
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["romanvbabenko"]
  s.date = %q{2009-08-20}
  s.description = %q{Ukrainian language support for Ruby and Rails}
  s.email = %q{romanvbabenko@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION.yml",
     "lib/ukrainian.rb",
     "lib/ukrainian.rb",
     "lib/ukrainian/backend/simple.rb",
     "lib/ukrainian/backend/simple.rb",
     "lib/ukrainian/locale/acitvesupport.yml",
     "lib/ukrainian/locale/acitvesupport.yml",
     "lib/ukrainian/locale/actionview.yml",
     "lib/ukrainian/locale/actionview.yml",
     "lib/ukrainian/locale/activerecord.yml",
     "lib/ukrainian/locale/activerecord.yml",
     "lib/ukrainian/locale/datetime.yml",
     "lib/ukrainian/locale/datetime.yml",
     "lib/ukrainian/locale/formtastic.yml",
     "lib/ukrainian/locale/formtastic.yml",
     "lib/ukrainian/locale/pluralize.rb",
     "lib/ukrainian/locale/pluralize.rb",
     "test/test_helper.rb",
     "test/ukrainian_test.rb",
     "ukrainian.gemspec"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/romanvbabenko/ukrainian}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.2}
  s.summary = %q{Ukrainian language support for Ruby and Rails}
  s.test_files = [
    "test/test_helper.rb",
     "test/ukrainian_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_runtime_dependency(%q<i18n>, [">= 0"])
    else
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_dependency(%q<i18n>, [">= 0"])
    end
  else
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    s.add_dependency(%q<i18n>, [">= 0"])
  end
end
