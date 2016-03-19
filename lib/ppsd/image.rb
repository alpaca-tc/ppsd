class PPSD
  require 'ppsd/image_parser'
  require 'ppsd/image_parser/rle_compressed'

  class Image < Section
    def compression_method
      @compression_method ||= begin
        seek_section_head
        @psd_file.read_short
      end
    end

    def variable
      seek_variable_head
      # TODO: 各チャンネル、各color modeに合わせてパーサーを書く
    end

    def parse!
      image_parser.to_file('out.png')
    end

    def variable_pos
      @parser.layer_and_mask_information.termination_pos + 2
    end

    private

    def image_parser
      @image_parser ||= case compression_method
                        when 0
                        when 1
                          PPSD::ImageParser::RleCompressed.new(self)
                        when 2
                        when 3
                        end
    end

    def seek_section_head
      @psd_file.seek(@parser.layer_and_mask_information.termination_pos, IO::SEEK_SET)
    end
  end
end
