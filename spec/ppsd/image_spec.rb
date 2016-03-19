require 'ppsd'

RSpec.describe PPSD::Image do
  let(:image) { described_class.new(parser) }
  let(:parser) { PPSD::Parser.new(path) }

  let(:path) do
    spec_root.join('fixtures/cmyk_mode_100x100.psd')
  end
end
