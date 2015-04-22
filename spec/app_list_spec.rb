Bundler.require :default, :development

require_relative '../app_list'

RSpec.describe AppList do
  before do
    settings = {
      access_token: "access-token",
      space: "space-id",
      apps_type: 'content-type-id',
      locale: "de-DE"
    }

    @app_list = AppList.new settings
  end

  describe "#sync" do
    it "calls #pull and #push" do
      expect(@app_list).to receive(:pull)
      expect(@app_list).to receive(:push)

      @app_list.sync
    end
  end

  describe "#pull" do
    subject { @app_list.pull }

    it { is_expected.to be_an Array }

    it { is_expected.not_to be_empty }
  end

  describe "#push" do
    before { @app_list.pull }
    subject { @app_list.push }

    it { is_expected.to be true }
  end
end
