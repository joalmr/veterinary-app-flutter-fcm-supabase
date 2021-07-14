import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/app/menu.dart';
import 'package:vet_app/components/web/navigation_bar.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final bool drawerActive;
  final String? title;
  MainLayout({
    Key? key,
    required this.child,
    this.drawerActive = false,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (context.width < 900 && title != null)
          ? AppBar(title: Text(title!))
          : null,
      drawer: (context.width < 900 && drawerActive) ? MenuDrawer() : null,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          context.width < 900 ? SizedBox(height: 0) : NavigationBar(),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
