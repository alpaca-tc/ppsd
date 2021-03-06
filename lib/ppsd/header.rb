# http://www.adobe.com/devnet-apps/photoshop/fileformatashtml/#50577409_19840
class PPSD
  class Header < Section
    # TODO: 全パターンを試して、より正確な結果を出す
    COLOR_MODES = {
      0 => 'Bitmap',
      1 => 'Grayscale',
      2 => 'Indexed',
      3 => 'RGB',
      4 => 'CMYK',
      7 => 'Multichannel',
      8 => 'Duotone',
      9 => 'Lab'
    }.freeze

    def color_mode
      parse_header
      @color_mode
    end

    def color_mode_name
      COLOR_MODES[color_mode]
    end

    def signature
      parse_header
      @signature
    end

    def version
      parse_header
      @version
    end

    def channels
      parse_header
      @channels
    end

    def height
      parse_header
      @height
    end

    def width
      parse_header
      @width
    end

    def depth
      parse_header
      @depth
    end

    def termination_pos
      26
    end

    def to_h
      %i(color_mode color_mode_name signature version channels height width).each_with_object({}) do |name, memo|
        memo[name] = public_send(name)
      end
    end

    private

    def seek_section_head
      @psd_file.seek(0, IO::SEEK_SET)
    end

    def parse_header
      return if @signature

      seek_section_head

      # Initialize psd file
      seek_section_head

      # Signature: always equal to '8BPS' . Do not try to read the file if the signature does not match this value.
      @signature = @psd_file.read_bytes(4)

      # Version: always equal to 1. Do not try to read the file if the version does not match this value.
      @version = @psd_file.read_u_short

      # Signature and version check!
      verify_file_version!

      # Reserved: must be zero.
      @psd_file.seek(6, IO::SEEK_CUR)

      # The number of channels in the image, including any alpha channels. Supported range is 1 to 56.
      @channels = @psd_file.read_u_short

      # The height of the image in pixels. Supported range is 1 to 30,000.
      @height = @psd_file.read_u_int

      # The width of the image in pixels. Supported range is 1 to 30,000.
      @width = @psd_file.read_u_int

      # Depth: the number of bits per channel. Supported values are 1, 8, 16 and 32.
      @depth = @psd_file.read_u_short

      # The color mode of the file. Supported values are: Bitmap = 0; Grayscale = 1; Indexed = 2; RGB = 3; CMYK = 4; Multichannel = 7; Duotone = 8; Lab = 9.
      @color_mode = @psd_file.read_u_short
    end

    def verify_file_version!
      raise InvalidPsdFile, 'invalid psd file given' unless @signature == '8BPS' && @version == 1
    end
  end
end
