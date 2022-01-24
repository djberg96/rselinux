require 'ffi'

module Linux
  module SELinux
    module Functions
      extend FFI::Library
      ffi_lib :selinux
      attach_function :is_selinux_enabled, [], :bool
      attach_function :is_selinux_mls_enabled, [], :bool
      attach_function :selinux_binary_policy_path, [], :string
      attach_function :selinux_booleans_path, [], :string
      attach_function :selinux_colors_path, [], :string
      attach_function :selinux_contexts_path, [], :string
      attach_function :selinux_current_policy_path, [], :string
      attach_function :selinux_customizable_types_path, [], :string
      attach_function :selinux_default_context_path, [], :string
      attach_function :selinux_default_type_path, [], :string
      attach_function :selinux_failsafe_context_path, [], :string
      attach_function :selinux_file_context_homedir_path, [], :string
      attach_function :selinux_file_context_local_path, [], :string
      attach_function :selinux_file_context_path, [], :string
      attach_function :selinux_file_context_subs_path, [], :string
      attach_function :selinux_file_context_subs_dist_path, [], :string
      attach_function :selinux_file_context_verify, [:string, :mode_t], :int
      attach_function :selinux_getenforcemode, [:pointer], :int
      attach_function :selinux_lxc_contexts_path, [], :string
      attach_function :selinux_media_context_path, [], :string
      attach_function :selinux_netfilter_context_path, [], :string
      attach_function :selinux_path, [], :string
      attach_function :selinux_policy_root, [], :string

      attach_function :selinux_status_close, [], :void
      attach_function :selinux_status_deny_unknown, [], :int
      attach_function :selinux_status_open, [:int], :int
      attach_function :selinux_status_policyload, [], :int
      attach_function :selinux_status_updated, [], :int
    end

    module SecurityFunctions
      extend FFI::Library
      ffi_lib :selinux
      attach_function :security_get_boolean_active, [:string], :int
      attach_function :security_get_boolean_pending, [:string], :int
      attach_function :security_get_boolean_names, [:pointer, :pointer], :int
      attach_function :security_getenforce, [], :int
      attach_function :security_setenforce, [:int], :int
      attach_function :security_policyvers, [], :int
    end
  end
end
