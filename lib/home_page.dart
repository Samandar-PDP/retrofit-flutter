import 'package:flutter/material.dart';
import 'package:retro_flutter/repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _repo = Repository(); /// 1

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Images")),
      body: FutureBuilder( /// 2
        future: _repo.getPhotos(),
        builder: (context, snapshot) {
          if(snapshot.data != null && snapshot.data?.isNotEmpty == true) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4
              ),
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Image.network(snapshot.data?[index].src?.medium ?? "",fit: BoxFit.cover);
              },
            );
          } else {
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}
