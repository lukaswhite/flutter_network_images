import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class FancyImage extends StatefulWidget {
  
  const FancyImage({super.key, required this.url, required this.aspectRatio, required this.blurhash});

  final String url;
  final double aspectRatio;
  final String blurhash;

  @override
  State<FancyImage> createState() => _FancyImageState();
}

class _FancyImageState extends State<FancyImage> {

  @override
  Widget build(BuildContext context) {

    return AspectRatio(
      aspectRatio: widget.aspectRatio, 
      child: CachedNetworkImage(
        imageUrl: widget.url,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) => 
          AspectRatio(
            aspectRatio: 2,
            child: LayoutBuilder(
              builder: (context, constraints){
                debugPrint(constraints.toString());
                return Stack(
                  children: [
                    BlurHash(hash: widget.blurhash),                    
                    const Center(
                      child: CircularProgressIndicator(color: Colors.white,),
                    )
                  ],
                );
              }
            ),
          ),
          errorWidget: (context, url, error) => _LoadError(),
      )
    );

  }
}

class _LoadError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('assets/images/no_image.png'),
          const SizedBox(height: 10,),
          const Text('The image failed to load'),
        ]),
    );
  }
}

class _OfflineMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('assets/images/no_network.png'),
          const Text('You are offline'),
        ]),
    );
  }
}