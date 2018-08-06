Pod::Spec.new do |s|
  s.name         = 'GhostTyping'
  s.version      = '0.0.1'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.summary      = 'Beautiful iOS type writing animation like a ghost.'
  s.homepage     = 'https://github.com/huynguyen-n/GhostTyping'
  s.social_media_url = 'https://twitter.com/__huynguyen'
  s.author       = { 'Huy Nguyen' => 'huynguyen@gmail.com' }
  s.description  = <<-DESC
GhostTyping basically is a UIView for iOS with UITextField type writing inside. Beside that, I will add more as possible animations and custom font, cursor to improve that better about performance and beauty.
DESC

  s.source       = { :git => 'https://github.com/huynguyen-n/GhostTyping.git', :tag => s.version.to_s }
  s.source_files = 'Sources/GhostTyping/*.swift'

  s.swift_version = '4.1'
  s.ios.deployment_target = '9.0'

  s.frameworks = 'UIKit'
  s.requires_arc = true
end
