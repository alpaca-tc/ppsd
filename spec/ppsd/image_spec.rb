require 'spec_helper'

RSpec.describe PPSD::Image do
  let(:image) { described_class.new(parser) }
  let(:parser) { PPSD::Parser.new(path) }

  let(:path) do
    spec_root.join('fixtures/cmyk_mode_100x100.psd')
  end

  describe '#compression_method' do
    subject { image.compression_method }
    it { is_expected.to eq(1) }
  end

  describe '#variable' do
    subject { image.variable }
    it { is_expected.to eq(1) }
  end
end
