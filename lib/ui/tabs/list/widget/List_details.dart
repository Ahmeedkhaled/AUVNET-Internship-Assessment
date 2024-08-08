// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:readmore/readmore.dart';
import 'package:task_auvnet/domain/entity/product_response.dart';
import 'package:task_auvnet/my_theme.dart';

class ListItemDetails extends StatefulWidget {
  const ListItemDetails({super.key});

  @override
  State<ListItemDetails> createState() => _ListItemDetailsState();
}

class _ListItemDetailsState extends State<ListItemDetails> {
  num count = 1;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as ProductEntity;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: MyTheme.primaryColor,
        title: const Text("Product Details"),
        titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: MyTheme.darkPrimaryColor,
            ),
        actions: [
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(Icons.search)),
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02,
          horizontal: MediaQuery.of(context).size.width * 0.03,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: ImageSlideshow(
                      initialPage: 0,
                      indicatorColor: MyTheme.primaryColor,
                      indicatorBackgroundColor: MyTheme.whiteColor,
                      indicatorBottomPadding:
                          MediaQuery.of(context).size.height * 0.02,
                      autoPlayInterval: 3000,
                      isLoop: true,
                      children: args.images!
                          .map((url) => Image.network(
                                url,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                              ))
                          .toList(),
                    )),
                Image.asset("assets/images/group.png"),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  args.title ?? "",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 16,
                      ),
                ),
                Text(
                  "EGP ${args.price}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          width: 2,
                          color: MyTheme.primaryColor,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01,
                          horizontal: MediaQuery.of(context).size.width * 0.04,
                        ),
                        child: Text(
                          "${args.sold} sold",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: MyTheme.darkPrimaryColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Image.asset(
                      "assets/images/emoji.png",
                    ),
                    Text(
                      "${args.ratingsAverage}",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: MyTheme.primaryColor,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      width: 2,
                      color: MyTheme.primaryColor,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {
                            if (count == 1) {
                              return;
                            }
                            count--;

                            setState(() {});
                          },
                          icon: Image.asset("assets/images/icon-.png")),
                      Text(
                        "$count",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: MyTheme.whiteColor),
                      ),
                      IconButton(
                          onPressed: () {
                            count++;
                            setState(() {});
                          },
                          icon: Image.asset("assets/images/icon+.png")),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              "Description",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 24),
            ),
            ReadMoreText(
              args.description ?? "",
              style: const TextStyle(fontSize: 20),
              trimLines: 2,
              colorClickableText: MyTheme.primaryColor,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              moreStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              lessStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color?>(MyTheme.primaryColor),
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry?>(
                        EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.02)),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: MyTheme.primaryColor),
                    ))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.shopping_cart_outlined),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    const Text("Add To Cart"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
