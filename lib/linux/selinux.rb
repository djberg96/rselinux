require_relative 'selinux/functions'

module Linux
  module SELinux
    extend Linux::SELinux::Functions

    def enabled?
      is_selinux_enabled || is_selinux_mls_enabled
    end

    module_function :enabled?

    module Security
      extend Linux::SELinux::SecurityFunctions
      def get_boolean_names
        names = FFI::MemoryPointer.new(:pointer)
        length = FFI::MemoryPointer.new(:int)

        security_get_boolean_names(names, length)

        #length.read_int.times do |i|
        pointer1 = names.read_pointer
        pointer2 = pointer1.read_pointer
        string =  pointer2.read_string
        p string

        pointer1 += FFI::Type::POINTER.size
        pointer2 = pointer1.read_pointer
        string =  pointer2.read_string
        p string
        #end
      end

      def get_enforcement
        security_getenforce
      end

      def set_enforcement(level)
        security_setenforce(level)
      end

      def policy_version
        security_policyvers
      end

      module_function :get_boolean_names
      module_function :get_enforcement
      module_function :set_enforcement
      module_function :policy_version
    end
  end
end

Linux::SELinux::Security.get_boolean_names
