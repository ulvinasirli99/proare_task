import 'package:flutter/material.dart';

class CatImageComponent extends StatelessWidget {
  final String imgUrl;

  const CatImageComponent({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size appSize = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        imgUrl,
        height: appSize.height / 3,
        width: appSize.width / 1.5,
        fit: BoxFit.fill,
        frameBuilder: (context, child, frame, _) {
          if (frame == null) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: CircularProgressIndicator(),
              ),
            );
          }
          return child;
        },
      ),
    );
  }
}
