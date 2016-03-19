class PPSD
  class ImageParser
    class RleCompressed < ImageParser
      private

      def write_image_with_io(io)
        seek_section_head


        binding.pry;
        io.instance_eval do

        end
      end
    end
  end
end
