# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "handlers"
  s.summary = "Handlers for markdown and merb templates."
  s.description = "'.merb' templates are markdown with erb interspersed. Markdown compilation is done with Redcarpet."
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.md"]
  s.version = "0.0.3"
end
