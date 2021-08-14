import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/userClients/domain/user_clients_controller.dart';

class UserClientsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<ClientsController>(
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetPlatform.isWeb
                ? Container(
                    margin: EdgeInsets.only(
                      left: 30.0,
                      top: 25.0,
                      bottom: 10.0,
                    ),
                    child: Text(
                      'Clientes',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  )
                : SizedBox(height: 0),
            Expanded(
              child: _.myClients.isEmpty
                  ? Center(child: Text('No tiene petlovers'))
                  : ListView.builder(
                      itemCount: _.myClients.length,
                      itemBuilder: (BuildContext context, int index) {
                        final cliente = _.myClients[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: colorMain.withOpacity(0.6),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                          ),
                          title: Text('${cliente.name} ${cliente.lastname}'),
                          onTap: () {
                            _.goToUser(cliente.id!);
                          },
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }
}
