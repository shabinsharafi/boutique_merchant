import 'package:flutter/material.dart';
import 'package:boutique_merchant/widgets/shimmerWarp.dart';

class NetworkImageShimmer extends StatelessWidget {
  double? width;
  double? height;
  double radius;
  var url;
  BoxFit fit;

  NetworkImageShimmer(this.url,
      {this.height, this.width, this.radius = 10, this.fit = BoxFit.none});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        width: width,
        height: height,
        child: Image.network(
          "$url",
          fit: fit,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: width,
              height: height,
              color: Colors.white38,
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: 0.34,
                  child: Image.asset(
                    "assets/images/app_icon/app-icon-foreground.png",
                    color: Colors.white30,
                  ),
                ),
              ),
            );
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return ShimmerWrap(
                child: Container(
              width: width,
              height: height,
              color: Colors.white54,
            ));
          },
        ),
      ),
    );
  }
}
