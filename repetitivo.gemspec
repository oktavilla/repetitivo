$:.push File.expand_path("../gem", __FILE__)

require "json"
require "ostruct"

pkg = OpenStruct.new(JSON.parse(IO.read("package.json")))

Gem::Specification.new do |s|
  s.authors = pkg.author
  s.summary = pkg.description
  s.files = `git ls-files`.split("\n")
  s.homepage = pkg.homepage
  s.license = pkg.license
  s.name = pkg.name
  s.platform = Gem::Platform::RUBY
  s.require_paths = ["gem"]
  s.version = pkg.version
end
