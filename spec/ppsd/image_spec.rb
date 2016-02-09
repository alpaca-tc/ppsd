require 'ppsd'

RSpec.describe PPSD::Image do
  let(:image) { described_class.new }

  describe '#hello' do
    subject { image.hello }
    it { is_expected.to eq('') }
  end
end
