class PPSD
  class Parser
    attr_reader :psd_file

    def initialize(path)
      @psd_file = PsdFile.new(path)
    end

    def header
      @header ||= Header.new(self)
    end

    def color_mode_data
      @color_mode_data ||= ColorModeData.new(self)
    end

    def image_resources
      @image_resources ||= ImageResources.new(self)
    end

    def layer_and_mask_information
      @layer_and_mask_information ||= LayerAndMaskInformation.new(self)
    end

    def image
      @image ||= Image.new(self)
    end
  end
end
