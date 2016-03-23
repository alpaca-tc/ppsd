require 'chunky_png'

class PPSD
  class ImageParser
    class RleCompressed < ImageParser
      private

      def write_image_with_io(io)
        scan_lines = image_section.channel.channels.length * parser.header.height

        seek_variable_head

        # Calculate byte_counts
        byte_counts = Array.new(scan_lines) { psd_file.read_short }

        @channel_data, @pixel_data = eval(File.read('/Users/alpaca-tc/src/psd.rb/channel_with_pixel'))

        channel_data = []
        channel_position = 0
        line_index = 0

        # Calculate channel information
        image_section.channel.channels.each do |i|
          parser.header.height.times do |j|
            byte_count = byte_counts[line_index + j]
            finish = psd_file.pos + byte_count

            while psd_file.pos < finish
              length = psd_file.read_byte

              if length < 128
                length += 1
                channel_data.insert(channel_position, *(psd_file.read(length).bytes.to_a))
                channel_position += length
              elsif length > 128
                length ^= 0xff
                length += 2

                val = psd_file.read(1).bytes.to_a
                channel_data.insert(channel_position, *(val * length))
                channel_position += length
              end
            end
          end

          line_index += parser.header.height
        end

        pixel_data = []

        # Convert channel information to CMYK
        channel_length = parser.header.height * parser.header.width
        channel_length.times do |i|
          c = m = y = k = 0
          a = 255

          image_section.channel.channels.each_with_index do |channel, index|
            val = channel_data[i + (channel_length * index)]

            case channel
            when -1 then a = val
            when 0 then c = val
            when 1 then m = val
            when 2 then y = val
            when 3 then k = val
            end
          end

          rgb = PPSD::Color.cmyk_to_rgb(255 - c, 255 - m, 255 - y, 255 - k)
          pixel_data.push(ChunkyPNG::Color.rgba(*rgb.values, a))

          binding.pry unless @pixel_data[pixel_data.length - 1] == pixel_data[-1]
        end

        # Create png image from channel information
        png = ChunkyPNG::Canvas.new(parser.header.width, parser.header.height, ChunkyPNG::Color::TRANSPARENT)

        i = 0
        parser.header.height.times do |y|
          parser.header.width.times do |x|
            png[x, y] = pixel_data[i]
            i += 1
          end
        end

        png.save('out.png', :fast_rgba)
      end

      def rgba(r, g, b, a)
        r << 24 | g << 16 | b << 8 | a
      end
    end
  end
end
