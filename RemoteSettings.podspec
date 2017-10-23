#
#  Be sure to run `pod spec lint RemoteSettings.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "RemoteSettings"
  s.version      = "1.0"
  s.summary      = "RemoteSettings helps you to fetch and store basic remote data."

  s.description  = <<-DESC
                    RemoteSettings is a framework that helps you to fetch remote data and to store them into a specific data structure.
                   DESC

  s.homepage     = "https://github.com/tbointeractive/RemoteSettings"

  s.license      = "MIT"

  s.author      = { "Cornelius Horstmann" => "horstmann@tbointeractive.com", "Thorsten Stark" => "stark@tbointeractive.com", "Bernhard Eiling" => "eiling@tbointeractive.com", "Pascal Stüdlein" => "stuedlein@tbointeractive.com"  }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/tbointeractive/RemoteSettings.git", :tag => 'v1.0' }

  s.source_files = "RemoteSettings/*.swift"
end
