import 'package:flutter/material.dart';
import 'package:session2/data/models/mars_photo.dart';
import 'package:session2/ui/widgets/photo_item.dart';

import '../../data/repo/repo.dart';

class LatestPhotoPage extends StatefulWidget {
  const  LatestPhotoPage({super.key});

  @override
  State<LatestPhotoPage> createState() => _LatestPhotoPageState();
}

class _LatestPhotoPageState extends State<LatestPhotoPage> {
  var future;
  @override
  void initState() {
    super.initState();
    future = Repo().fechLastPhotos();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Latest Photo"),
      ),
      body: FutureBuilder<List<MarsPhoto>>(future: future!,
      builder: (BuildContext context, snapshot){
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) =>
                PhotoItem(latestPhoto: snapshot.data![index]),);
        }
        else
          {
            return const Center(child:CircularProgressIndicator());
          }
      },
      ),
    );
  }
}
