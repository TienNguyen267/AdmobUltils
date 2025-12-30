Pod::Spec.new do |spec|

  spec.name         = "AdmobUltils"
  spec.version      = "0.0.1"
  spec.summary      = "AdMob + mediation + Firebase + UI helpers for iOS apps."

  spec.description  = <<-DESC
AdmobUltils is a utility library that centralizes:
- Google Mobile Ads SDK + mediation adapters
- Firebase (Analytics, Remote Config, Crashlytics)
- Consent (GoogleUserMessagingPlatform)
- Facebook SDK
- Lottie animations for loading
- SwiftUI shimmer helpers
- Custom ad views + layouts + resources
  DESC

  spec.homepage     = "https://github.com/TienNguyen267/AdmobUltils"
  spec.license      = { :type => "MIT" }
  spec.author       = { "VietTienNguyen" => "viettiennguyen2607@gmail.com" }

  spec.ios.deployment_target = "13.0"
  spec.swift_version         = "5.0"

  spec.source = {
    :git => "https://github.com/TienNguyen267/AdmobUltils.git",
    :tag => spec.version.to_s
  }

  # --- Swift code ---
  spec.source_files  = "Sources/AdmobUltils/**/*.{swift}"

  # --- Resources (XIB + images + lottie json) ---
  spec.resource_bundles = {
    "AdmobUltilsResources" => [
      "Resources/LayoutAds/*.xib",
      "Resources/Assets.xcassets",
      "Resources/Animations/*.json"
    ]
  }

  # --- Dependencies ---

  # SolarEngine + mediation
  spec.dependency "SolarEngineSDKiOSInter", "~> 1.3.1.0"
  spec.dependency "GoogleMobileAdsMediationFacebook"
  spec.dependency "GoogleMobileAdsMediationMintegral"
  spec.dependency "GoogleMobileAdsMediationIronSource"
  spec.dependency "GoogleMobileAdsMediationAppLovin"
  spec.dependency "GoogleMobileAdsMediationPangle"
  spec.dependency "GoogleMobileAdsMediationVungle"
  spec.dependency "GoogleMobileAdsMediationUnity"

  # Google Mobile Ads SDK
  spec.dependency "Google-Mobile-Ads-SDK"

  # Consent SDK
  spec.dependency "GoogleUserMessagingPlatform"

  # Firebase
  spec.dependency "FirebaseCore"
  spec.dependency "FirebaseAnalytics"
  spec.dependency "FirebaseRemoteConfig"
  spec.dependency "FirebaseCrashlytics"

  # Facebook SDK
  spec.dependency "FBSDKCoreKit"
  # spec.dependency "FBSDKLoginKit"
  # spec.dependency "FBSDKShareKit"

  # Lottie
  spec.dependency "lottie-ios"

  # SwiftUI Shimmer (nếu pod này đã publish trên trunk)
  spec.dependency "SwiftUI-Shimmer"

  # ⚠️ modular_headers: vẫn phải cấu hình ở Podfile của app
  #   pod 'GoogleUtilities', :modular_headers => true
  #   pod 'GoogleDataTransport', :modular_headers => true
  #   pod 'nanopb', :modular_headers => true
  #   pod 'FirebaseABTesting', :modular_headers => true

end

