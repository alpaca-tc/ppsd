require 'spec_helper'

RSpec.describe PPSD::Parser do
  let(:parser) { described_class.new(path) }

  let(:path) do
    spec_root.join('fixtures/cmyk_mode_100x100.psd')
  end

  describe '#header' do
    subject { parser.header }
    it { is_expected.to be_a(PPSD::Header) }
  end

  describe '#color_mode_data' do
    subject { parser.color_mode_data }
    it { is_expected.to be_a(PPSD::ColorModeData) }
  end

  describe '#image_resources' do
    subject { parser.image_resources }
    it { is_expected.to be_a(PPSD::ImageResources) }
  end

  describe '#layer_and_mask_information' do
    subject { parser.layer_and_mask_information }
    it { is_expected.to be_a(PPSD::LayerAndMaskInformation) }
  end

  describe '#image' do
    subject { parser.image }
    it { is_expected.to be_a(PPSD::Image) }
  end
end
