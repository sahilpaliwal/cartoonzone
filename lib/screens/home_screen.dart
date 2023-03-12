// ignore_for_file: prefer_const_literals_to_create_immutables , prefer_const_constructors, avoid_print, unused_field, prefer_final_fields, unused_element, unused_import, non_constant_identifier_names, unused_local_variable

import 'dart:collection';
import 'package:Cartoons/screens/category_Screen.dart';
import 'package:Cartoons/screens/drawer.dart';
import 'package:Cartoons/screens/setting_Screen.dart';
import 'package:Cartoons/utils/controller.dart';
import 'package:Cartoons/widgets/cartoon_card.dart';
import 'package:Cartoons/widgets/cartoon_class.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? searchTextcontroller;
  List<CartoonClass> SearchResult = [];
  bool showSearchResult = false;
  final focussnode = FocusNode();

  @override
  void initState() {
    bool showSearchResult = false;
    searchTextcontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchTextcontroller?.dispose();
    super.dispose();
  }

  // getSearchResults(String value) {
  //   if (value == "") {
  //     setState(() {
  //       showSearchResult = false;
  //     });
  //   } else {
  //     for(var cartooncard in cartoonCardList){
  //       if(cartooncard.cartoonName.toLowerCase().contains(value.toLowerCase())&&SearchResult.contains(cartooncard)==false){
  //         SearchResult.add(cartooncard);
  //       }
  //     }
  //     setState(() {
  //       showSearchResult = true;
  //     });
  //   }
  // }

  getSearchResults(String value) {
    if (value == "") {
      setState(() {
        showSearchResult = false;
        SearchResult = [];
      });
    } else {
      List<CartoonClass> matchingResults = [];
      for (var cartooncard in cartoonCardList) {
        if (cartooncard.cartoonName
            .toLowerCase()
            .contains(value.toLowerCase())) {
          matchingResults.add(cartooncard);
        }
      }
      matchingResults.sort((a, b) {
        String aName = a.cartoonName.toLowerCase();
        String bName = b.cartoonName.toLowerCase();
        int aIndex = aName.indexOf(value.toLowerCase());
        int bIndex = bName.indexOf(value.toLowerCase());
        if (aIndex == bIndex) {
          return aName.compareTo(bName);
        } else if (aIndex == -1) {
          return 1;
        } else if (bIndex == -1) {
          return -1;
        } else {
          return aIndex - bIndex;
        }
      });
      setState(() {
        showSearchResult = true;
        SearchResult = matchingResults;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focussnode.unfocus();
      },
      child: Scaffold(
        backgroundColor: greywhite,
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu_rounded,
                  color: black,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            "Cartoon Zone",
            style: GoogleFonts.quicksand(
                color: black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        drawer: Drawers(),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //find and watch your cartoon

                Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    "Find and Watch Your",
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                    style: GoogleFonts.quicksand(
                      color: black,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "favorite Cartoon's",
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                    style: GoogleFonts.quicksand(
                      color: black,
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),

                //Search field

                Padding(
                  padding: EdgeInsets.all(20),
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 3,
                    child: Container(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      decoration: BoxDecoration(
                        color: PrimaryWhiteBackground,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              onChanged: (value) {
                                getSearchResults(value);
                              },
                              focusNode: focussnode,
                              scrollPhysics: BouncingScrollPhysics(),
                              controller: searchTextcontroller,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Search Your Favrioute Cartoon',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00F1F4F8),
                                    width: 0,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00F1F4F8),
                                    width: 0,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 0,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 0,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: PrimaryWhiteBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    15, 15, 0, 15),
                              ),
                              style: GoogleFonts.quicksand(
                                  color: black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14),
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Icon(Icons.search_rounded)
                        ],
                      ),
                    ),
                  ),
                ),

                showSearchResult == false
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              "Category",
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w900,
                                  color: black,
                                  fontSize: 16),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 8, bottom: 8),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CategoryOption(
                                      "Action",
                                      "https://cdn3d.iconscout.com/3d/premium/thumb/sword-and-shield-6938908-5666809.png",
                                      Actionlist),
                                  CategoryOption(
                                      "Adventure",
                                      "https://cdn3d.iconscout.com/3d/premium/thumb/adventure-map-6772221-5575492.png",
                                      Adventurelist),
                                  CategoryOption(
                                      "Drama",
                                      "https://cdn3d.iconscout.com/3d/premium/thumb/theater-masks-6234672-5106321.png",
                                      Dramalist),
                                  CategoryOption(
                                      "Comedy",
                                      "https://cdn3d.iconscout.com/3d/premium/thumb/clown-4782890-3986096.png",
                                      ComedyList),
                                  CategoryOption(
                                      "Fantasy",
                                      "https://cdn3d.iconscout.com/3d/premium/thumb/scroll-paper-6673801-5526417.png?f=webp",
                                      FantasyList),
                                ],
                              ),
                            ),
                          ),

                          //Popular Tag

                          Padding(
                            padding:
                                EdgeInsets.only(top: 10, left: 20, right: 20),
                            child: Text(
                              "Popular",
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w900,
                                  color: black,
                                  fontSize: 16),
                            ),
                          ),

                          GridView.builder(
                            itemCount: 4,
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 0, bottom: 10),
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 0,
                                    mainAxisSpacing: 0,
                                    childAspectRatio: 0.84),
                            itemBuilder: (context, index) {
                              return GridCartoonCard(
                                  cartoonClass: Popularlist[index]);
                            },
                          ),

                          //Trending Tag

                          Padding(
                            padding:
                                EdgeInsets.only(top: 10, left: 20, right: 20),
                            child: Text(
                              "Trending",
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w900,
                                  color: black,
                                  fontSize: 16),
                            ),
                          ),

                          GridView.builder(
                            itemCount: 4,
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 0, bottom: 10),
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 0,
                                    mainAxisSpacing: 0,
                                    childAspectRatio: 0.84),
                            itemBuilder: (context, index) {
                              return GridCartoonCard(
                                  cartoonClass: TrendingList[index]);
                            },
                          ),

                          //All Cartoons's Tag
                          Padding(
                            padding:
                                EdgeInsets.only(top: 10, left: 20, right: 20),
                            child: Text(
                              "All Cartoons",
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w900,
                                  color: black,
                                  fontSize: 16),
                            ),
                          ),

                          // list view for cartoon card's
                          ListView.builder(
                              itemCount: cartoonCardList.length,
                              padding: EdgeInsets.only(bottom: 20),
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return CartoonCard(
                                    cartoonClass: cartoonCardList[index]);
                              })
                        ],
                      )
                    : Column(
                        children: [
                          ListView.builder(
                              itemCount: SearchResult.length,
                              padding: EdgeInsets.only(bottom: 20),
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return CartoonCard(
                                    cartoonClass: SearchResult[index]);
                              })
                        ],
                      ),

                //Category Tag
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget CategoryOption(
      String name, String Imageurl, List<CartoonClass> cartoonCardList) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CategoryListScreen(
              title: name, cartoonclasslist: cartoonCardList),
        ));
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(7),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: black.withOpacity(0.9),
                borderRadius: BorderRadius.circular(45)),
            child: Image(image: NetworkImage(Imageurl)),
          ),
          Text(
            name,
            style: GoogleFonts.quicksand(
                fontWeight: FontWeight.w700, color: black, fontSize: 12),
          )
        ],
      ),
    );
  }

  Future<InitializationStatus> _initGoogleMobileAds() {
    return MobileAds.instance.initialize();
  }
}

