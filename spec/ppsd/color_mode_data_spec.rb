require 'spec_helper'

RSpec.describe PPSD::ColorModeData do
  let(:color_mode_data) { described_class.new(psd_file) }
  let(:psd_file) { PPSD::PsdFile.new(path) }
  let(:path) do
    spec_root.join('fixtures/cmyk_mode_100x100.psd')
  end

  describe '#color_data' do
    subject { color_mode_data.color_mode_data }
    it { is_expected.to be_present }
  end
end
