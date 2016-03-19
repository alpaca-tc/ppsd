require 'spec_helper'

RSpec.describe PPSD::ColorModeData do
  let(:color_mode_data) { described_class.new(parser) }
  let(:parser) { PPSD::Parser.new(path) }
  let(:path) do
    spec_root.join('fixtures/cmyk_mode_100x100.psd')
  end

  describe '#termination_pos' do
    subject { color_mode_data.termination_pos }
    it { is_expected.to be_a(Integer) }
    it { is_expected.to eq(30) } # Debug
  end

  describe '#color_mode_data' do
    subject { color_mode_data.color_mode_data }
    it { expect { subject }.to raise_error(NotImplementedError) }
  end
end
