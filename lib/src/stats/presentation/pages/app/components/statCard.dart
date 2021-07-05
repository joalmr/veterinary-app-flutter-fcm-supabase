import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final String value;

  const StatCard({
    Key? key,
    required this.color,
    required this.icon,
    required this.text,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 2.5),
      width: context.width,
      // height: 80,
      child: Card(
        margin: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 5.0),
              Container(
                height: 52.0,
                width: 52.0,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        icon,
                        size: 28,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 7.5),
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  const SizedBox(width: 2.5),
                  Text(
                    value,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 32.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
