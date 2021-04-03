import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/src/offers/domain/create/createOfferController.dart';

class CreaPromocionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<CreateOfferController>(
      init: CreateOfferController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Crea promoción'),
            centerTitle: false,
          ),
          body: ListView(
            padding: EdgeInsets.only(left: 10, right: 10),
            children: [
              Text('Servicio'),
              Container(
                height: 40,
                width: double.maxFinite,
                color: Colors.pink,
                child: Text('seleccione servicio'),
              ),
              SizedBox(height: 10),
              Text('Descripción'),
              TextFormField(
                controller: _.description,
                textCapitalization: TextCapitalization.sentences,
                maxLength: 150,
                maxLines: 5,
              ),
              SizedBox(height: 10),
              Text('Tipo'),
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                value: 0,
                groupValue: _.selectValue,
                onChanged: (val) => _.selectValue = val,
                title: Text('Monto de descuento'),
              ),
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                value: 1,
                groupValue: _.selectValue,
                onChanged: (val) => _.selectValue = val,
                title: Text('Porcentaje de descuento'),
              ),
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                value: 2,
                groupValue: _.selectValue,
                onChanged: (val) => _.selectValue = val,
                title: Text('Precio promocional'),
              ),
              SizedBox(height: 10),
              Text('Monto'),
              TextFormField(
                controller: _.moneyController,
                keyboardType: TextInputType.number,
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: SizedBox(
                  width: double.infinity,
                  child: btnPrimary(
                    text: 'Crear',
                    onPressed: _.create,
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
