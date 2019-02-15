Pod::Spec.new do |s|
  s.name	= 'DJEmptyView'
  s.version	= '1.1.0'
  s.summary	= 'Add an empty view to your table view with one line of codes..'
  s.homepage	= 'https://github.com/iwufan/DJEmptyView'
  s.license	= 'MIT'
  s.platform	= :ios
  s.swift_version = '4.2'
  s.author 	= {'jiadawei' => 'jiadawei80@126.com'}
  s.ios.deployment_target = '9.0'
  s.source	= {:git => 'https://github.com/iwufan/DJEmptyView.git', :tag => s.version}
  s.source_files = 'DJEmptyViewDemo/DJEmptyViewDemo/DJEmptyView/**/*.{swift}'
  s.requires_arc = true
  s.frameworks	= 'UIKit'
end
