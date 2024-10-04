import 'package:doctor_app/data/json.dart';
import 'package:doctor_app/pages/doctor_profile_page.dart';
import 'package:doctor_app/theme/colors.dart';
import 'package:doctor_app/widgets/avatar_image.dart';
import 'package:doctor_app/widgets/doctor_box.dart';
import 'package:doctor_app/widgets/textbox.dart';
import 'package:flutter/material.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({Key? key}) : super(key: key);

  @override
  _DoctorPageState createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Doctors",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.info,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: getBody(),
    );
  }

  getBody() {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Row(
                children: [
                  Expanded(child: CustomTextBox()),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.filter_list_rounded,
                    color: primary,
                    size: 35,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: List.generate(
                        chatsData.length,
                        (index) => Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Badge(
                                  // badgeColor: Colors.green,
                                  // borderSide: const BorderSide(color: Colors.white),
                                  // position: BadgePosition.topEnd(top: -3, end: 0),
                                  // badgeContent: const Text(''),
                                  child: AvatarImage(
                                      chatsData[index]["image"].toString())),
                            ))),
              ),
              const SizedBox(
                height: 20,
              ),
              getDoctorList()
            ])));
  }

  getDoctorList() {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      //   crossAxisCount: 4,
      itemCount: doctors.length,
      itemBuilder: (BuildContext context, int index) => DoctorBox(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DoctorProfilePage()));
          },
          index: index,
          doctor: doctors[index]),
      //  zzBuilder: (int index) =>
      //   new StaggeredTile.count(2, index.isEven ? 3 : 2),
      // mainAxisSpacing: 4,
      // crossAxisSpacing: 4,
    );
  }
}
