import 'package:flutter/material.dart';
import 'package:task_auvnet/domain/entity/product_response.dart';
import 'package:task_auvnet/my_theme.dart';
import 'package:task_auvnet/ui/tabs/list/cubit/list_tab_view_modal.dart';

// ignore: must_be_immutable
class ListItem extends StatelessWidget {
  ProductEntity productEntity;
  ListItem({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: MyTheme.primaryColor, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  productEntity.imageCover ?? "",
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
              ),
              Image.asset("assets/images/group.png"),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productEntity.title ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 14),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  "EGP ${productEntity.price}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Review ${productEntity.ratingsAverage}",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: MyTheme.primaryColor),
                    ),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: FloatingActionButton(
                        onPressed: () {
                          ListTabViewModal.get(context)
                              .addToCart(productEntity.id ?? "");
                        },
                        backgroundColor: MyTheme.primaryColor,
                        shape: const CircleBorder(),
                        child: const Icon(Icons.add, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
