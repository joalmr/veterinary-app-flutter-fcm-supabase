import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/resources/data/menu_data.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/routes/routes.dart';

import 'navbar_item.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

// int selected = 0;

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    final String pageSelected = ModalRoute.of(context)?.settings.name ?? '';

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: 100.0,
        color: const Color(0xff333951),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.3),
                radius: 25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedNetworkImage(
                    imageUrl: prefUser.vetLogo!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.grey.shade200,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                prefUser.vetName!,
                maxLines: 1,
                style: const TextStyle(
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
                  children: dataMenu
                      .map(
                        (e) => navbarItem(
                          active: e['page'] == pageSelected,
                          icon: e['icon'] as IconData,
                          onTap: () => Get.toNamed(e['page'] as String),
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
