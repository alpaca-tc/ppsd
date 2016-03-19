class PPSD
  class Section
    attr_reader :parser, :psd_file

    def initialize(parser)
      @parser = parser
      @psd_file = parser.psd_file
    end
  end
end
