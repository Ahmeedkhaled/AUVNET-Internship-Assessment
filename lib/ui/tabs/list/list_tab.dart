import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_auvnet/constant/routes.dart';
import 'package:task_auvnet/domain/di.dart';
import 'package:task_auvnet/my_theme.dart';
import 'package:task_auvnet/ui/tabs/list/cubit/list_tab_state.dart';
import 'package:task_auvnet/ui/tabs/list/cubit/list_tab_view_modal.dart';
import 'package:task_auvnet/ui/tabs/list/widget/list_item.dart';

class ListTab extends StatefulWidget {
  const ListTab({Key? key}) : super(key: key);

  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  late ListTabViewModal listTabViewModal;

  @override
  void initState() {
    super.initState();
    listTabViewModal = ListTabViewModal(
      getAllProductUseCase: injectGetAllProductUseCase(),
      addToCartUseCase: injectAddToCartUseCase(),
    );
    listTabViewModal.getAllProduct(); // Load products initially
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListTabViewModal>(
      create: (context) => listTabViewModal,
      child: BlocBuilder<ListTabViewModal, ListTabState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: SafeArea(
              child: Scaffold(
                body: Column(
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
                                  left:
                                      MediaQuery.of(context).size.width * 0.06,
                                ),
                                child: Icon(
                                  Icons.search,
                                  size: 35,
                                  color: MyTheme.primaryColor,
                                ),
                              ),
                              hintText: "What do you search for?",
                              hintStyle: Theme.of(context).textTheme.titleSmall,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide:
                                    BorderSide(color: MyTheme.primaryColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide:
                                    BorderSide(color: MyTheme.primaryColor),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {},
                            child: Badge(
                              label: Text(
                                  listTabViewModal.numOfCartItems.toString()),
                              child: ImageIcon(
                                AssetImage("assets/images/icon_cart.png"),
                                color: MyTheme.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    if (state is ListTabProductLoadingState)
                      Center(
                        child: CircularProgressIndicator(
                            color: MyTheme.primaryColor),
                      )
                    else
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            mainAxisExtent:
                                MediaQuery.of(context).size.height * 0.5,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  MyRoute.listDetailsName,
                                  arguments:
                                      listTabViewModal.productsList[index],
                                );
                              },
                              child: ListItem(
                                productEntity:
                                    listTabViewModal.productsList[index],
                              ),
                            );
                          },
                          itemCount: listTabViewModal.productsList.length,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
