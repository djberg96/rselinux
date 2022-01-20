require_relative 'selinux/functions'

module Linux
  module SELinux
    extend Linux::SELinux::Functions

    def enabled?
      is_selinux_enabled || is_selinux_mls_enabled
    end

    module_function :enabled?

    def booleans_path
      selinux_booleans_path
    end

    module_function :booleans_path

    def binary_policy_path
      selinux_binary_policy_path
    end

    module_function :binary_policy_path

    def colors_path
      selinux_colors_path
    end

    module_function :colors_path

    def contexts_path
      selinux_contexts_path
    end

    module_function :contexts_path

    def current_policy_path
      selinux_current_policy_path
    end

    module_function :current_policy_path

    def customizable_types_path
      selinux_customizable_types_path
    end

    module_function :customizable_types_path

    def default_context_path
      selinux_default_context_path
    end

    module_function :default_context_path

    def default_type_path
      selinux_default_type_path
    end

    module_function :default_type_path

    def failsafe_context_path
      selinux_failsafe_context_path
    end

    module_function :failsafe_context_path

    def file_context_homedir_path
      selinux_file_context_homedir_path
    end

    module_function :file_context_homedir_path

    def file_context_local_path
      selinux_file_context_local_path
    end

    module_function :file_context_local_path

    def file_context_path
      selinux_file_context_path
    end

    module_function :file_context_path

    def file_context_subs_path
      selinux_file_context_subs_path
    end

    module_function :file_context_subs_path

    def file_context_subs_dist_path
      selinux_file_context_subs_dist_path
    end

    module_function :file_context_subs_dist_path

    module Security
      extend Linux::SELinux::SecurityFunctions

      def get_boolean_active(name)
        security_get_boolean_active(name)
      end

      module_function :get_boolean_active

      def get_boolean_pending(name)
        security_get_boolean_pending(name)
      end

      module_function :get_boolean_pending

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
