import 'package:boutique_merchant/models/items.dart';
import 'package:boutique_merchant/provider/ItemsVM.dart';
import 'package:boutique_merchant/ui/addItemScreen.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:boutique_merchant/widgets/PrimaryButton.dart';
import 'package:boutique_merchant/widgets/nothing_layout.dart';
import 'package:boutique_merchant/widgets/toolbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cards/ItemsCard.dart';

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
        body: Consumer<ItemsProvider>(builder: (context, provider, child) {
          if (provider.isLoginLoading || provider.itemsResponse == null)
            return Center(
              child: CircularProgressIndicator(),
            );
          else if (provider.itemsResponse != null &&
              provider.itemsResponse!.data!.items!.isNotEmpty)
            return Column(
              children: [
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: provider.itemsResponse!.data!.items!.length,
                    itemBuilder: (context, index) {
                      return ItemsCard(provider.itemsResponse!.data!.items![index]);
                    },
                  ),
                ),
                PrimaryButton(
                  "Add New Item",
                  onTap: () {
                    NavigationService.changeScreen(AddItemScreen());
                  },
                )
              ],
            );
          return Container(
              child: Nothing(
            "No items added",
            "Add Item",
            onClick: () {
              NavigationService.changeScreen(AddItemScreen());
            },
          ));
        }));
  }

}
