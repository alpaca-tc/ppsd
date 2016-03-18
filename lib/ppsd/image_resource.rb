class PPSD
  class ImageResource
    def initialize(psd_file)
      @psd_file = psd_file
      @cur_pos = @psd_file.pos
    end

    def signature
      parse_resource
      @signature
    end

    def id
      parse_resource
      @id
    end

    def name
      parse_resource
      @name
    end

    def resource_data_size
      parse_resource
      @resource_data_size
    end

    def termination_pos
      return @termination_pos if @termination_pos

      # Set image resource pos
      @psd_file.seek(@cur_pos, IO::SEEK_SET)
      @psd_file.read_bytes(6) # signature + id
      @psd_file.read_pascal_string
      @termination_pos = @psd_file.read_int_pad2 + @psd_file.pos
    end

    private

    def parse_resource
      return if @id

      # Set image resource pos
      @psd_file.seek(@cur_pos, IO::SEEK_SET)
      @signature = @psd_file.read_bytes(4)
      @id = @psd_file.read_short
      @name = @psd_file.read_pascal_string

      # TODO: dataをparseする
      @data_size = @psd_file.read_int_pad2
      @termination_pos = @data_size + @psd_file.pos
    end
  end
end
