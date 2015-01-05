Pod::Spec.new do |s|
  s.name         = "HaidoraCheckView"
  s.version      = "1.0"
  s.summary      = "a custom CheckView"

  s.description  = <<-DESC
                   A longer description of HaidoraCheckView in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC

  s.homepage     = "https://github.com/Haidora/HaidoraCheckView"
  s.license      = { :type => "BSD", :file => "LICENSE" }
  s.author             = { "mrdaios" => "mrdaios@gmail.com" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/Haidora/HaidoraChart.git", :tag => "#{s.version}" }
  s.source_files  = "Source", "Source/**/*.{h,m}"
  s.resources = ["Resource/XIB/*.xib","Resource/HaidoraCheckView.bundle"]
  s.frameworks = "UIKit", "Foundation"
  s.requires_arc = true
end
