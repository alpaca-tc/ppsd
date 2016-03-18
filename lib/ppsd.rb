require 'ppsd/version'
require 'ppsd/psd_file'
require 'ppsd/header'
require 'ppsd/color_mode_data'
require 'ppsd/image_resource'
require 'ppsd/image_resources'

class PPSD
  class InvalidPsdFile < RuntimeError; end
end
