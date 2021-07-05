import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/child_region.dart';
import 'package:vet_app/design/styles/styles.dart';

class EventNote extends StatelessWidget {
  final Color color;
  final String title;
  final String time;
  final String description;
  final String members;

  const EventNote({
    Key? key,
    required this.color,
    required this.title,
    required this.time,
    required this.description,
    required this.members,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: context.width > 900 ? 40 : 15,
        right: context.width > 900 ? 20 : 10,
        top: 5,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
      child: ChildRegion(
        margin: const EdgeInsets.only(left: 10),
        padding: const EdgeInsets.only(
          left: 20,
          right: 5,
          top: 10,
          bottom: 10,
        ),
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                time,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colorMain,
                ),
              ),
              Text(members),
              const SizedBox(height: 5),
              Text(description),
            ],
          ),
        ),
      ),
    );
  }
}
