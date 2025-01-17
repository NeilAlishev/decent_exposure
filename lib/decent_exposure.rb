require "decent_exposure/version"
require "active_support/all"
require "generators/decent_exposure/scaffold_templates_generator"

module DecentExposure
  autoload :Controller, "decent_exposure/controller"
  autoload :Exposure,   "decent_exposure/exposure"
  autoload :Attribute,  "decent_exposure/attribute"
  autoload :Context,    "decent_exposure/context"
  autoload :Behavior,   "decent_exposure/behavior"
  autoload :Flow,       "decent_exposure/flow"

  ActiveSupport.on_load :action_controller do
    include Controller
  end
end
