import 'package:flutter/material.dart';
import 'package:task_auvnet/my_theme.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/smalllogo.png"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
          ],
        ),
      ),
    );
  }
}
