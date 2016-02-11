module RootDirectory
  def spec_root
    @spec_root ||= Pathname.new(__dir__).join('..')
  end

  RSpec.configure do |config|
    config.include(RootDirectory)
    config.extend(RootDirectory)
  end
end
