// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, must_be_immutable

import 'package:Cartoons/screens/Cartoon_Screen.dart';
import 'package:Cartoons/screens/drawer.dart';
import 'package:Cartoons/widgets/cartoon_class.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartoonCard extends StatelessWidget {
  final CartoonClass cartoonClass;
  const CartoonCard({super.key, required this.cartoonClass});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 12, 10, 12),
      child: InkWell(
        onTap: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CartoonScreen(
                      CartoonUrl: cartoonClass.cartoonUrl,
                      cartooName: cartoonClass.cartoonName)));
        },
        child: Material(
          elevation: 7,
          borderRadius: BorderRadius.circular(25),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.27,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(cartoonClass.Imageurl),
                  fit: BoxFit.cover),
              color: PrimaryWhiteBackground,
              borderRadius: BorderRadius.circular(25),
              shape: BoxShape.rectangle,
            ),
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: PrimaryWhiteBackground),
              height: 52,
              margin: EdgeInsets.only(left: 8, right: 8, bottom: 3),
              width: double.infinity,
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.7,
                      child: Text(
                        cartoonClass.cartoonName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: black),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: black,
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

class GridCartoonCard extends StatelessWidget {
  CartoonClass cartoonClass;
  GridCartoonCard({super.key, required this.cartoonClass});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 12, 10, 12),
      child: InkWell(
        onTap: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CartoonScreen(
                      CartoonUrl: cartoonClass.cartoonUrl,
                      cartooName: cartoonClass.cartoonName)));
        },
        child: Material(
          elevation: 7,
          borderRadius: BorderRadius.circular(25),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.27,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(cartoonClass.Imageurl),
                  fit: BoxFit.cover),
              color: PrimaryWhiteBackground,
              borderRadius: BorderRadius.circular(25),
              shape: BoxShape.rectangle,
            ),
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: PrimaryWhiteBackground),
              height: 52,
              margin: EdgeInsets.only(left: 8, right: 8, bottom: 3),
              width: double.infinity,
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: 25,
                      child: Text(
                        cartoonClass.cartoonName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                            color: black),
                      ),
                    ),
                    Container(
                      height: 25,
                      alignment: Alignment.topCenter,
                      child: Text(
                        "#action",
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: black),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
