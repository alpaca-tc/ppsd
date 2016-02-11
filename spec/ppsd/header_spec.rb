require 'spec_helper'

RSpec.describe PPSD::Header do
  let(:header) { described_class.new(psd_file) }
  let(:psd_file) { PPSD::PsdFile.new(path) }
  let(:path) do
    spec_root.join('fixtures/cmyk_mode_100x100.psd')
  end

  describe '#signature' do
    subject { header.signature }
    it { is_expected.to eq('8BPS') }
  end

  describe '#width' do
    subject { header.width }
    it { is_expected.to eq(100) }
  end

  describe '#height' do
    subject { header.height }
    it { is_expected.to eq(100) }
  end

  describe '#channels' do
    subject { header.channels }
    it { is_expected.to eq(4) }
  end

  describe '#version' do
    subject { header.version }
    it { is_expected.to eq(1) }
  end

  describe '#color_mode' do
    subject { header.color_mode }
    it { is_expected.to eq('CMYKColor') }
  end
end
