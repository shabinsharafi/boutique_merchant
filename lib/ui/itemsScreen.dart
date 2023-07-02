import 'package:boutique_merchant/provider/ItemsVM.dart';
import 'package:boutique_merchant/ui/addItemScreen.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:boutique_merchant/widgets/nothing_layout.dart';
import 'package:boutique_merchant/widgets/toolbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {

  @override
  void initState() {
    super.initState();
    Provider.of<ItemsProvider>(context, listen: false).getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ToolBar("Items"),
        body: Consumer<ItemsProvider>(
          builder: (context,provider,child) {
            return Container(
                child: Nothing(
              "No items added",
              "Add Item",
              onClick: () {
                NavigationService.changeScreen(AddItemScreen());
              },
            ));
          }
        ));
  }
}
