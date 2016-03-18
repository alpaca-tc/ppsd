class PPSD
  class ColorModeData
    def initialize(psd_file)
      @psd_file = psd_file
    end

    def color_mode_data
      raise NotImplementedError, 'color_mode_data is not implemented'
    end

    def tail_pos_of_color_mode_data
      parse_color_mode_data
      @psd_file.pos
    end

    private

    def parse_color_mode_data
      # Seek color mode data
      @psd_file.seek(26, IO::SEEK_SET)
      color_data_length = @psd_file.read_u_int

      # Returns color data
      # TODO: Parse color data
      @psd_file.seek(color_data_length, IO::SEEK_CUR)
    end
  end
end
