require 'spec_helper'

RSpec.describe PPSD::Image do
  let(:image) { described_class.new(parser) }
  let(:parser) { PPSD::Parser.new(path) }

  let(:path) do
    '/Users/alpaca-tc/Desktop/cmyk test.psd'
  end

  # describe '#compression_method' do
  #   subject { image.compression_method }
  #   it { is_expected.to eq(1) }
  # end
  #
  # describe '#channel' do
  #   subject { image.channel }
  #   it { is_expected.to be_a(PPSD::Channel) }
  # end

  describe '#to_file' do
    subject { image.to_file }
    it { is_expected.to eq(1) }
  end
end
