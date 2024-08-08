import 'package:flutter/material.dart';
import 'package:task_auvnet/my_theme.dart';

// ignore: must_be_immutable
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Image.asset("assets/images/smalllogo.png"),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: TextFormField(
                          decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.06),
                          child: Icon(
                            Icons.search,
                            size: 35,
                            color: MyTheme.primaryColor,
                          ),
                        ),
                        hintText: "what do you search for?",
                        hintStyle: Theme.of(context).textTheme.titleSmall,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: MyTheme.primaryColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: MyTheme.primaryColor),
                        ),
                      )),
                    ),
                    Expanded(
                        flex: 1,
                        child: ImageIcon(
                          const AssetImage("assets/images/icon_cart.png"),
                          color: MyTheme.primaryColor,
                        )),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "view all",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: MyTheme.primaryColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),

                /// Brands
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Brands",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "view all",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: MyTheme.primaryColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
