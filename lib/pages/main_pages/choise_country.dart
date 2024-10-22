import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reward_vpn/controller/main_page_controllers/homescreen_controller.dart';
import 'package:reward_vpn/route/app_route.dart';
import 'package:reward_vpn/services/vpn_services.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:wireguard_flutter/wireguard_flutter.dart';
// WireGuardFlutter

class ChoiseCountry extends StatelessWidget {
  // const ChoiseCountry({super.key});
  final homeScreenController = Get.find<HomescreenController>();

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.sizeOf(context).width;
    double mediaHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(60, 60, 60, 1).withOpacity(0.7),
          title: Text(
            'Choose Country',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.only(top: mediaHeight * 0.03),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      Constants.verification_background,
                    ))),
            child: ListView.builder(
                itemCount: homeScreenController.serverList.length,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: mediaWidth * 0.8,
                      height: mediaHeight * 0.09,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(60, 60, 60, 1).withOpacity(0.7),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          final vpnServices = Get.find<VpnServices>();
                          final wireguard = WireGuardFlutter.instance;
                          final stage = await wireguard.stage();
                          // Get.back();

                          if (stage == VpnStage.connected) {
                            await wireguard.stopVpn();
                            print("before :$stage");

                            await vpnServices.choiseServer(index);
                            homeScreenController.currentServer
                                .add(homeScreenController.serverList[index]);
                            print(" after :$stage");
                            homeScreenController.successServerChanged();
                            // Get.back();
                            Get.toNamed(AppRoute.bottomNavWrapper);
                            ;
                          } else {
                            await vpnServices.choiseServer(index);

                            homeScreenController.currentServer
                                .add(homeScreenController.serverList[index]);
                            homeScreenController.successServerChanged();

                            Get.back();

                            print(" connected :$stage");
                          }
                          // print("Stage :$stage");
                        },
                        child: ListTile(
                          leading: Container(
                            width: mediaWidth * 0.1,
                            height: mediaWidth * 0.1,
                            decoration: BoxDecoration(
                              shape: BoxShape
                                  .circle, // This makes the container circular
                              // overflow: Overflow.clip, // Ensures any overflow is clipped
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                homeScreenController.serverList[index]['image'],
                                fit: BoxFit
                                    .cover, // Ensures the image covers the circle
                              ),
                            ),
                          ),

                          // Image.asset(
                          //     homeScreenController.serverList[index]['image']
                          // ),

                          title: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              homeScreenController.serverList[index]['country'],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.7)),
                              homeScreenController.serverList[index]['city'],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ));
  }
}
