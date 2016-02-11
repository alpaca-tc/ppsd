require 'spec_helper'

RSpec.describe PPSD::PsdFile do
  describe '#initialize' do
    subject { described_class.new(path) }
    let(:path) do
      spec_root.join('fixtures/cmyk_mode_100x100.psd')
    end

    it { is_expected.to be_a(File) }
  end
end
