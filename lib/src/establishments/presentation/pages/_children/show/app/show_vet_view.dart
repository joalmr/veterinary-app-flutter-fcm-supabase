import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/establishments/domain/show/show_vet_controller.dart';
import 'components/base/edit_base_view.dart';
import 'components/base/slides_view.dart';
import 'components/description/_description_view.dart';
import 'components/employees/_employees_view.dart';
import 'components/prices/_prices_view.dart';
import 'components/schedule/_schedules_view.dart';
import 'components/servicess/_services_view.dart';

class ShowVetView extends StatelessWidget {
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return GetX<ShowVetController>(
      builder: (_) {
        return _.cargando.value
            ? Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  toolbarHeight: context.height * 0.245,
                  automaticallyImplyLeading: false,
                  flexibleSpace: Stack(
                    children: <Widget>[
                      SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        child: PageView(
                          // scrollDirection: Axis.horizontal,
                          children: [
                            for (var item in _.establishment.value.slides!)
                              AspectRatio(
                                aspectRatio: 16 / 9,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Image(
                                    fit: BoxFit.cover,
                                    image: CachedNetworkImageProvider(item),
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 2.5,
                        left: 5,
                        child: SafeArea(
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () => Get.back(),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: SafeArea(
                          child: Container(
                            height: 25.0,
                            width: 25.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: IconButton(
                                splashRadius: 20,
                                iconSize: 18,
                                icon: const Icon(
                                  Icons.edit,
                                ),
                                onPressed: () {
                                  Get.to(const EditSlidesView());
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 7.5,
                        bottom: 9.5,
                        child: Stack(
                          children: [
                            Container(
                              height: 55.0,
                              width: 55.0,
                              decoration: BoxDecoration(
                                color: colorWhite,
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100.0),
                                child: CachedNetworkImage(
                                  imageUrl: _.establishment.value.logo!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0.0,
                              right: 0.0,
                              child: Container(
                                height: 25.0,
                                width: 25.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: IconButton(
                                    splashRadius: 20,
                                    iconSize: 18,
                                    icon: const Icon(
                                      Icons.edit,
                                    ),
                                    onPressed: () => _.seleccionarLogo(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                body: RefreshIndicator(
                  key: refreshKey,
                  onRefresh: _.refresh,
                  child: DefaultTabController(
                    length: 5,
                    initialIndex: _.initialTab.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              minVerticalPadding: 0,
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                      borderRadius: borderRadius,
                                      color: colorMain,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 1.5,
                                      horizontal: 5,
                                    ),
                                    child: Text(
                                      _.establishment.value.type!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 8,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Text(_.establishment.value.name!,
                                      maxLines: 2,
                                      style: Get.textTheme.subtitle1!
                                          .apply(fontWeightDelta: 2)),
                                ],
                              ),
                              subtitle: Text(_.establishment.value.address!,
                                  style: const TextStyle(fontSize: 12)),
                              trailing: Stack(
                                children: <Widget>[
                                  const SizedBox(height: 56.0, width: 60.0),
                                  Container(
                                    height: 50.0,
                                    width: 50.0,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        color: colorYellow),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          const Icon(Icons.star,
                                              color: Colors.white, size: 12.0),
                                          Text(
                                            _.establishment.value.stars!,
                                            style: const TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0.0,
                                    right: 0.0,
                                    child: Container(
                                      height: 25.0,
                                      width: 25.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: IconButton(
                                          splashRadius: 20,
                                          iconSize: 18,
                                          icon: const Icon(Icons.edit),
                                          onPressed: () {
                                            Get.to(EditBaseView());
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        TabBar(
                          isScrollable: true,
                          indicatorColor: colorMain,
                          labelStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                          labelColor: colorMain,
                          unselectedLabelColor: Get.textTheme.subtitle2!.color,
                          unselectedLabelStyle:
                              const TextStyle(fontWeight: FontWeight.normal),
                          tabs: const [
                            Tab(text: 'Servicios'),
                            Tab(text: 'Descripción'),
                            Tab(text: 'Precios'),
                            Tab(text: 'Horarios'),
                            Tab(text: 'Empleados'),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: <Widget>[
                              ServicesView(),
                              DescriptionView(
                                description: _.establishment.value.description!,
                              ),
                              PricesView(
                                prices: _.establishment.value.prices!,
                              ),
                              SchedulesView(
                                schedule: _.establishment.value.schedule!,
                              ),
                              EmployeesView(
                                employees: _.establishment.value.employees!,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
