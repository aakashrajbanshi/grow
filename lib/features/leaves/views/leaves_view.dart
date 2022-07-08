import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LeavesView extends StatefulWidget {
  const LeavesView({Key? key}) : super(key: key);

  @override
  State<LeavesView> createState() => _LeavesViewState();
}

class _LeavesViewState extends State<LeavesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Leaves"),
      ),
      body: Column(children: [
        Container(
          height: 50,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                  child: TextFormField(
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Type Here",
                    labelText: "Search",
                    filled: true,
                    fillColor: Colors.white),
              )),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              )
            ],
          ),
        ),
        Expanded(
          flex: 20,
          child: CachedNetworkImage(
            imageUrl:
                "https://hatrabbits.com/wp-content/uploads/2017/01/random.jpg",
            // height: 120,
            // width: 120,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, progress) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Expanded(
            flex: 2,
            child: Container(
              color: Colors.blueAccent,
            )),
        Expanded(
          flex: 2,
          child: Text(
            "hello",
          ),
        )
      ]),
    );
  }
}
