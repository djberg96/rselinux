require 'linux/selinux'
require 'rspec'

RSpec.describe Linux::SELinux do
  example "enabled? method returns a boolean" do
    expect(described_class).to respond_to(:enabled?)
    expect(described_class.enabled?).to eq(true)
  end
end
