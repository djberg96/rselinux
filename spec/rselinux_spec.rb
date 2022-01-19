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

    example "contexts_path returns expected value" do
      expect(described_class.contexts_path).to be_kind_of(String)
      expect(described_class.contexts_path).to end_with('contexts')
    end

    example "current_policy_path returns expected value" do
      expect(described_class.current_policy_path).to be_kind_of(String)
      expect(described_class.current_policy_path).to end_with('policy')
    end

    example "customizable_types_path returns expected value" do
      expect(described_class.customizable_types_path).to be_kind_of(String)
      expect(described_class.customizable_types_path).to end_with('customizable_types')
    end

    example "default_context_path returns expected value" do
      expect(described_class.default_context_path).to be_kind_of(String)
      expect(described_class.default_context_path).to end_with('default_contexts')
    end

    example "default_type_path returns expected value" do
      expect(described_class.default_type_path).to be_kind_of(String)
      expect(described_class.default_type_path).to end_with('default_type')
    end

    example "failsafe_context_path returns expected value" do
      expect(described_class.failsafe_context_path).to be_kind_of(String)
      expect(described_class.failsafe_context_path).to end_with('failsafe_context')
    end
  end
end
