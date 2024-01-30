import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:periyarapp/bloc/mainbloc.dart';
import 'package:periyarapp/config.dart';
import 'package:periyarapp/helper/helper.dart';
import 'package:periyarapp/server/serverhelper.dart';
import 'package:periyarapp/ui/drawer/drawerwidget.dart';
import 'package:shimmer/shimmer.dart';

class SpotBookingHome extends StatefulWidget {
  const SpotBookingHome({super.key});

  @override
  State<SpotBookingHome> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SpotBookingHome> {
  final bool? isOffline = false;
  @override
  void initState() {
    BlocProvider.of<MainBloc>(context).add(GetListProgrm());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.green,
          title: const Text('RECEPTION'),
          actions: const <Widget>[
            // isOffline == false
            //     ? IconButton(
            //         onPressed: () {
            //           initState();
            //         },
            //         icon: Icon(Icons.cloud_done_outlined,
            //             size: 18, color: HexColor("#68D389")))
            //     : IconButton(
            //         onPressed: () {
            //           initState();
            //         },
            //         icon: Icon(
            //           Icons.cloud_off,
            //           size: 18,
            //         ),
            //       ),

            // IconButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: ((context) => BusDetailed()),
            //       ),
            //     );
            //   },
            //   icon: Icon(CupertinoIcons.bus),
            // ),
          ],
          bottom: TabBarWrapper(
            tabBar: TabBar(
              indicatorColor: HexColor("#53A874"),
              isScrollable: false,
              tabs: [
                Tab(
                  child: Text(
                    'Programms',
                    // style: StyleElements.tabbarstyle,
                    style: StyleElements.tabbarstyle,
                  ),
                ),
                Tab(
                  child: Text(
                    'Bookings',
                    style: StyleElements.tabbarstyle,
                  ),
                ),
              ],
            ),
            child: _rightSideWidget(context, isOffline),
          ),
        ),
        drawer: const Drawer(
          child: DrawerWidget(),
        ),
        body: TabBarView(
          children: [
            _programs(context),
            // _homePageBody(context, state),
            const Padding(padding: EdgeInsets.all(12.0), child: Text("")
                // _bookingView(context, state),
                )
          ],
        ),
      ),
    );
  }

  Widget _programs(
    BuildContext context,
  ) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return context.read<MainBloc>().programListModel == null
            ? const SizedBox.shrink()
            : context.read<MainBloc>().programListModel!.data == null
                ? const SizedBox.shrink()
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0, right: 5),
                          child: SizedBox(
                            // height: Helper.height(context) / 6,
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      // maxCrossAxisExtent: 200,
                                      crossAxisSpacing: 10,
                                      childAspectRatio: 0.8,
                                      mainAxisSpacing: 8),
                              itemCount: context
                                  .read<MainBloc>()
                                  .programListModel!
                                  .data!
                                  .length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: InkWell(
                                    onTap: () {},
                                    child: SizedBox(
                                      // height: Helper.height(context) / 2,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: Helper.width(context) / 1.1,
                                            height:
                                                Helper.height(context) / 4.9,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                              child: context
                                                          .read<MainBloc>()
                                                          .programListModel!
                                                          .data![index]
                                                          .frontImage !=
                                                      null
                                                  ?

                                                  // Image.network(
                                                  //     ServerHelper.imageIp +
                                                  //         context
                                                  //             .read<MainBloc>()
                                                  //             .programListModel!
                                                  //             .data![index]
                                                  //             .coverImage
                                                  //             .toString(),
                                                  //   )

                                                  CachedNetworkImage(
                                                      fadeInCurve: Curves.ease,
                                                      fadeInDuration:
                                                          const Duration(
                                                              milliseconds: 0),
                                                      fit: BoxFit.cover,
                                                      filterQuality:
                                                          FilterQuality.low,
                                                      memCacheHeight: 450,
                                                      progressIndicatorBuilder:
                                                          (context, url,
                                                              progress) {
                                                        return Shimmer
                                                            .fromColors(
                                                          baseColor:
                                                              Colors.grey[200]!,
                                                          highlightColor:
                                                              Colors.white,
                                                          child: Container(
                                                            color: Colors.white,
                                                          ),
                                                        );
                                                      },
                                                      imageUrl: ServerHelper
                                                              .imageIp +
                                                          context
                                                              .read<MainBloc>()
                                                              .programListModel!
                                                              .data![index]
                                                              .frontImage
                                                              .toString(),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Image.asset(
                                                        'lib/assets/images/noimag.png',
                                                      ),
                                                    )
                                                  // CachedNetworkImage(
                                                  //     imageUrl: ServerHelper.imageIp +
                                                  //         context
                                                  //             .read<MainBloc>()
                                                  //             .programListModel!
                                                  //             .data![index]
                                                  //             .coverImage
                                                  //             .toString(),
                                                  //     placeholder: (context, url) =>
                                                  //         const Center(
                                                  //       child: SizedBox(
                                                  //           width: 40,
                                                  //           height: 40,
                                                  //           child:
                                                  //               CircularProgressIndicator(
                                                  //             color: Colors.white,
                                                  //             strokeWidth: 4,
                                                  //           )),
                                                  //     ),
                                                  //     errorWidget:
                                                  //         (context, url, error) =>
                                                  //             const Center(
                                                  //       child: SizedBox(
                                                  //         width: 20,
                                                  //         height: 20,
                                                  //         child: Icon(Icons.error),
                                                  //       ),
                                                  //     ),
                                                  //     fit: BoxFit.cover,
                                                  //   )
                                                  : const Center(
                                                      child: Text(
                                                          "No Preview Available"),
                                                    ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width:
                                                    Helper.width(context) / 2.4,
                                                child: Text(
                                                  context
                                                      .read<MainBloc>()
                                                      .programListModel!
                                                      .data![index]
                                                      .progName
                                                      .toString(),
                                                  maxLines: 1,
                                                  style:
                                                      StyleElements.gridSubHead,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          Row(
                                            children: [
                                              context
                                                          .read<MainBloc>()
                                                          .programListModel!
                                                          .data![index]
                                                          .started ==
                                                      true
                                                  ? Text('Booking Available',
                                                      style: StyleElements
                                                          .gridBAvailable)
                                                  : Text('Booking Closed',
                                                      style: StyleElements
                                                          .gridBNotAvailable),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
      },
    );
  }

  _rightSideWidget(context, bool? isOffline) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => QrScanner(
        //       isOffline: isOffline,
        //     ),
        //   ),
        // );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Icon(Icons.qr_code, color: Colors.white, size: 20),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 16),
            child: Text(
              ('Scan Online Booking'),
              style: StyleElements.tabbarstyle,
            ),
          ),
        ],
      ),
    );
  }
}

class TabBarWrapper extends StatelessWidget implements PreferredSize {
  final PreferredSizeWidget tabBar;
  @override
  final Widget child;
  const TabBarWrapper({required this.tabBar, required this.child, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IntrinsicWidth(child: tabBar),
        Expanded(child: child),
      ],
    );
  }

  @override
  Size get preferredSize => tabBar.preferredSize;
}
