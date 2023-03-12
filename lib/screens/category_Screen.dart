// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable, prefer_const_constructors

import 'package:Cartoons/screens/drawer.dart';
import 'package:Cartoons/widgets/cartoon_class.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/cartoon_card.dart';

class CategoryListScreen extends StatelessWidget {
  String title;
  List<CartoonClass> cartoonclasslist;
  CategoryListScreen(
      {super.key, required this.title, required this.cartoonclasslist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greywhite,
      appBar: AppBar(
        title: Text(title,
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.bold,
              color: black,
              fontSize: 22,
            )),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
          itemCount: cartoonclasslist.length,
          padding: EdgeInsets.only(bottom: 20),
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return CartoonCard(cartoonClass: cartoonclasslist[index]);
          }),
    );
  }
}
