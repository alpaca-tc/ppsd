class PPSD
  class ColorModeData < Section
    def color_mode_data
      raise NotImplementedError, 'color_mode_data is not implemented'
    end

    def termination_pos
      return @termination_pos if @termination_pos

      seek_section_head
      @termination_pos = @psd_file.read_u_int + @psd_file.pos
    end

    private

    # Seek color mode data
    def seek_section_head
      @psd_file.seek(@parser.header.termination_pos, IO::SEEK_SET)
    end

    def parse_color_mode_data
      raise NotImplementedError, 'not implemented yet'
    end
  end
end
