 
Pod::Spec.new do |s|
  s.name         = "runtimeDemo"
  s.version      = "0.0.3"
  s.ios.deployment_target = '6.0'
  s.summary      = "runtimeDemo gogogo"
  s.homepage     = "https://github.com/MrNobodyGithub/runtimeDemo"
  s.license      = "MIT"
  s.author             = { "zhaocg" => "1508122971@qq.com" }
#   s.social_media_url   = "http://weibo.com/exceptions"
  s.source       = { :git => "https://github.com/MrNobodyGithub/runtimeDemo.git", :tag => s.version }
  s.source_files  = "runtimeDemo"
  s.requires_arc = true
end
