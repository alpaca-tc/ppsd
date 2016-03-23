class PPSD
  require 'ppsd/image_parser'
  require 'ppsd/image_parser/rle_compressed'

  class Image < Section
    def compression_method
      return @compression_method if @compression_method

      seek_section_head
      @compression_method = @psd_file.read_short
    end

    def channel
      return @channel if @channel

      channel_names = {
        0 => :Bitmap,
        1 => :Grayscale,
        2 => :Indexed,
        3 => :Rgb,
        4 => :Cmyk,
        7 => :Multichannel,
        8 => :Duotone,
        9 => :Lab
      }

      const_name = channel_names[@parser.header.color_mode]
      @channel = PPSD::Channel.const_get(const_name).new
    end

    def to_file
      image_parser.to_file('out.png')
    end

    def variable_pos
      @parser.layer_and_mask_information.termination_pos + 2
    end

    private

    def seek_section_head
      @psd_file.seek(@parser.layer_and_mask_information.termination_pos, IO::SEEK_SET)
    end

    def image_parser
      return @image_parser if @image_parser

      compression_method_names = {
        0 => :Raw,
        1 => :RleCompressed,
        2 => :ZipWithoutPrediction,
        3 => :ZipWithoutPrediction
      }

      const_name = compression_method_names[compression_method]
      @image_parser = PPSD::ImageParser.const_get(const_name).new(self)
    end
  end
end
