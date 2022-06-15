/*
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:boutique_merchant/configuration.dart';
import 'package:boutique_merchant/models/pets.dart';
import 'package:boutique_merchant/screen/home/homeVM.dart';
import 'package:boutique_merchant/screen/petDetails/petDetailScreen.dart';
import 'package:boutique_merchant/utilities.dart';
import 'package:boutique_merchant/utils/screen_navigation.dart';
import 'package:shimmer/shimmer.dart';

class MostLikedPetsWidget extends StatelessWidget {
  MostLikedPetsWidget(required this.value);

  HomeScreenViewModel value;
  Size size;

  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    Widget _categoryheader({String heading, String description}) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$heading',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '$description',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Text(
                "more",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Icon(
                CupertinoIcons.forward,
                color: Theme.of(context).primaryColor,
              )
            ],
          )),
        ],
      );
    }

    return value.isMostLikedLoading
        ? Shimmer.fromColors(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 250,
                  width: size.width/2,
                );
              },
            ),
            baseColor: Colors.grey[200],
            highlightColor: Colors.grey[300],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _categoryheader(
                  heading: 'Most Liked', description: "Find most liked pets"),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 250,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: value.mostLikedResponse.data.length,
                  itemBuilder: (context, index) {
                    return PetsCard2(pet: value.mostLikedResponse.data[index],onTap: (){
                      changeScreen(context, PetDetailsScreen(pet: value.newlyAddedResponse.data[index],));
                    },);
                  },
                ),
              ),
            ],
          );
  }
}

class PetsCard2 extends StatelessWidget {
  Pets pet;
  VoidCallback onTap;

  PetsCard2({
    required this.pet,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: size.width/2,
        child: Container(
          // height: 200,
          margin: EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                width: size.width/2.2,
                height: 130,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  */
/*
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5)),*//*

                  child: Hero(
                    tag: pet.id,
                    child: pet.imagePath != null
                        ? Image.network(
                            pet.imagePath[0],
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            "assets/dog.png",
                          ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            pet.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Utilities.petIcon[pet.type],
                            size: 18,
                            color: Colors.black54,
                          )
                        ],
                      ),
                      Text(
                        pet.breed,
                        style: TextStyle(
                          fontSize: 12,
                          color: fadedBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        Utilities.formatAge(pet.age),
                        style: TextStyle(
                          fontSize: 12,
                          color: fadedBlack,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300],
                  blurRadius: 5,
                  offset: Offset(0, 5),
                ),
              ],
              borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
*/
