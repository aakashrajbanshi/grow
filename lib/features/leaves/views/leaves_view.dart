import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        title: Text(AppLocalizations.of(context)!.leaves),
      ),
      body: Column(
        children: [
          Container(
            height: 65,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                SizedBox(width: 5),
                Expanded(
                    child: TextFormField(
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      hintText: "Search",
                      labelText: "Type Here",
                      filled: true,
                      fillColor: Colors.grey
                      // border: OutlineInputBorder()
                      ),
                )),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: CachedNetworkImage(
              imageUrl:
                  "https://hatrabbits.com/wp-content/uploads/2017/01/random.jpg",
              // height: 120,
              // width: 120,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, progress) =>
                  const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.blue,
              )),
          const Expanded(
            flex: 1,
            child: Text(
              "Hello",
            ),
          )
        ],
      ),
    );
  }
}
