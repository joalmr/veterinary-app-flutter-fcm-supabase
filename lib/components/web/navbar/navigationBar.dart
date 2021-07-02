import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/resources/data/menuData.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/routes/routes.dart';

import 'navbarItem.dart';

class NavigationBar extends StatefulWidget {
  NavigationBar({Key? key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

// int selected = 0;

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    String? pageSelected = ModalRoute.of(context)!.settings.name;

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: 100.0,
        color: Color(0xff333951),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.3),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedNetworkImage(
                    imageUrl: prefUser.vetLogo!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.grey.shade200,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
                radius: 25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                prefUser.vetName!,
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.white54,
                ),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(bottom: 20),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         'Ingresos',
            //         style: TextStyle(
            //           fontSize: 10,
            //           color: Colors.white54,
            //         ),
            //       ),
            //       Text(
            //         'S/ 5000',
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           color: Colors.white54,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: dataMenu
                      .map(
                        (e) => navbarItem(
                          active: e['page'] == pageSelected,
                          icon: e['icon'],
                          onTap: () => Get.toNamed(e['page']),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            navbarItem(
              active: '/config' == pageSelected,
              onTap: () => Get.toNamed(NameRoutes.config),
              icon: Icons.settings,
            ),
          ],
        ),
      ),
    );
  }
}
