Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ――― #
  spec.name         = "AdmobUltils"
  spec.version      = "0.0.1"
  spec.summary      = "AdMob + mediation + Firebase + UI helpers for iOS apps."

  spec.description  = <<-DESC
AdmobUltils is a small utility library that centralizes:
- Google Mobile Ads SDK + mediation adapters
- Firebase (Analytics, Remote Config, Crashlytics)
- Consent (GoogleUserMessagingPlatform)
- Facebook SDK
- Lottie animations
- SwiftUI shimmer helpers

for apps like FallingFilter.
  DESC

  spec.homepage     = "https://github.com/TienNguyen267/AdmobUltils"

  # ―――  License  ――― #
  spec.license      = { :type => "MIT" }

  # ―――  Author  ――― #
  spec.author       = { "VietTienNguyen" => "viettiennguyen2607@gmail.com" }

  # ―――  Platform  ――― #
  spec.ios.deployment_target = "13.0"
  spec.swift_version         = "5.0"

  # ―――  Source Location  ――― #
  spec.source = {
    :git => "https://github.com/TienNguyen267/AdmobUltils.git",
    :tag => spec.version.to_s
  }

  # ―――  Source Code  ――― #
  # Gợi ý: code Swift nằm trong Sources/AdmobUltils/...
  spec.source_files  = "Sources/**/*.{swift}"

  # Nếu sau này có resource:
  # spec.resource_bundles = {
  #   "AdmobUltilsResources" => ["Sources/AdmobUltils/Resources/**/*"]
  # }

  # ―――  Dependencies  ――― #
  # 1. SolarEngine + mediation pods
  spec.dependency "SolarEngineSDKiOSInter", "~> 1.3.1.0"
  spec.dependency "GoogleMobileAdsMediationFacebook"
  spec.dependency "GoogleMobileAdsMediationMintegral"
  spec.dependency "GoogleMobileAdsMediationIronSource"
  spec.dependency "GoogleMobileAdsMediationAppLovin"
  spec.dependency "GoogleMobileAdsMediationPangle"
  spec.dependency "GoogleMobileAdsMediationVungle"
  spec.dependency "GoogleMobileAdsMediationUnity"

  # 2. Google Mobile Ads SDK (thay cho SPM GoogleMobileAds)
  spec.dependency "Google-Mobile-Ads-SDK"

  # 3. Consent SDK (GoogleUserMessagingPlatform)
  spec.dependency "GoogleUserMessagingPlatform"

  # 4. Firebase
  spec.dependency "FirebaseCore"
  spec.dependency "FirebaseAnalytics"
  spec.dependency "FirebaseRemoteConfig"
  spec.dependency "FirebaseCrashlytics"

  # 5. Facebook iOS SDK (tối thiểu CoreKit)
  # Có thể thêm LoginKit/ShareKit nếu bạn dùng
  spec.dependency "FBSDKCoreKit"
  # spec.dependency "FBSDKLoginKit"
  # spec.dependency "FBSDKShareKit"

  # 6. Lottie
  # Pod name là 'lottie-ios', module bạn import trong Swift là `Lottie`
  spec.dependency "lottie-ios"

  # 7. SwiftUI-Shimmer
  # Repo có hỗ trợ CocoaPods (pod 'SwiftUI-Shimmer', :git => ...).
  # Nếu podspec của nó đã được publish lên trunk thì dòng dưới sẽ ok.
  # Nếu lint/publish bị lỗi không tìm thấy, thì giữ SwiftUI-Shimmer ở Podfile app.
  spec.dependency "SwiftUI-Shimmer"

  # ⚠️ Lưu ý về modular_headers:
  # Các dòng:
  #   pod 'GoogleUtilities', :modular_headers => true
  #   pod 'GoogleDataTransport', :modular_headers => true
  #   pod 'nanopb', :modular_headers => true
  #   pod 'FirebaseABTesting', :modular_headers => true
  # phải config trong Podfile của app, không set kiểu này trong podspec được.
end

