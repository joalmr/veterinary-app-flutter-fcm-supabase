import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/chat/domain/chatController.dart';

class MessagesView extends StatelessWidget {

  final mensaje = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return GetX<ChatController>(
      builder: (_){
        return Scaffold(
          appBar: AppBar(title: Text('hola'),),
          body: Column(
            children: [
              Expanded(
                child: 
                _.mensajes.length == 0 
                ?
                Icon(Icons.chat_bubble_outline_rounded)
                :
                ScrollablePositionedList.builder(
                  itemCount: _.mensajes.length,
                  initialScrollIndex: _.scrollInit,
                  itemScrollController: _.itemScrollController,
                  itemPositionsListener: _.itemPositionsListener,
                  itemBuilder: (BuildContext context, int index) {
                    final message = _.mensajes[index];
                    return Container(
                      margin: message.type 
                        ? EdgeInsets.only(left: 15,top: 5, bottom: 5, right: 5)
                        : EdgeInsets.only(right: 15,top: 5, bottom: 5, left: 5),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: !message.type 
                          ? BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25), bottomLeft: Radius.circular(25))
                          : BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25), bottomRight: Radius.circular(25)),
                        color: !message.type ? colorMain.withOpacity(0.5) : colorBlue.withOpacity(0.5)
                      ),
                      child: Text(message.message),
                    );
                  },
                ),
              ),
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: mensaje,
                  decoration: InputDecoration(
                    suffix: TextButton(
                      onPressed: (){
                        if(mensaje.text.trim()!=''){
                          _.addMessage(mensaje.text);
                          mensaje.text = '';
                        }
                      }, 
                      child: Text('Enviar'),
                    )
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}