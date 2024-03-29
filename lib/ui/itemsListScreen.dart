import 'package:boutique_merchant/models/items.dart';
import 'package:boutique_merchant/provider/ItemsVM.dart';
import 'package:boutique_merchant/styles/styles.dart';
import 'package:boutique_merchant/ui/addItemScreen.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:boutique_merchant/widgets/PrimaryButton.dart';
import 'package:boutique_merchant/widgets/nothing_layout.dart';
import 'package:boutique_merchant/widgets/toolbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cards/ItemsCard.dart';

class ItemsListScreen extends StatefulWidget {
  const ItemsListScreen({Key? key}) : super(key: key);

  @override
  State<ItemsListScreen> createState() => _ItemsListScreenState();
}

class _ItemsListScreenState extends State<ItemsListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ItemsProvider>(context, listen: false).getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ToolBar("Items"),
        body: RefreshIndicator(
          onRefresh: () async {
            return await Provider.of<ItemsProvider>(context, listen: false).getItems();
          },
          child: Consumer<ItemsProvider>(builder: (context, provider, child) {
            if (provider.isItemLoading || provider.itemsResponse == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (provider.itemsResponse != null &&
                provider.itemsResponse!.data!.items!.isNotEmpty) {
              return Padding(
                padding: EdgeInsets.all(Styles.dimens.screenPadding),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                        itemCount: provider.itemsResponse!.data!.items!.length,
                        itemBuilder: (context, index) {
                          return ItemsCard(
                              provider.itemsResponse!.data!.items![index]);
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
                ),
              );
            }
            return Container(
                child: Nothing(
              "No items added",
              title: "Add Item",
              onClick: () {
                NavigationService.changeScreen(AddItemScreen());
              },
            ));
          }),
        ));
  }
}
