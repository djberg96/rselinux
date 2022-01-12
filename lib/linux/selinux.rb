require_relative 'selinux/functions'

module Linux
  module SELinux
    extend Linux::SELinux::Functions

    def enabled?
      is_selinux_enabled || is_selinux_mls_enabled
    end

    module_function :enabled?

    module Security
      extend Linux::SELinux::Functions
      def get_enforcement
        security_getenforce
      end

      def set_enforcement(level)
        security_setenforce(level)
      end

      def policy_version
        security_policyvers
      end

      module_function :get_enforcement
      module_function :set_enforcement
      module_function :policy_version
    end
  end
end

p Linux::SELinux.enabled?
