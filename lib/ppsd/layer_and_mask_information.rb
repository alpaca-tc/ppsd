class PPSD
  class LayerAndMaskInformation < Section
    def termination_pos
      seek_section_head unless @termination_pos
      @termination_pos ||= @psd_file.read_int + @psd_file.pos
    end

    private

    def seek_section_head
      @psd_file.seek(@parser.image_resources.termination_pos, IO::SEEK_SET)
    end
  end
end
