
Pod::Spec.new do |s|

  s.name         = "CBTableViewDataSource-AutoHeight"
  s.version      = "0.0.3"
  s.summary      = "CBTableViewDataSource自动计算高度的扩展"
  s.description  = "CBTableViewDataSource的扩展，这个框架用起来不错，就是在自动布局计算的时候有点问题，添加了一个类别调用UITableView-FDTemplateLayoutCell来计算高度。布局支持Masonry。"
  s.homepage     = "https://github.com/ZWXAllen/CBTableViewDataSource-AutoHeight"
  s.license      = "MIT"
  s.author       = { "Allen" => "39341184@qq.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/ZWXAllen/CBTableViewDataSource-AutoHeight.git", :tag => "0.0.3" }
  s.source_files  = "CBTableViewDataSource-AutoHeight", "CBTableViewDataSource-AutoHeight/**/*.{h,m}"
  s.public_header_files = "CBTableViewDataSource-AutoHeight/**/*.h"
  s.requires_arc = true
  s.framework  = "UIKit"
  s.dependency "CBTableViewDataSource", "~> 1.1.0"
  s.dependency "UITableView+FDTemplateLayoutCell", "~> 1.6"

end
