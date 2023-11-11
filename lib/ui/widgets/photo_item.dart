import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:session2/data/models/mars_photo.dart';
import 'package:session2/data/repo/repo.dart';

class PhotoItem extends StatelessWidget {
  const PhotoItem({super.key, required this.latestPhoto});
final MarsPhoto latestPhoto ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 8),
      child: Stack (
        children: [
CachedNetworkImage(imageUrl:latestPhoto.imgSrc ),
          ListTile(
            title: Text("${latestPhoto!.earthDate}" , style:const  TextStyle(color: Colors.lightBlue),),
           subtitle : Text("${latestPhoto!.camera.fullName}" ,style: const TextStyle(color: Colors.lightBlue)),
          )
        ],
      ),
    );
  }
}
