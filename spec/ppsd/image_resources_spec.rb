require 'spec_helper'

RSpec.describe PPSD::ImageResources do
  let(:image_resources) { described_class.new(parser) }
  let(:parser) { PPSD::Parser.new(path) }
  let(:path) do
    spec_root.join('fixtures/cmyk_mode_100x100.psd')
  end

  describe '#resources' do
    subject { image_resources.resources }
    it { is_expected.to be_a(Array) }

    specify 'image resource has signature' do
      subject.each do |image_resource|
        expect(image_resource.signature).to eq('8BIM')
      end
    end
  end

  describe '#termination_pos' do
    subject { image_resources.termination_pos }
    it { is_expected.to be_a(Integer) }
  end
end
