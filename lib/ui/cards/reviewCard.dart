import 'package:boutique_merchant/models/review.dart';
import 'package:boutique_merchant/styles/styles.dart';
import 'package:boutique_merchant/widgets/NetworkImageShimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewCard extends StatelessWidget {
  ReviewCard(this.review, {Key? key}) : super(key: key);

  Review review;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            /*SizedBox(
              width: 50,
              height: 50,
              child: NetworkImageShimmer(
                (order.items![i].images != null &&
                        order.items![i].images!.isNotEmpty)
                    ? order.items![i].images![0]
                    : "",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 12,
            ),*/
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        child: NetworkImageShimmer("", radius: 15),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        review.user!.name!,
                        style: Styles.textStyle.normalBoldTS,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 8,
        ),
        RatingBar.builder(
          initialRating: review.rating!.toDouble(),
          direction: Axis.horizontal,
          itemSize: 15,
          ignoreGestures: true,
          wrapAlignment: WrapAlignment.start,
          itemPadding: EdgeInsets.only(right: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.orangeAccent,
          ),
          onRatingUpdate: (rating) {},
        ),
        if (review.review != null && review.review!.isNotEmpty)
          SizedBox(
            height: 5,
          ),
        if (review.review != null && review.review!.isNotEmpty)
          Text(
            review.review!,
            style: Styles.textStyle.normalTS,
          ),
      ],
    );
  }
}
