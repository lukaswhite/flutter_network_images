import 'package:flutter/material.dart';
import 'package:flutter_network_images/fancy_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class App extends StatefulWidget {
  
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  Future<void> clearCache() async {
    await DefaultCacheManager().emptyCache();    
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
          child: FancyImage(
            url: 'https://raw.githubusercontent.com/lukaswhite/flutter_network_images/main/docs/neom-e75CfMG0Sgo-unsplash.jpg',             
            aspectRatio: 1.5, 
            blurhash: 'LoH2QH%1IAi__4s9i^j[O[Rjs.js'
          ),
        ),
        ElevatedButton(onPressed: () async {
          await clearCache();
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cache cleared')));
        }, child: const Text('Clear cache')),
        /**
        Padding(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
          child: FancyImage(
            url: 'https://idushfihdfuhsd898dh9fhsdihds.com/9dsf8d9h8hf9d8sd.jpg', 
            aspectRatio: 1.5, 
            blurhash: 'LoH2QH%1IAi__4s9i^j[O[Rjs.js'
          ),
        ),
        */
      ],),
    );    
  }
}