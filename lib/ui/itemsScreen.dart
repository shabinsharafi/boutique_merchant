import 'package:boutique_merchant/ui/addItemScreen.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:boutique_merchant/widgets/nothing_layout.dart';
import 'package:boutique_merchant/widgets/toolbar.dart';
import 'package:flutter/material.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ToolBar("Items"),
        body: Container(
            child: Nothing(
          "No items added",
          "Add Item",
          onClick: () {
            NavigationService.changeScreen(AddItemScreen());
          },
        )));
  }
}
