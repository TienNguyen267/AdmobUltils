//
//  BannerAdView.swift
//  ReverseAudioIOS
//
//  Created by Tien Nguyen on 11/10/25.
//

import SwiftUI
import GoogleMobileAds

struct BannerAdView: UIViewRepresentable {
    typealias UIViewType = BannerView
    var adUnitID: String
    var adSize: AdSize
    var onAdLoaded: (() -> Void)?
    var onAdFailedToLoad: ((Error) -> Void)?
    
    init(adUnitID: String, 
         adSize: AdSize = AdSizeBanner,
         onAdLoaded: (() -> Void)? = nil,
         onAdFailedToLoad: ((Error) -> Void)? = nil) {
        self.adUnitID = adUnitID
        self.adSize = adSize
        self.onAdLoaded = onAdLoaded
        self.onAdFailedToLoad = onAdFailedToLoad
    }
    
    func makeUIView(context: Context) -> BannerView {
        let banner = BannerView(adSize: adSize)
        banner.adUnitID = Common.isDebug
            ? "ca-app-pub-3940256099942544/2435281174"
            : adUnitID
        banner.rootViewController = getRootViewController()
        banner.delegate = context.coordinator
        
        // Chỉ load banner khi không phải test device
        if !Common.isTestDevice {
            banner.load(Request())
        }
        return banner
    }
    
    func updateUIView(_ uiView: BannerView, context: Context) {
        // No update needed
    }
    
    func makeCoordinator() -> BannerCoordinator {
        return BannerCoordinator(self)
    }
    
    private func getRootViewController() -> UIViewController? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = windowScene.windows.first?.rootViewController else {
            return nil
        }
        return rootViewController
    }
    
    class BannerCoordinator: NSObject, BannerViewDelegate {
        let parent: BannerAdView
        
        init(_ parent: BannerAdView) {
            self.parent = parent
        }
        
        func bannerViewDidReceiveAd(_ bannerView: BannerView) {
            print("Banner ad received successfully")
            DispatchQueue.main.async {
                self.parent.onAdLoaded?()
            }
        }
        
        func bannerView(_ bannerView: BannerView, didFailToReceiveAdWithError error: Error) {
            print("Failed to receive banner ad: \(error.localizedDescription)")
            DispatchQueue.main.async {
                self.parent.onAdFailedToLoad?(error)
            }
        }
        func bannerViewDidRecordImpression(_ bannerView: BannerView) {
            bannerView.paidEventHandler = { adValue in
                PaidEventHandlerManager.shared.getPaidEventHandler(dataPaidEvent: adValue, typeAds: .bannerAds, adUnit: bannerView.adUnitID ?? "banner_default")
            }
        }
    }
}

// Simple Loading View
struct ShimmerView: View {
    var body: some View {
        HStack {
            Spacer()
            Text("loading ads...")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            Spacer()
        }
        .frame(height: 50)
        .background(Color.gray.opacity(0.1))
    }
}

// Banner Ad với Shimmer và Interstitial
struct BannerAdViewWithShimmer: View {
    var adUnitID: String
    var adSize: AdSize
    var onAdLoaded: (() -> Void)?
    var onAdFailedToLoad: ((Error) -> Void)?
    
    @State private var isLoading = true
    @State private var shouldShowAd = true
    private var interstitialManager = InterstitialAdManager()
    
    init(adUnitID: String, adSize: AdSize = AdSizeBanner,  onAdLoaded: (() -> Void)? = nil,
         onAdFailedToLoad: ((Error) -> Void)? = nil) {
        self.adUnitID = adUnitID
        self.adSize = adSize
        self.onAdLoaded = onAdLoaded
        self.onAdFailedToLoad = onAdFailedToLoad
    }
    
    var body: some View {
        // Chỉ hiển thị banner khi không phải test device và shouldShowAd = true
        if !Common.isTestDevice && shouldShowAd {
            ZStack {
                // Shimmer loading
                if isLoading {
                    ShimmerView()
                        .frame(height: 50)
                }
                
                // Banner Ad
                BannerAdView(
                    adUnitID: adUnitID,
                    adSize: adSize,
                    onAdLoaded: {
                        // Banner load thành công
                        isLoading = false
                        
                        // Load interstitial ad
                        DispatchQueue.main.async {
                            onAdLoaded?()
                        }
                    },
                    onAdFailedToLoad: { error in
                        // Banner load thất bại - ẩn toàn bộ view
                        print("Banner failed to load: \(error.localizedDescription)")
                        isLoading = false
                        shouldShowAd = false
                        DispatchQueue.main.async {
                            onAdFailedToLoad?(error)
                        }
                    }
                )
                .frame(height: 50)
                .opacity(isLoading ? 0 : 1)
            }
            .frame(height: 50)
        }
    }
}

// Helper to get banner height
struct BannerAdViewHeightModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 50) // Standard banner height
    }
}

extension View {
    func bannerAdHeight() -> some View {
        modifier(BannerAdViewHeightModifier())
    }
}

