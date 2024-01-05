import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:snokie_shoe/utils/color_constants.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final double? radius;
  final double? errorIconSize;
  final IconData? errorIcon;
  final bool? isCircle;
  final Widget? errorWidget;
  final BoxFit? boxFit;

  const CustomNetworkImage(
      {Key? key,
        this.imageUrl,
        this.height,
        this.width,
        this.radius,
        this.isCircle,
        this.errorIconSize,
        this.errorIcon,
        this.boxFit, this.errorWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl?.trim()??"https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358_960_720.jpg", //"https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358_960_720.jpg",
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        padding: const EdgeInsets.all(2),
        height: height,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(radius ?? 0),
          //   color: Colors.red,
          //  shape: isCircle ?? false ? BoxShape.circle : BoxShape.rectangle,
          //  border: Border.all(color:Theme.of(context).colorScheme.secondary),
          image: DecorationImage(
              image: imageProvider, fit: boxFit ?? BoxFit.contain),
        ),
      ),
      placeholder: (context, url) => const Center(child: CircularProgressIndicator(color: primaryColor,)),
      errorWidget: (context, url, error) => Center(
        child: errorWidget??const Center(child:Icon(Icons.error)),
      ),
    );
  }
}