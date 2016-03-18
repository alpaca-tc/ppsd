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

    private

    def parse_image_resources
      return if @parsed_image_resources
      @parsed_image_resources = true

      # Seek image resources section
      seek_pos = ColorModeData.new(@psd_file).tail_pos_of_color_mode_data
      @psd_file.seek(seek_pos, IO::SEEK_SET)

      section_length = @psd_file.read_u_int
      finish_pos = section_length + @psd_file.pos

      while @psd_file.pos < finish_pos
        resource = PPSD::ImageResource.new(@psd_file)
        @resources << resource
        @psd_file.seek(resource.termination_pos, IO::SEEK_SET)
      end

      puts @resources.map(&:signature)
    end
  end
end
