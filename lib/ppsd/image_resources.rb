class PPSD
  class ImageResources < Section
    def resources
      parse_image_resources
      @resources
    end

    def termination_pos
      # Calculate @termination_pos
      seek_image_resource_variable_head unless @termination_pos

      @termination_pos
    end

    private

    # Seek image resources section
    def seek_section_head
      @psd_file.seek(@parser.color_mode_data.termination_pos, IO::SEEK_SET)
    end

    def seek_image_resource_variable_head
      seek_section_head
      variable_length = @psd_file.read_u_int

      @image_resource_variable_head = @psd_file.pos
      @termination_pos = @image_resource_variable_head + variable_length

      @psd_file.seek(@image_resource_variable_head, IO::SEEK_SET)
    end

    def parse_image_resources
      return if @resources

      @resources = []

      seek_image_resource_variable_head

      while @psd_file.pos < termination_pos
        resource = PPSD::ImageResource.new(@parser)
        @resources << resource
        @psd_file.seek(resource.termination_pos, IO::SEEK_SET)
      end
    end
  end
end
