require_relative 'selinux/functions'

module Linux
  module SELinux
    module Security
      extend Linux::SELinux::Functions
      def get_enforcement
        security_getenforce()
      end

      module_function :get_enforcement
    end
  end
end
