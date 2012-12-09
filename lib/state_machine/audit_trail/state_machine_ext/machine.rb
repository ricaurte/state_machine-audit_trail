module StateMachine
  class Machine

    # Hook into the owner class and add the audit_opts attr_accessor, so that you can pass additional arguments to
    # state_machine-audit_trail by setting audit_opts
    def owner_class_set_with_audit_opts(owner_class)
      owner_class.class_eval { attr_accessor :_audit_trail_opts }
      owner_class_set_without_audit_opts(owner_class)
    end

    alias_method :owner_class_set_without_audit_opts, :owner_class=
    alias_method :owner_class=, :owner_class_set_with_audit_opts

  end
end
