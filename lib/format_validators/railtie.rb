require 'rails'

require 'dynamic_fieldsets/config'

module FormatValidators
  class Railtie < ::Rails::Railtie
    initializer 'format_validators' do |app|
      # just an example, delete if needed
      # require 'dynamic_fieldsets/dynamic_fieldsets_in_model'
      # ActiveRecord::Base.send :include, DynamicFieldsets::DynamicFieldsetsInModel
    end
  end
end
