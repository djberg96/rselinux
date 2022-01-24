require 'linux/selinux'
require 'rspec'

RSpec.describe Linux::SELinux do
  context "selinux" do
    example "enabled? method returns a boolean" do
      expect(described_class).to respond_to(:enabled?)
      expect(described_class.enabled?).to eq(true)
    end

    example "get_enforce_mode returns expected value" do
      expect(described_class).to respond_to(:get_enforce_mode)
      expect(described_class.get_enforce_mode).to be_kind_of(Integer)
      expect(described_class.get_enforce_mode).to eq(1).or eq(0).or eq(-1)
    end
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

    example "lxc_contexts_path returns expected value" do
      expect(described_class.lxc_contexts_path).to be_kind_of(String)
      expect(described_class.lxc_contexts_path).to end_with('lxc_contexts')
    end

    example "media_context_path returns expected value" do
      expect(described_class.media_context_path).to be_kind_of(String)
      expect(described_class.media_context_path).to end_with('media')
    end

    example "netfilter_context_path returns expected value" do
      expect(described_class.netfilter_context_path).to be_kind_of(String)
      expect(described_class.netfilter_context_path).to end_with('netfilter_contexts')
    end

    example "path returns expected value" do
      expect(described_class.path).to be_kind_of(String)
      expect(described_class.path).to end_with('selinux/')
    end

    example "policy_root returns expected value" do
      expect(described_class.policy_root).to be_kind_of(String)
      expect(described_class.policy_root).to end_with('selinux/targeted')
    end
  end

  context "status" do
    subject{ Linux::SELinux::Status }

    example "policy_load returns expected value" do
      expect(subject.policy_load).to be_kind_of(Integer)
      expect(subject.policy_load).to eq(-1).or be >= 0
    end

    example "updated returns expected value" do
      expect(subject.updated).to be_kind_of(Integer)
      expect(subject.updated).to eq(-1).or eq(0).or eq(1)
    end

    example "deny_unknown returns expected value" do
      expect(subject.deny_unknown).to be_kind_of(Integer)
      expect(subject.deny_unknown).to eq(-1).or eq(0).or eq(1)
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
