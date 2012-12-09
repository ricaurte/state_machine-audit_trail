require 'rails/generators'

class StateMachine::AuditTrailGenerator < ::Rails::Generators::Base
  
  source_root File.join(File.dirname(__FILE__), 'templates')
  
  argument :source_model
  argument :state_attribute,  :default => 'state'
  argument :transition_model, :default => ''
  argument :additional_attribute, :default => "user"


  def create_model
    Rails::Generators.invoke('model', [transition_class_name, "#{source_model.tableize.singularize}:references", "#{additional_attribute}:references", "event:string", "from:string", "to:string", "created_at:timestamp", '--no-timestamps', '--fixture=false'])
  end
  
  protected
  
  def transition_class_name
    transition_model.blank? ? "#{source_model.camelize}#{state_attribute.camelize}Transition" : transition_model
  end
end
