import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_auvnet/constant/routes.dart';
import 'package:task_auvnet/constant/shared_pre.dart';
import 'package:task_auvnet/ui/tabs/profile/widget/profile_info.dart';
import 'package:task_auvnet/ui/tabs/profile/widget/profile_section.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var editProfileArgs =
    //     ModalRoute.of(context)?.settings.arguments as EditProfileArgs?;
    return SafeArea(
        child: Scaffold(
            body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                    child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BuildProfileInfo(
                        // userName: editProfileArgs?.name ?? state.userName,
                        // address: editProfileArgs?.address ?? state.address,
                        ),
                    BuildSection(
                      title: "My Products",
                      count: "102",
                      onTap: () {},
                    ),
                    const Divider(thickness: 1, color: Color(0xffBAB1B1)),
                    BuildSection(title: "My Jobs", count: "904", onTap: () {}),
                    const Divider(thickness: 1, color: Color(0xffBAB1B1)),
                    BuildSection(
                      title: "Notifications",
                      count: null,
                      onTap: () {
                        // Navigator.of(context)
                        //     .pushNamed(RoutesNames.notificationsPage);
                      },
                    ),
                    const Divider(thickness: 1, color: Color(0xffBAB1B1)),
                    BuildSection(
                      title: "Log Out",
                      count: null,
                      onTap: () {
                        SharedPereferanceConstant.removeToken(key: "token");
                        Navigator.of(context)
                            .pushReplacementNamed(MyRoute.login);
                      },
                    ),
                  ],
                )))));
  }
}
