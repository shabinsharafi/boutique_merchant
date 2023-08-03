import 'package:boutique_merchant/models/items.dart';
import 'package:boutique_merchant/provider/ItemsVM.dart';
import 'package:boutique_merchant/provider/OrdersVM.dart';
import 'package:boutique_merchant/styles/styles.dart';
import 'package:boutique_merchant/ui/cards/ordersCard.dart';
import 'package:boutique_merchant/ui/cards/reviewCard.dart';
import 'package:boutique_merchant/widgets/nothing_layout.dart';
import 'package:boutique_merchant/widgets/toolbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewsScreen extends StatefulWidget {
  ReviewsScreen(this.item, {Key? key}) : super(key: key);
  Item item;

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ItemsProvider>(context, listen: false)
        .getReviews(widget.item.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ToolBar("Reviews"),
        body: Consumer<ItemsProvider>(builder: (context, provider, child) {
          if (provider.isReviewsLoading || provider.reviewsResponse == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.reviewsResponse != null &&
              provider.reviewsResponse!.data!.items!.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  flex: 1,
                  child: ListView.separated(
                    padding: EdgeInsets.all(Styles.dimens.screenPaddingNormal),
                    itemCount: provider.reviewsResponse!.data!.items!.length,
                    itemBuilder: (context, index) {
                      return ReviewCard(
                          provider.reviewsResponse!.data!.items![index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Expanded(
                        child: Container(
                          color: Colors.grey[200],
                          height: 1,
                          margin: EdgeInsets.only(bottom: 15,top: 15),
                        ),
                      );
                    },
                  ),
                ),
                /*PrimaryButton(
                  "Add New Item",
                  onTap: () {
                    NavigationService.changeScreen(AddItemScreen());
                  },
                )*/
              ],
            );
          }
          return Container(
              child: Nothing(
            "No orders for you",
            //"Add Item",
            /*onClick: () {
              NavigationService.changeScreen(AddItemScreen());
            },*/
          ));
        }));
  }
}
