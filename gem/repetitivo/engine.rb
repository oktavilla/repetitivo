module Repetitivo
  class Engine < Rails::Engine
    config.assets.paths << File.expand_path("../../../lib", __FILE__)
  end
end
