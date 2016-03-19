class PPSD
  class ImageResources
    def initialize(psd_file)
      @psd_file = psd_file
      @resources = []
    end

    def resources
      parse_image_resources
      @resources
    end

    def termination_pos
      return @termination_pos if @termination_pos

      seek_section_head
      section_length = @psd_file.read_u_int
      @termination_pos = section_length + @psd_file.pos
    end

    private

    # Seek image resources section
    def seek_section_head
      seek_pos = ColorModeData.new(@psd_file).termination_pos
      @psd_file.seek(seek_pos, IO::SEEK_SET)
    end

    def parse_image_resources
      return if @parsed_image_resources
      @parsed_image_resources = true

      while @psd_file.pos < termination_pos
        resource = PPSD::ImageResource.new(@psd_file)
        @resources << resource
        @psd_file.seek(resource.termination_pos, IO::SEEK_SET)
      end
    end
  end
end
