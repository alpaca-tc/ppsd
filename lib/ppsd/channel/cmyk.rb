class PPSD
  class Channel
    class Cmyk < Channel
      CHANNELS = [0, 1, 2, 3].freeze

      def channels
        CHANNELS
      end
    end
  end
end
