class PPSD::ImageParser
  autoload :Raw, 'ppsd/image_parser/raw'
  autoload :RleCompressed, 'ppsd/image_parser/rle_compressed'
  autoload :ZipWithoutPrediction, 'ppsd/image_parser/zip_without_prediction'
  autoload :ZipWithPrediction, 'ppsd/image_parser/zip_with_prediction'

  attr_reader :image_section, :parser, :psd_file

  def initialize(image_section)
    @image_section = image_section
    @parser = @image_section.parser
    @psd_file = @image_section.psd_file
  end

  def to_file(path)
    File.open(path, 'w') do |io|
      write_image_with_io(io)
    end
  end

  private

  def seek_variable_head
    @psd_file.seek(@image_section.variable_pos, IO::SEEK_SET)
  end

  def write_image_with_io(io)
    raise NotImplementedError, 'not implemented yet'
  end
end
