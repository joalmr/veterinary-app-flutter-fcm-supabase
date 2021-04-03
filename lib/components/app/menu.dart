import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/recursos/data/menuData.dart';
import 'package:vet_app/recursos/images/images.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
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
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                          leading: Icon(e['icon']),
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
                leading: Icon(Icons.settings),
                title: Text('Configuración'),
                onTap: () => Get.toNamed('/config'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
