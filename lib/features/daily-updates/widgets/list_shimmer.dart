import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListShimmer extends StatefulWidget {
  const ListShimmer({Key? key}) : super(key: key);

  @override
  State<ListShimmer> createState() => _ListShimmerState();
}

class _ListShimmerState extends State<ListShimmer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return SizedBox(
            height: 100,
            width: double.infinity,
            child: Shimmer.fromColors(
              child: ListTile(
                title: SizedBox(
                  height: 50,
                  width: size.width * 0.6,
                  child: Card(),
                ),
                subtitle: SizedBox(
                  height: 35,
                  width: size.width * 0.4,
                  child: Card(),
                ),
              ),
              baseColor: Colors.grey.withOpacity(0.1),
              highlightColor: Colors.white,
            ));
      },
    );
  }
}
