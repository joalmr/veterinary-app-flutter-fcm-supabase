import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/resources/utils/datetimeFormat.dart';
import 'package:vet_app/src/stats/domain/statsController.dart';

class FeedbackView extends StatelessWidget {
  const FeedbackView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<StatsController>(
      builder: (_) {
        return _.cargaComments.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : _.statComments.length == 0
                ? Center(
                    child: Text('No posee feedback de usuarios'),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10, top: 5),
                          child: Text('${formatDate(_.initialIn!)} a ${formatDate(_.initialOut!)}'),
                        ),
                        for (var comment in _.statComments) 
                          Card(
                            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Center(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5.0),
                                        child: Image(
                                          height: 52.0,
                                          width: 52.0,
                                          fit: BoxFit.cover,
                                          image: CachedNetworkImageProvider(
                                              comment.petPicture!),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          formatDateTime(comment.date!),
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        Text(
                                          comment.comment!,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.star_rounded),
                                        Text(
                                          comment.stars.toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                      ],
                    ),
                  );
      },
    );
  }
}
