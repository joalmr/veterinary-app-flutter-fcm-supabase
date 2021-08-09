import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/resources/data/menu_data.dart';
import 'package:vet_app/resources/images/images.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black45)],
          ),
          width: 300,
          child: Column(
            children: [
              SizedBox(
                height: 60,
                width: double.maxFinite,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  alignment: Alignment.centerLeft,
                  child: Image(
                    image: AssetImage(imgLogoProypet),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: dataMenu
                      .map(
                        (e) => ListTile(
                          leading: Icon(e['icon'] as IconData),
                          title: Text(e['name']),
                          onTap: () {
                            Get.offNamed(e['page']);
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Configuración'),
                onTap: () => Get.toNamed('/config'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//veterinaria@proypet.com
