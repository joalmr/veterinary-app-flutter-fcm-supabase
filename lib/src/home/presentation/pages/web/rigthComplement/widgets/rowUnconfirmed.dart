import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/childRegion.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/bookings/presentation/pages/web/reprogramar/contentReprograma.dart';
import 'package:vet_app/src/home/domain/homeController.dart';

class RowUnconfirmed extends StatefulWidget {
  final String bookingId;
  final String petImg;
  final String petName;
  final String petBreed;
  final String status;
  final String date;
  final String time;
  final String userName;
  final String userPhone;
  final Color color;
  final List<String> bookingServices;
  final String observation;
  final String address;
  final String delivery;

  RowUnconfirmed({
    @required this.bookingId,
    @required this.petImg,
    @required this.petName,
    @required this.petBreed,
    @required this.status,
    @required this.date,
    @required this.time,
    @required this.userName,
    @required this.userPhone,
    @required this.color,
    @required this.bookingServices,
    @required this.observation,
    @required this.address,
    @required this.delivery,
  });

  @override
  _RowUnconfirmedState createState() => _RowUnconfirmedState();
}

class _RowUnconfirmedState extends State<RowUnconfirmed> {
  bool hovered = false;
  bool hovConfirma = false;
  bool hovReprograma = false;
  bool activeReprogramar = false;

  @override
  Widget build(BuildContext context) {
    String stringTypes = "";
    for (var i = 0; i < widget.bookingServices.length; i++) {
      final element = widget.bookingServices[i];
      if (widget.bookingServices.length == 1) {
        stringTypes = element;
      } else {
        if (i < widget.bookingServices.length - 1)
          stringTypes += element + ", ";
        else
          stringTypes += element;
      }
    }
    return GetBuilder<HomeController>(
      builder: (_) {
        return ChildRegion(
          margin: EdgeInsets.only(bottom: 15.0, left: 5, right: 5),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 5.0),
                    Container(
                      height: 38.0,
                      width: 38.0,
                      decoration: BoxDecoration(
                        // color: Colors.deepPurple[200],
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: CachedNetworkImage(
                            imageUrl: widget.petImg,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              color: Colors.grey.shade200,
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          // Image.network(widget.petImg)
                        ),
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.petName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                          Text(
                            widget.petBreed,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 10.0,
                            ),
                          ),
                          Text(
                            widget.date,
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.time,
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            stringTypes,
                            maxLines: 7,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: colorMain,
                              fontSize: 10.0,
                            ),
                          ),
                          Text(
                            "Observaciones: ${widget.observation}",
                            maxLines: 7,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 10.0),
                          ),
                          widget.delivery != "" && widget.address != ""
                        ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.delivery,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.0,
                              ),
                            ),
                            Text(widget.address,
                              style: TextStyle(fontSize: 10.0),
                            ),
                          ],
                        )
                        : SizedBox(height: 0)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: MouseRegion(
                      onEnter: (value) {
                        setState(() {
                          hovConfirma = true;
                        });
                      },
                      onExit: (value) {
                        setState(() {
                          hovConfirma = false;
                        });
                      },
                      child: InkWell(
                        onTap: () => _.confirm(widget.bookingId),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: hovConfirma ? colorMain : colorMain[400],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Confirmar',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: MouseRegion(
                      onEnter: (value) {
                        setState(() {
                          hovReprograma = true;
                        });
                      },
                      onExit: (value) {
                        setState(() {
                          hovReprograma = false;
                        });
                      },
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            useSafeArea: true,
                            builder: (context) => AlertDialog(
                              scrollable: true,
                              content: ContentReprograma(
                                bookingId: widget.bookingId,
                                petImg: widget.petImg,
                                petName: widget.petName,
                                petBreed: widget.petBreed,
                                date: widget.date,
                                time: widget.time,
                                userName: widget.userName,
                                userPhone: widget.userPhone,
                                color: widget.color,
                                status: widget.status,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color:
                                hovReprograma ? Colors.grey : Colors.grey[400],
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(5),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Reprogramar',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
