import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vet_app/design/styles/styles.dart';

class SlideItem extends StatelessWidget {
  final String img;
  final Function onPressedDelete;

  const SlideItem({@required this.img, @required this.onPressedDelete});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(img),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: colorRed,
              ),
              child: IconButton(
                icon: Icon(Icons.delete_rounded),
                onPressed: onPressedDelete,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
