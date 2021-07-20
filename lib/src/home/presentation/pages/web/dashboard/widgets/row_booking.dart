import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/icons/proypet_icons.dart';
import 'package:vet_app/routes/routes.dart';
import 'package:vet_app/src/bookings/domain/booking_controller.dart';
import 'package:vet_app/src/bookings/presentation/pages/reprogramar/app/reprogramar.dart';

class RowBooking extends StatefulWidget {
  final String bookingId;
  final String petImg;
  final String petId;
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

  RowBooking({
    required this.bookingId,
    required this.petImg,
    required this.petId,
    required this.petName,
    required this.petBreed,
    required this.status,
    required this.date,
    required this.time,
    required this.userName,
    required this.userPhone,
    required this.color,
    required this.bookingServices,
    required this.observation,
    required this.address,
    required this.delivery,
  });

  @override
  _RowBookingState createState() => _RowBookingState();
}

class _RowBookingState extends State<RowBooking> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    // final HomeController _home = Get.find();
    String stringTypes = '';
    for (var i = 0; i < widget.bookingServices.length; i++) {
      final element = widget.bookingServices[i];
      if (widget.bookingServices.length == 1) {
        stringTypes = element;
      } else {
        if (i < widget.bookingServices.length - 1) {
          stringTypes += '$element, ';
        } else {
          stringTypes += element;
        }
      }
    }

    return MouseRegion(
      onEnter: (value) {
        setState(() {
          hovered = true;
        });
      },
      onExit: (value) {
        setState(() {
          hovered = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 275),
        margin: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 5.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: hovered
                ? [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 13.0,
                    ),
                  ]
                : []),
        child: SizedBox(
          child: ExpansionTile(
            title: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Container(
                        height: 38.0,
                        width: 38.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(widget.petImg),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Column(
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
                              fontSize: 12.0,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: widget.color,
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                height: 7.5,
                                width: 7.5,
                              ),
                              SizedBox(width: 5),
                              Text(
                                widget.status,
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.userName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                            color: Colors.black45,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.phone_android,
                              color: colorMain,
                              size: 10,
                            ),
                            Text(
                              widget.userPhone,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11.0,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      children: [
                        Text(
                          widget.date,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                            fontSize: 12.0,
                          ),
                        ),
                        Text(
                          widget.time,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black45,
                            fontSize: 12.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: PopupMenuButton<int>(
                    tooltip: 'Atender a ${widget.petName}',
                    onSelected: (value) async {
                      if (value == 1) {
                        final _book = Get.find<BookingController>();
                        _book.bookingId.value = widget.bookingId;
                        _book.petId.value = widget.petId;
                        await _book.initLoad();
                        Get.toNamed(NameRoutes.atenderBooking);
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return ReprogramarItem(
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
                            );
                          }),
                        );
                      }
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: Text('Atender ahora'),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text('Reprogramar'),
                      ),
                    ],
                    child: Container(
                      decoration: BoxDecoration(
                        color: colorMain,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 7.5,
                        horizontal: 10,
                      ),
                      child: Center(
                        child: Text(
                          'Atender',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            expandedAlignment: Alignment.centerLeft,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stringTypes,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      'Observación: ${widget.observation}',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                      ),
                    ),
                    SizedBox(height: 5),
                    if (widget.delivery != '' && widget.address != '')
                      Card(
                        color: Colors.grey[200],
                        child: Container(
                          padding: EdgeInsets.all(8),
                          width: double.maxFinite,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(IconProypet.delivery),
                              SizedBox(height: 5),
                              Text(
                                widget.delivery,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(widget.address),
                            ],
                          ),
                        ),
                      )
                    else
                      SizedBox(height: 0)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
