require 'ffi'

module Linux
  module SELinux
    module Functions
      extend FFI::Library
      ffi_lib :selinux
      attach_function :is_selinux_enabled, [], :bool
      attach_function :is_selinux_mls_enabled, [], :bool
    end

    module SecurityFunctions
      extend FFI::Library
      ffi_lib :selinux
      attach_function :security_getenforce, [], :int
      attach_function :security_setenforce, [:int], :int
      attach_function :security_policyvers, [], :int

      attach_function :selinux_getenforcemode, [:pointer], :int
    end
  end
end
