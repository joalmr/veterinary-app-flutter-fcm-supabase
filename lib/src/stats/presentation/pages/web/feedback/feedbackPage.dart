import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/subheader.dart';
import 'package:vet_app/src/stats/domain/statsController.dart';

class FeedbackContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<StatsController>(
      builder: (_) {
        return Container(
          color: Color(0xffF7F7FF),
          child: 
          _.cargaComments.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            :
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.0),
              subHeader(title: 'Comentarios'),
              SizedBox(height: 10.0),
              Expanded(
                child: 
                _.statComments.length == 0
                ? Center(
                    child: Text('No tiene comentarios de usuarios'),
                  )
                : 
                ListView.builder(
                  itemCount: _.statComments.length,
                  itemBuilder: (BuildContext context, int index) {
                    final comment = _.statComments[index];
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 7.5, horizontal: 20),
                      child: Row(
                        children: [
                          Container(
                            height: 38.0,
                            width: 38.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(comment.petPicture!),
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
                                  comment.date!.toIso8601String(),
                                  style: TextStyle(fontSize: 8),
                                ),
                                Text(
                                  comment.comment!,
                                  maxLines: 3,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
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
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
    
  }
}
