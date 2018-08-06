#!/usr/bin/env ruby

require 'xcodeproj'

task :xcodeproj do
  system "swift package generate-xcodeproj"

  project = Xcodeproj::Project.open(Dir["*.xcodeproj"].first)
  project.build_configurations.each { |config|
    config.build_settings["SDKROOT"] = "iphoneos"
    config.build_settings.delete("SUPPORTED_PLATFORMS")
  }
  project.save

end
