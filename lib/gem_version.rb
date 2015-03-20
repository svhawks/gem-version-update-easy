#blog worthy

class GemVersion

  def self.current
    @version ||= File.read('.gem-version')
  end

  def self.create_version_file(major = '0', minor = '11', build = '0')
    version = "#{major}.#{minor}.#{build}"
    File.open('.gem-version', 'w') { |f| f.write(version) }
    version
  end

  def self.from_last_modified_file
    # reject{|f| f.match /\.gem$/}
    # because creating a gem file will change the gemspec
    latest = Dir.glob('**/*').reject{|f| f.match /\.gem$/}.sort_by{ |f| File.mtime(f) }.last
    File.mtime(latest).to_i
  end

  def self.bump_up
    version = GemVersion.current
    sequences = version.split('.').map{|n| n.to_i}
    sequences[2] += 1
    @version = GemVersion.create_version_file(sequences[0], sequences[1], sequences[2])
  end

end
