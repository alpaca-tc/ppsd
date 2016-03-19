require 'spec_helper'

RSpec.describe PPSD::ImageResources do
  let(:image_resources) { described_class.new(psd_file) }
  let(:psd_file) { PPSD::PsdFile.new(path) }
  let(:path) do
    spec_root.join('fixtures/cmyk_mode_100x100.psd')
  end

  describe '#resources' do
    subject { image_resources.resources }
    it { is_expected.to be_a(Array) }
  end

  describe '#termination_pos' do
    subject { image_resources.termination_pos }
    it { is_expected.to be_a(Integer) }
  end
end
