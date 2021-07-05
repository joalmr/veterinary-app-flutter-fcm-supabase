import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/icons/proypet_icons.dart';
import 'package:vet_app/routes/routes.dart';
import 'package:vet_app/src/bookings/presentation/pages/reprogramar/app/reprogramar.dart';

class CardAttention extends StatefulWidget {
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
  final int attentionType;

  const CardAttention({
    required this.bookingId,
    required this.petImg,
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
    required this.attentionType,
  });

  @override
  _CardAttentionState createState() => _CardAttentionState();
}

class _CardAttentionState extends State<CardAttention> {
  bool more = false;

  @override
  Widget build(BuildContext context) {
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

    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 68.0,
                                  width: 68.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image(
                                        fit: BoxFit.cover,
                                        image: CachedNetworkImageProvider(
                                            widget.petImg),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.petName,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      widget.petBreed,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: widget.color,
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                          ),
                                          height: 7.5,
                                          width: 7.5,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          widget.status,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '${widget.date} ${widget.time}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              bottom: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Usuario',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(widget.userName),
                                Text(widget.userPhone),
                                const SizedBox(height: 5),
                                const Text(
                                  'Tipo',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(stringTypes),
                                const SizedBox(height: 5),
                                const Text(
                                  'Observaciones',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(
                                  widget.observation == ''
                                      ? '-'
                                      : widget.observation,
                                  maxLines: 5,
                                ),
                                const SizedBox(height: 5),
                                if (widget.delivery != '' &&
                                    widget.address != '')
                                  Card(
                                    color: Colors.grey[200],
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      width: double.maxFinite,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Icon(IconProypet.delivery),
                                          const SizedBox(height: 5),
                                          Text(
                                            widget.delivery,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(widget.address),
                                        ],
                                      ),
                                    ),
                                  )
                                else
                                  const SizedBox(height: 0)
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              //* tipo de atencion
                              if (widget.attentionType == 3)
                                const SizedBox(width: 0)
                              else
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 7.5),
                                    child: btnSecondary(
                                      text: 'Atender',
                                      onPressed: () {
                                        Get.toNamed(NameRoutes.atenderBooking,
                                            arguments: {
                                              'bookingId': widget.bookingId,
                                              'petId': '-',
                                              'specie': '-',
                                              'breed': widget.petBreed,
                                              'name': widget.petName,
                                              'image': widget.petImg,
                                              'birthday': '-'
                                            });
                                      },
                                    ),
                                  ),
                                ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 7.5, right: 20),
                                  child: btnSecondary(
                                    text: 'Reprogramar',
                                    color: Colors.grey[600]!,
                                    onPressed: () {
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
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            leading: Container(
              height: 48.0,
              width: 48.0,
              decoration: BoxDecoration(
                // color: widget.color,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(widget.petImg)),
                ),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.petName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(widget.petBreed),
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
                    const SizedBox(width: 5),
                    Text(
                      widget.status,
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  child: Row(
                    children: [
                      Icon(
                        more ? Icons.expand_less : Icons.expand_more_rounded,
                        size: 14,
                        color: colorMain,
                      ),
                      const Text(
                        'Ver más',
                        style: TextStyle(
                          color: colorMain,
                          fontSize: 12.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.date,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  widget.time,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
