require 'ppsd/version'
require 'ppsd/section'
require 'ppsd/parser'
require 'ppsd/psd_file'
require 'ppsd/header'
require 'ppsd/color_mode_data'
require 'ppsd/image_resource'
require 'ppsd/image_resources'
require 'ppsd/layer_and_mask_information'
require 'ppsd/image'
require 'ppsd/color'
require 'ppsd/channel'

class PPSD
  class InvalidPsdFile < RuntimeError; end
end
