import 'package:boutique_merchant/configuration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:boutique_merchant/utils/screen_navigation.dart';
import 'package:provider/provider.dart';

import '../../provider/userProvider.dart';

class DrawerScreen extends StatefulWidget {
  DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    var userData=Provider.of<UserProvider>(context,listen: false);
    return Container(
      color: primaryGreen,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 40,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/profile.jpg'),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     userData.userResponse.data.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Active status',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.white60,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: drawerItems
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                      ),
                      child: InkWell(
                        onTap: (){
                          drawerItemSelection(e['tag']);
                        },
                        child: Row(
                          children: [
                            Icon(
                              e['icon'],
                              color: Colors.white60,
                              size: 24,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              e['title'],
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.gear_alt,
                  color: Colors.white60,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Settings',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 2,
                  height: 20,
                  color: Colors.white60,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void drawerItemSelection(e) {
    switch (e){
      /*case "addPet":
        changeScreen(context, AddPetScreen());
        break;
      case "myPets":
        changeScreen(context, MyPetsListScreen());
        break;
      case "fav":
        changeScreen(context, MyFavouriteListScreen());
        break;
      case "message":
        changeScreen(context, ChatPage());
        break;
      case "adoption":
        changeScreen(context, MyFavouriteListScreen());
        break;
      case "profile":
        changeScreen(context, MyFavouriteListScreen());
        break;*/
    }
  }
}
