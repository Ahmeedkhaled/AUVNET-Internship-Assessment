import 'package:flutter/material.dart';
import 'package:task_auvnet/my_theme.dart';

class BuildProfileInfo extends StatelessWidget {
  // final String userName;
  // final String address;

  const BuildProfileInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.black,
              radius: 30,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.04),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "userName",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: MyTheme.primaryColor),
                ),
                Text(
                  "address",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: MyTheme.primaryColor, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            // Navigator.of(context).pushNamed();
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.08,
              vertical: MediaQuery.of(context).size.height * 0.02,
            ),
            backgroundColor: const Color(0xffD9D9D9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Text(
            "Edit Profile",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: MyTheme.primaryColor, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
