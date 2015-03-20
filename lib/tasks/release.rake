namespace :release do
  desc 'Release'

  task :upload => :environment do
    # get last changed file
    # @version_to_release = MLLCommon::Version.current
    # puts `gem build mll_common.gemspec`
    # ``
    # exec("fury push mll_common-#{@version_to_release}.gem --as=app25039143_heroku_com")

    # puts "gem 'mll_common', '#{@version_to_release}' "
  end

  task :version_bump do
    require File.expand_path('../../gem_version', __FILE__)
    version = GemVersion.bump_up
    puts "New Version #{version}"
  end

  task :version_bump_and_push do
    Bundler.with_clean_env do
      sh 'rake release:version_bump'
      sh 'git add -A && git commit -m "version bump"; git push;'

    end
  end

end
