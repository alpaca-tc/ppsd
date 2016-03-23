class PPSD
  class Channel
    autoload :Cmyk, 'ppsd/channel/cmyk'

    def channels
      raise NotImplementedError, 'not implemented yet'
    end

    def inspect
      "#{super}(channel: #{channels.join(', ')})"
    end
  end
end
