Pod::Spec.new do |s|
  s.name         = 'GhostTyping'
  s.version      = '0.0.1'
  s.summary      = 'Beautiful iOS type writing animation like a ghost.'
  s.description  = <<-DESC
GhostTyping basically is a UIView for iOS with type writing animation inside. Beside that, I will add more as possible animations and custom font, cursor to improve that better about performance and beauty.
DESC
  s.homepage     = 'https://github.com/huynguyen-n/GhostTyping'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Huy Nguyen' => 'huynguyen@gmail.com' }
  s.source       = { :git => 'https://github.com/huynguyen-n/GhostTyping.git', :tag => s.version.to_s }
  s.source_files = 'GhostTyping/GhostTyping/*.swift'
  s.ios.deployment_target = '9.0'
end
