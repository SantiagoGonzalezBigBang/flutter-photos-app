import 'package:flutter/material.dart';

import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';

class CustomGridViewBuilder extends StatelessWidget {
  const CustomGridViewBuilder({
    Key? key, 
    this.allMedia = const [],
  }) : super(key: key);

  final List<Medium> allMedia;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // controller: ,
      itemCount: allMedia.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 1.6,
        mainAxisSpacing: 1.6
      ),
      itemBuilder: (context, index) {
        Medium medium = allMedia[index];

        return Container(
          color: Colors.grey[300],
          child: FadeInImage(
            fit: BoxFit.cover,
            placeholder: MemoryImage(kTransparentImage),
            image: ThumbnailProvider(
              mediumId: medium.id,
              mediumType: medium.mediumType,
              highQuality: true,
            ),
          )
        );
      }
    );
  }
}