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

      define_method "read_#{format}_pad2" do
        pad2(public_send("read_#{format}"))
      end

      define_method "read_#{format}_pad4" do
        pad4(public_send("read_#{format}"))
      end
    end

    def read_byte
      read(1).bytes.to_a[0]
    end

    def read_bytes(length)
      read(length).delete("\000")
    end

    def read_pascal_string
      # Null name is `\00`
      name_length = pad2(read(1).bytes.first + 1) - 1
      @name = read_bytes(name_length)
    end

    private

    def pad2(i)
      (i + 1) & ~0x01
    end

    def pad4(i)
      ((i + 4) & ~0x03) - 1
    end
  end
end
