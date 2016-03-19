class PPSD
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

    private

    def seek_section_head
      @psd_file.seek(@parser.layer_and_mask_information.termination_pos, IO::SEEK_SET)
    end

    def seek_variable_head
      @psd_file.seek(@parser.layer_and_mask_information.termination_pos + 2, IO::SEEK_SET)
    end
  end
end
