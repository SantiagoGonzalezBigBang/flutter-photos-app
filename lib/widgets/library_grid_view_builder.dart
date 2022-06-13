import 'package:flutter/material.dart';

import 'package:photo_gallery/photo_gallery.dart';
import 'package:photos_app/helpers/duration_formater.dart';
import 'package:transparent_image/transparent_image.dart';

class CustomGridViewBuilder extends StatelessWidget {
  const CustomGridViewBuilder({
    Key? key, 
    this.allMedia = const [], 
    required this.scrollController,
  }) : super(key: key);

  final List<Medium> allMedia;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {

    return Scrollbar(
      controller: scrollController,
      child: GridView.builder(
        controller: scrollController,
        itemCount: allMedia.length,
        cacheExtent: 100.0,      
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 1.6,
          mainAxisSpacing: 1.6
        ),
        itemBuilder: (context, index) {
          Medium medium = allMedia[index];        
    
          return Stack(
            fit: StackFit.expand,
            children: [
              Container(
                color: Colors.grey[300],
                child: FadeInImage(
                  fit: BoxFit.cover,                
                  placeholder: MemoryImage(kTransparentImage),
                  image: ThumbnailProvider(
                    mediumId: medium.id,
                    mediumType: medium.mediumType,
                    highQuality: true,              
                  ),
                ),
              ),
              if (medium.mediumType == MediumType.video) _VideoDurationText(
                duration: medium.duration
              )
            ],
          );
        }
      ),
    );
  }
}

class _VideoDurationText extends StatelessWidget {
  const _VideoDurationText({
    Key? key, 
    required this.duration,
  }) : super(key: key);

  final int duration; 

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 5.0,
      right: 5.0,
      child: Text(
        DurationFormater.getVideoDurationFromMilisecond(duration),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
          shadows: [
            Shadow(
              color: Colors.black45,
              blurRadius: 2.0
            )
          ]
        ),
      )
    );
  }
}