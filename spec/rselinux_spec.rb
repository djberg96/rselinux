require 'linux/selinux'
require 'rspec'

RSpec.describe Linux::SELinux do
  example "enabled? method returns a boolean" do
    expect(described_class).to respond_to(:enabled?)
    expect(described_class.enabled?).to eq(true)
  end

  context "path functions" do
    example "booleans_path returns expected value" do
      expect(described_class.booleans_path).to be_kind_of(String)
      expect(described_class.booleans_path).to end_with('booleans')
    end

    example "binary_policy_path returns expected value" do
      expect(described_class.binary_policy_path).to be_kind_of(String)
      expect(described_class.binary_policy_path).to end_with('policy')
    end

    example "colors_path returns expected value" do
      expect(described_class.colors_path).to be_kind_of(String)
      expect(described_class.colors_path).to end_with('secolor.conf')
    end
  end
end
