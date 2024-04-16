import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app/presentation/widget/shimmer_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class MyNetworkImage extends StatelessWidget {
  const MyNetworkImage({
    super.key, required this.imageUrl,
  });
final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      height: 80.h,
      child: CachedNetworkImage(
              imageUrl: imageUrl
              
              ,fit: BoxFit.cover,
              placeholder: (context, url) => Shimmer.fromColors(
      
                 baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  child: const ShimmerBodyForImageMenu(),
              ),
              errorWidget: (context, url, error) => FlutterLogo(),
           )
    );
  }
}