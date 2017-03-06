Pod::Spec.new do |s|

  s.name         = "ASAKvcModel"
  s.version      = "0.0.1"
  s.license      = "MIT"
  s.summary      = "KVC model for Swift 3."
  s.homepage     = "https://github.com/asashin227/ASAKvcModel.git"
  
  s.author       = { "" => "" }
  s.source       = { :git => "https://github.com/asashin227/ASAKvcModel.git", :tag => "#{s.version}" }
  
  s.ios.deployment_target = '8.0'
  
  s.source_files  = "ASAKvcModel/Source/*.swift"

end
