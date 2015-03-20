# gem-version-update-easy

1 Liner to update gem version

````
require File.expand_path('../lib/gem_version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'mll_common'
  s.version     = GemVersion.current
  
````


````
rake release:version_bump

````

````
rake release:version_bump_and_push
````
