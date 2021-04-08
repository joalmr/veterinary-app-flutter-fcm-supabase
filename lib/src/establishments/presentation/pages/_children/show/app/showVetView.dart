import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/establishments/domain/show/showVetController.dart';
import 'components/base/editBaseView.dart';
import 'components/base/slidesView.dart';
import 'components/description/_descriptionView.dart';
import 'components/employees/_employeesView.dart';
import 'components/prices/_pricesView.dart';
import 'components/schedule/_schedulesView.dart';
import 'components/servicess/_servicesView.dart';

class ShowVetView extends StatelessWidget {
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return GetX<ShowVetController>(
      builder: (_) {
        return _.cargando
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
                      Container(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        child: PageView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            for (var item in _.establishment.slides)
                              AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Container(
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
                        top: 30,
                        left: 5,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () => Get.back(),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        right: 5,
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
                              icon: Icon(
                                Icons.edit,
                              ),
                              onPressed: () {
                                Get.to(EditSlidesView());
                              },
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
                                  imageUrl: _.establishment.logo,
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
                                    icon: Icon(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: ListTile(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              minVerticalPadding: 0,
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                      borderRadius: borderRadius,
                                      color: colorMain,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 1.5,
                                      horizontal: 5,
                                    ),
                                    child: Text(
                                      'Ej->Veterinaria',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 8,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Text(_.establishment.name,
                                      maxLines: 2,
                                      style: Get.textTheme.subtitle1
                                          .apply(fontWeightDelta: 2)),
                                ],
                              ),
                              subtitle: Text(_.establishment.address,
                                  style: TextStyle(fontSize: 12)),
                              trailing: Stack(
                                children: <Widget>[
                                  Container(height: 56.0, width: 60.0),
                                  Container(
                                    height: 50.0,
                                    width: 50.0,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        color: colorYellow),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.star,
                                              color: Colors.white, size: 12.0),
                                          Text(
                                            _.establishment.stars,
                                            style: TextStyle(
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
                                          icon: Icon(Icons.edit),
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
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          labelColor: colorMain,
                          unselectedLabelColor: Get.textTheme.subtitle2.color,
                          unselectedLabelStyle:
                              TextStyle(fontWeight: FontWeight.normal),
                          tabs: [
                            Tab(text: "Servicios"),
                            Tab(text: "Descripción"),
                            Tab(text: "Precios"),
                            Tab(text: "Horarios"),
                            Tab(text: "Empleados"),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: <Widget>[
                              ServicesView(),
                              DescriptionView(
                                description: _.establishment.description,
                              ),
                              PricesView(
                                prices: _.establishment.prices,
                              ),
                              SchedulesView(
                                schedule: _.establishment.schedule,
                              ),
                              EmployeesView(
                                employees: _.establishment.employees,
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
