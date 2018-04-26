#
#  Be sure to run `pod spec lint ConvenienceKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.name         = "ConvenientKit"
  s.version      = "0.1.2"
  s.summary      = "A small library of good solutions."
  s.description  = "This library contains many classes and extensions that are designed to reduce the amount of code that is copied from the one project to another."
  s.homepage     = "https://github.com/Pan-TERRA/ConvenientKit"

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.license = { :type => 'MIT', :file => 'LICENSE' }

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.author             = { "Vlad Krut" => "pan.terra37@gmail.com" }

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.platform     = :ios, "10.0"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source       = { :git => "https://github.com/Pan-TERRA/ConvenientKit.git", :tag => "#{s.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source_files  = "ConvenientKit", "ConvenientKit/**/*.{h,m,swift}"

  # ――― Configuration ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.swift_version = '4.0'

end
