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

    example "file_context_homedir_path returns expected value" do
      expect(described_class.file_context_homedir_path).to be_kind_of(String)
      expect(described_class.file_context_homedir_path).to end_with('file_contexts.homedirs')
    end

    example "file_context_local_path returns expected value" do
      expect(described_class.file_context_local_path).to be_kind_of(String)
      expect(described_class.file_context_local_path).to end_with('file_contexts.local')
    end

    example "file_context_path returns expected value" do
      expect(described_class.file_context_path).to be_kind_of(String)
      expect(described_class.file_context_path).to end_with('file_contexts')
    end

    example "file_context_subs_path returns expected value" do
      expect(described_class.file_context_subs_path).to be_kind_of(String)
      expect(described_class.file_context_subs_path).to end_with('file_contexts.subs')
    end

    example "file_context_subs_dist_path returns expected value" do
      expect(described_class.file_context_subs_dist_path).to be_kind_of(String)
      expect(described_class.file_context_subs_dist_path).to end_with('file_contexts.subs_dist')
    end
  end

  context "security functions" do
    subject{ Linux::SELinux::Security }
    let(:boolean_name) { "domain_fd_use" }

    example "get_boolean_active returns expected value" do
      expect(subject.get_boolean_active(boolean_name)).to be_kind_of(Integer)
      expect(subject.get_boolean_active(boolean_name)).to eq(0).or eq(1)
    end

    example "get_boolean_pending returns expected value" do
      expect(subject.get_boolean_pending(boolean_name)).to be_kind_of(Integer)
      expect(subject.get_boolean_pending(boolean_name)).to eq(0).or eq(1)
    end

    example "get_boolean_names returns expected value" do
      expect(subject.get_boolean_names).to be_kind_of(Array)
      expect(subject.get_boolean_names.size).to be > 10
      expect(subject.get_boolean_names).to all(be_a(String))
    end

    example "get_enforcement returns expected value" do
      expect(subject.get_enforcement).to be_kind_of(Integer)
      expect(subject.get_enforcement).to eq(0).or eq(1)
    end

    example "policy_version returns expected value" do
      expect(subject.policy_version).to be_kind_of(Integer)
      expect(subject.policy_version).to be > 0
    end
  end
end
