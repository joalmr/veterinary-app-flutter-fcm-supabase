import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/subheader.dart';
import 'package:vet_app/src/stats/domain/stats_controller.dart';

class FeedbackContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<StatsController>(
      builder: (_) {
        return Container(
          color: const Color(0xffF7F7FF),
          child: _.cargaComments.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30.0),
                    subHeader(title: 'Comentarios'),
                    const SizedBox(height: 10.0),
                    Expanded(
                      child: _.statComments.isEmpty
                          ? const Center(
                              child: Text('No tiene comentarios de usuarios'),
                            )
                          : ListView.builder(
                              itemCount: _.statComments.length,
                              itemBuilder: (BuildContext context, int index) {
                                final comment = _.statComments[index];
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 7.5, horizontal: 20),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 38.0,
                                        width: 38.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: Center(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            child: Image(
                                              fit: BoxFit.cover,
                                              image: CachedNetworkImageProvider(
                                                  comment.petPicture!),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              comment.date!.toIso8601String(),
                                              style:
                                                  const TextStyle(fontSize: 8),
                                            ),
                                            Text(
                                              comment.comment!,
                                              maxLines: 3,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      SizedBox(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.star_rounded),
                                            Text(
                                              comment.stars.toString(),
                                              style: const TextStyle(
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
