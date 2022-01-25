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

    def get_enforce_mode
      value = nil

      FFI::MemoryPointer.new(:int) do |ptr|
        selinux_getenforcemode(ptr)
        value = ptr.read_int
      end

      value
    end

    module_function :get_enforce_mode

    def lxc_contexts_path
      selinux_lxc_contexts_path
    end

    module_function :lxc_contexts_path

    def media_context_path
      selinux_media_context_path
    end

    module_function :media_context_path

    def netfilter_context_path
      selinux_netfilter_context_path
    end

    module_function :netfilter_context_path

    def path
      selinux_path
    end

    module_function :path

    def policy_root
      selinux_policy_root
    end

    module_function :policy_root

    def user_contexts_path
      selinux_user_contexts_path
    end

    module_function :user_contexts_path

    def users_path
      selinux_users_path
    end

    module_function :users_path

    def usersconf_path
      selinux_usersconf_path
    end

    module_function :usersconf_path

    def virtual_domain_context_path
      selinux_virtual_domain_context_path
    end

    module_function :virtual_domain_context_path

    def virtual_image_context_path
      selinux_virtual_image_context_path
    end

    module_function :virtual_image_context_path

    def x_context_path
      selinux_x_context_path
    end

    module_function :x_context_path

    module Status
      extend Linux::SELinux::Functions

      def policy_load
        begin
          selinux_status_open(1)
          selinux_status_policyload
        ensure
          selinux_status_close
        end
      end

      module_function :policy_load

      def updated
        begin
          selinux_status_open(1)
          selinux_status_updated
        ensure
          selinux_status_close
        end
      end

      module_function :updated

      def deny_unknown
        begin
          selinux_status_open(1)
          selinux_status_deny_unknown
        ensure
          selinux_status_close
        end
      end

      module_function :deny_unknown
    end

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
