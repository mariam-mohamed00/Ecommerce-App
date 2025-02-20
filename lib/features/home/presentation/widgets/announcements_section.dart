import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AnnouncementsSection extends StatelessWidget {
  AnnouncementsSection({super.key, required this.images});
  List<String> images = [];
  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
        initialPage: 0,
        indicatorColor: Colors.transparent,
        indicatorBackgroundColor: Colors.transparent,
        indicatorBottomPadding: 20.h,
        autoPlayInterval: 3000,
        isLoop: true,
        children: images
            .map((url) => Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  url,
                  fit: BoxFit.fill,
                  width: 398.w,
                  height: 200.h,
                )))
            .toList());
  }
}
