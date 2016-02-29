module Repetitivo
  if defined?(Rails) && defined?(Rails::Engine)
    class Engine < ::Rails::Engine
      require "repetitivo/engine"
    end
  else
    repetitivo_path = File.expand_path("../../lib", __FILE__)
    ENV["SASS_PATH"] = [ENV["SASS_PATH"], repetitivo_path].compact.join(File::PATH_SEPARATOR)
  end
end
