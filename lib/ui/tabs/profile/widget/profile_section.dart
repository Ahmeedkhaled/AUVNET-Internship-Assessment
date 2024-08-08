import 'package:flutter/material.dart';
import 'package:task_auvnet/my_theme.dart';

// ignore: must_be_immutable
class BuildSection extends StatelessWidget {
  String? title;
  String? count;
  VoidCallback? onTap;
  BuildSection(
      {super.key,
      required this.title,
      required this.count,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title ?? "",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: MyTheme.primaryColor,
                  fontSize: 22,
                  fontFamily: "Schyler"),
            ),
            if (count != null)
              Text(
                count ?? "",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: const Color(0xff777575), fontFamily: "Schyler"),
              ),
          ],
        ),
      ),
    );
  }
}
