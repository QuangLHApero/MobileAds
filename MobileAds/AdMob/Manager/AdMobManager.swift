//
//  AdMobManager.swift
//  MobileAds
//
//  Created by macbook on 28/08/2021.
//

import Foundation
import UIKit
import GoogleMobileAds
import SkeletonView
import Adjust

//    MARK: - Google-provided demo ad units
public struct SampleAdUnitID {
    public static let adFormatAppOpen              = "ca-app-pub-3940256099942544/3419835294"
    public static let adFormatBanner               = "ca-app-pub-3940256099942544/6300978111"
    public static let adFormatInterstitial         = "ca-app-pub-3940256099942544/1033173712"
    public static let adFormatInterstitialVideo    = "ca-app-pub-3940256099942544/8691691433"
    public static let adFormatRewarded             = "ca-app-pub-3940256099942544/5224354917"
    public static let adFormatRewardedInterstitial = "ca-app-pub-3940256099942544/5354046379"
    public static let adFormatNativeAdvanced       = "ca-app-pub-3940256099942544/2247696110"
    public static let adFormatNativeAdvancedVideo  = "ca-app-pub-3940256099942544/1044960115"
}

 open class AdMobManager: NSObject {
    
    //    MARK: - Property
    public static let shared = AdMobManager()
    public var timeOut: Int = 30
    public var didEarnReward = false
    public var showAdRewardCount = 0
    public var listAd: NSMutableDictionary = NSMutableDictionary()
    public var listLoader: NSMutableDictionary = NSMutableDictionary()
    
    //    MARK: - UI NAtive
    public var backgroundButtonAdsNative: UIColor = UIColor(hex: 0x007AFF)
    public var nativeButtonCornerRadius: CGFloat = 8
    
    //    MARK: - Block Ads
    public var blockLoadFullScreenAdSuccess: StringBlockAds?
    public var blockFullScreenAdWillDismiss: VoidBlockAds?
    public var blockFullScreenAdDidDismiss : VoidBlockAds?
    public var blockFullScreenAdWillPresent: StringBlockAds?
    public var blockFullScreenAdDidPresent : StringBlockAds?
    public var blockFullScreenAdFaild      : StringBlockAds?
    public var blockCompletionHandeler     : BoolBlockAds?
    public var blockNativeFaild            : StringBlockAds?
    public var blockLoadNativeSuccess      : BoolBlockAds?
    public var blockBannerFaild      : ((String) -> Void)?
    public var blockLoadBannerSuccess: ((Bool) -> Void)?
    
    func removeAd(unitId: String) {
        listAd.removeObject(forKey: unitId)
    }
    
    //    MARK: - Track Ad Revenue
    func trackAdRevenue(value: GADAdValue) {
        if let adRevenue = ADJAdRevenue(source: ADJAdRevenueSourceAdMob) {
            adRevenue.setRevenue(value.value.doubleValue, currency: value.currencyCode)
            Adjust.trackAdRevenue(adRevenue)
        }
    }
    
}
