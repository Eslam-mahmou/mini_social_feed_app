import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mini_social_feed/core/service/ad_service.dart';
import 'package:mini_social_feed/core/common/responsive_height_width.dart';
import 'package:mini_social_feed/core/utils/app_colors.dart';


class CustomNativeAdWidget extends StatefulWidget {
  const CustomNativeAdWidget({super.key});

  @override
  State<CustomNativeAdWidget> createState() => _CustomNativeAdWidgetState();
}

class _CustomNativeAdWidgetState extends State<CustomNativeAdWidget> {
  NativeAd? _nativeAd;
  bool _isAdLoaded = false;
  final AdService _adService = AdService();

  @override
  void initState() {
    super.initState();
    _loadNativeAd();
  }

  void _loadNativeAd() {
    _nativeAd = _adService.createNativeAd();
    _nativeAd
        ?.load()
        .then((_) {
          if (mounted) {
            setState(() {
              _isAdLoaded = true;
            });
          }
        })
        .catchError((error) => debugPrint('Error loading native ad: $error'));
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isAdLoaded || _nativeAd == null) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16.widthResponsive,
        vertical: 8.heightResponsive,
      ),
      decoration: BoxDecoration(
        color: AppColors.grayColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grayColor, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          height: 100.heightResponsive,
          child: Container(
            padding: EdgeInsets.all(12.widthResponsive),
            child: Row(
              children: [
                Container(
                  width: 60.widthResponsive,
                  height: 60.heightResponsive,
                  decoration: BoxDecoration(
                    color: AppColors.grayColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.ad_units,
                    color:AppColors.grayColor,
                    size: 30,
                  ),
                ),
                SizedBox(width: 12.widthResponsive),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sponsored',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.grayColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4.heightResponsive),
                      Text(
                        'Discover amazing content',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.grayColor,
                        ),
                      ),
                      SizedBox(height: 2.heightResponsive),
                      Text(
                        'Tap to learn more',
                        style: TextStyle(fontSize: 12, color: AppColors.grayColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
