require_relative 'selinux/functions'

module Linux
  module SELinux
    extend Linux::SELinux::Functions

    def enabled?
      is_selinux_enabled || is_selinux_mls_enabled
    end

    def booleans_path
      selinux_booleans_path
    end

    module_function :enabled?
    module_function :booleans_path

    module Security
      extend Linux::SELinux::SecurityFunctions
      def get_boolean_names
        names = FFI::MemoryPointer.new(:pointer)
        length = FFI::MemoryPointer.new(:int)

        security_get_boolean_names(names, length)

        outer_pointer = names.read_pointer
        array = Array.new(length.read_int)

        array.size.times do |i|
          inner_pointer = outer_pointer.read_pointer
          array[i] = inner_pointer.read_string
          outer_pointer += FFI::Type::POINTER.size
        end

        array
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

p Linux::SELinux.booleans_path
