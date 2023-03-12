// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_declarations, empty_statements, sort_child_properties_last, constant_identifier_names

import 'package:Cartoons/screens/aboutUs_screen.dart';
import 'package:Cartoons/screens/privacypolicy.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Drawers extends StatefulWidget {
  const Drawers({super.key});

  @override
  State<Drawers> createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: greywhite,
      child: ListView(
        children: [
          Container(
              height: 120,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Text(
                "Cartoon Zone",
                style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w900, color: black, fontSize: 26),
              )),
          SizedBox(
            height: 10,
            width: double.infinity,
          ),
          Items(
            icon: Icons.home_rounded,
            text: "Dashboard",
            ontap: () {
              Navigator.of(context).pop();
            },
          ),
          Items(
            icon: Icons.info_rounded,
            text: "About Us",
            ontap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PrivacyPolicy()));
            },
          ),
          Items(
            icon: Icons.stars_rounded,
            text: "Rate Us",
            ontap: () async {
              // this below is rate us link
              // final hturl =
              //     "https://play.google.com/store/apps/details?id=com.AppStraa.jewellery&hl=en";
              // if (await canLaunch(hturl)) {
              //   await launch(hturl, forceWebView: true, enableJavaScript: true);
              // }
              //
              //this below is more app link
              final hturl =
                  "https://play.google.com/store/apps/developer?id=AppStraa&hl=en";
              if (await canLaunch(hturl)) {
                await launch(hturl, forceWebView: true, enableJavaScript: true);
              }
            },
          ),
          Items(
            icon: Icons.apps_rounded,
            text: "More App",
            ontap: () async {
              final hturl =
                  "https://play.google.com/store/apps/developer?id=AppStraa&hl=en";
              if (await canLaunch(hturl)) {
                await launch(hturl, forceWebView: true, enableJavaScript: true);
              }
              ;
            },
          ),
          Items(
            icon: Icons.email_rounded,
            text: "FeedBack",
            ontap: () async {
              final ToEmail = "appstraa@gmail.com";
              final Subject = "Feedback";
              final message = "enter your feedback!";
              final url = "mailto:$ToEmail?subject=${Subject}&body=${message}";
              if (await canLaunch(url)) {
                launch(url);
              }
              ;
            },
          ),
          Items(
            icon: Icons.bookmark_rounded,
            text: "Terms Of Service",
            ontap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Aboutus()));
            },
          ),
          Items(
            icon: Icons.share_rounded,
            text: "Invite Friends",
            ontap: () async {
              await Share.share(
                  "Invite Your Friend's https://play.google.com/store/apps/developer?id=AppStraa&hl=en");
            },
          )
        ],
      ),
    );
  }
}

class Items extends StatelessWidget {
  IconData icon;
  String text;
  void Function() ontap;
  Items(
      {super.key, required this.icon, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: PrimaryWhiteBackground,
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          onTap: ontap,
          leading: Icon(
            icon,
            color: black,
            size: 20,
          ),
          title: Text(
            text,
            style: GoogleFonts.quicksand(
              color: black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

const PrimaryWhiteBackground = Colors.white;
const SecendoryBlueColor = Color(0xFF1D2428);
const black = Colors.black;
const greywhite = Color(0xffF9F8FB);
