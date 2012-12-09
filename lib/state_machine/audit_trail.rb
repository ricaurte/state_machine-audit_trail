require 'state_machine'

module StateMachine::AuditTrail
    
  VERSION = "0.1.3"
    
  def self.setup
    StateMachine::Machine.send(:include, StateMachine::AuditTrail::TransitionAuditing)
  end
end

require 'state_machine/audit_trail/transition_auditing'
require 'state_machine/audit_trail/backend'
require 'state_machine/audit_trail/railtie' if defined?(::Rails)
require 'state_machine/audit_trail/state_machine_ext/machine'

StateMachine::AuditTrail.setup
