class PPSD
  class PsdFile < ::File
    FORMATS = {
      u_long_long: {
        length: 8,
        code: 'Q>'
      },
      long_long: {
        length: 8,
        code: 'q>'
      },
      double: {
        length: 8,
        code: 'G'
      },
      float: {
        length: 4,
        code: 'F'
      },
      u_int: {
        length: 4,
        code: 'L>'
      },
      int: {
        length: 4,
        code: 'l>'
      },
      u_short: {
        length: 2,
        code: 'S>'
      },
      short: {
        length: 2,
        code: 's>'
      }
    }.freeze

    FORMATS.each do |format, info|
      define_method "read_#{format}" do
        read(info[:length]).unpack(info[:code])[0]
      end
    end

    def read_bytes(length)
      read(length).delete("\000")
    end
  end
end
