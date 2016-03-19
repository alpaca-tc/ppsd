require 'spec_helper'

RSpec.describe PPSD::LayerAndMaskInformation do
  let(:instance) { described_class.new(parser) }
  let(:parser) { PPSD::Parser.new(path) }
  let(:path) do
    spec_root.join('fixtures/cmyk_mode_100x100.psd')
  end

  describe '#termination_pos' do
    subject { instance.termination_pos }
    it { is_expected.to be_a(Integer) }
  end
end
