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

  describe "#pull" do
    subject { @app_list.pull }

    it { is_expected.not_to be_nil }

    it "fetches itunes store data" do
      expect(subject).to include(:play_store_info)
    end
  end
end
