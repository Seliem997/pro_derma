import 'package:flutter/material.dart';
import 'package:pro_derma/modules/settings/widgets/appbar.dart';
import 'package:pro_derma/modules/settings/widgets/repeated_list.dart';
import 'package:pro_derma/shared/styles/colors.dart';
import 'package:sizer/sizer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: customAppBarProfile(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          color: Colors.red.withOpacity(0.4),
          child: Column(
            children: [
              // topProfilePicAndName(),

              middleDashbord(),
              bottomSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Top Profile Photo And Name Components
  topProfilePicAndName() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                "https://wl-brightside.cf.tsp.li/resize/728x/jpg/bf0/944/7889d15ec98e3b8e5ca930c9e1.jpg"),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Edward Larry",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              ),
              Text(
                "Junior Developer",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit_outlined,
                color: Colors.grey,
              ))
        ],
      );
  }

  // Middle Status List View Components
  middleStatusListView() {
    return Container(
        width: 100.w,
        height: 12.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "My Status",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Container(
                width: 100.w / 1.12,
                height: 100.h / 13,
                // color: Colors.green,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            width: 120,
                            decoration: BoxDecoration(
                              color: kDefaultSecondColor,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'status.emoji',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'status.txt',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: kDefaultLightColor,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      );
  }

  // Middle Dashbord Listtile Components
  middleDashbord() {
    return Container(
        width: 100.w,
        height: 60.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "    Dashboard",
              style: const TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.grey, fontSize: 15),
            ),
            const SizedBox(
              height: 10,
            ),
            RoundedLisTile(
              width: 100.w,
              height: 100.h,
              leadingBackColor: Colors.green[600],
              icon: Icons.wallet_travel_outlined,
              title: "Payments",
              trailing: Container(
                width: 80,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[700],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "2 New",
                      style: TextStyle(
                          color: kDefaultLightColor, fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: kDefaultLightColor,
                      size: 15,
                    )
                  ],
                ),
              ),
            ),
            RoundedLisTile(
              width: 100.w,
              height: 100.h,
              leadingBackColor: Colors.yellow[600],
              icon: Icons.archive,
              title: "Achievments",
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.arrow_forward_ios,
                      color: kDefaultNightModeColor,
                      size: 15,
                    )
                  ],
                ),
              ),
            ),
            RoundedLisTile(
              width: 100.w,
              height: 100.h,
              leadingBackColor: Colors.grey[400],
              icon: Icons.shield,
              title: "Privacy",
              trailing: Container(
                width: 140,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red[500],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Action Needed  ",
                      style: TextStyle(
                          color: kDefaultLightColor, fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: kDefaultLightColor,
                      size: 15,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }

  // My Account Section Components
  bottomSection() {
    return Container(
        width: 100.w,
        height: 12.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "    My Account",
              style: TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.grey, fontSize: 15),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "    Switch to Other Account",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[600],
                  fontSize: 17),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "    Log Out",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.red[500],
                  fontSize: 18),
            ),
          ],
        ),
      );
  }
}

