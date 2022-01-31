require 'ffi'

module Linux
  module SELinux
    module Functions
      extend FFI::Library
      ffi_lib :selinux

      attach_function :freecon, [:string], :int
      attach_function :freeconary, [:pointer], :int
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
      attach_function :selinux_user_contexts_path, [], :string
      attach_function :selinux_users_path, [], :string
      attach_function :selinux_usersconf_path, [], :string
      attach_function :selinux_virtual_domain_context_path, [], :string
      attach_function :selinux_virtual_image_context_path, [], :string
      attach_function :selinux_x_context_path, [], :string

      attach_function :selinux_status_close, [], :void
      attach_function :selinux_status_deny_unknown, [], :int
      attach_function :selinux_status_open, [:int], :int
      attach_function :selinux_status_policyload, [], :int
      attach_function :selinux_status_updated, [], :int
    end

    module AVCFunctions
      extend FFI::Library

      class SecurityId < FFI::Struct
        layout(:ctx, :string, :refcnt, :uint)
      end

      ffi_lib :selinux
      attach_function :avc_add_callback, [:pointer], :int

      attach_function :avc_audit,
        [SecurityId, SecurityId, :ushort, :uint, :pointer, :int, :pointer],
        :void

      attach_function :avc_av_stats, [:void], :void
      attach_function :avc_cache_stats, [:pointer], :void
      attach_function :avc_cleanup, [:void], :void
      attach_function :avc_compute_create, [SecurityId, SecurityId, :ushort, :pointer], :int
      attach_function :avc_compute_member, [SecurityId, SecurityId, :ushort, :pointer], :int
      attach_function :avc_context_to_sid, [:string, :pointer], :int
      attach_function :avc_context_to_sid_raw, [:string, :pointer], :int
      attach_function :avc_destroy, [:void], :void
      attach_function :avc_get_initial_sid, [:string, :pointer], :int

      attach_function :avc_has_perm,
        [SecurityId, SecurityId, :ushort, :uint, :pointer, :pointer],
        :int

      attach_function :avc_has_perm_noaudit,
        [SecurityId, SecurityId, :ushort, :uint, :pointer, :pointer],
        :int

      attach_function :avc_netlink_acquire_fd, [:void], :int
      attach_function :avc_netlink_check_nb, [:void], :int
      attach_function :avc_netlink_close, [:void], :void
      attach_function :avc_netlink_loop, [:void], :void
      attach_function :avc_netlink_open, [:int], :int
      attach_function :avc_netlink_release_fd, [:void], :void
      attach_function :avc_open, [:pointer, :uint], :int
      attach_function :avc_reset, [:void], :int
      attach_function :avc_sid_stats, [:void], :void
      attach_function :avc_sid_to_context, [SecurityId, :string], :int
      attach_function :avc_sid_to_context_raw, [SecurityId, :string], :int
    end

    module ContextFunctions
      extend FFI::Library
      ffi_lib :selinux
      attach_function :context_free, [:pointer], :void
      attach_function :context_new, [:string], :pointer
      attach_function :context_range_get, [:pointer], :string
      attach_function :context_range_set, [:pointer, :string], :int
      attach_function :context_role_get, [:pointer], :string
      attach_function :context_role_set, [:pointer, :string], :int
      attach_function :context_str, [:pointer], :string
      attach_function :context_type_get, [:pointer], :string
      attach_function :context_type_set, [:pointer, :string], :int
      attach_function :context_user_get, [:pointer], :string
      attach_function :context_user_set, [:pointer, :string], :int

      attach_function :get_default_context, [:string, :string, :pointer], :int
      attach_function :get_default_context_with_level, [:string, :string, :pointer], :int
      attach_function :get_default_context_with_role, [:string, :string, :pointer], :int
      attach_function :get_default_context_with_rolelevel, [:string, :string, :pointer], :int
      attach_function :get_ordered_context_list, [:string, :string, :pointer], :int
      attach_function :get_ordered_context_list_with_level, [:string, :string, :pointer], :int
      attach_function :manual_user_enter_context, [:string, :string, :pointer], :int
      attach_function :query_user_context, [:pointer, :pointer], :int
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
