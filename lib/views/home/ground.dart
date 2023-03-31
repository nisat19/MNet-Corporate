import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mnet_corporate/common/app_helper.dart';
import 'package:mnet_corporate/common/size_config.dart';
import 'package:mnet_corporate/constant/app_color.dart';
import 'package:mnet_corporate/constant/app_constant.dart';
import 'package:mnet_corporate/constant/common_widget.dart';
import 'package:mnet_corporate/constant/text_styles.dart';
import 'package:mnet_corporate/generated/l10n.dart';
import 'package:badges/badges.dart' as badges;

class Ground extends StatefulWidget {
  const Ground({super.key});

  @override
  State<Ground> createState() => _GroundState();
}

class _GroundState extends State<Ground> {
  String userName = 'Imtiaz Hossain';
  String userProfile =
      'https://img.freepik.com/premium-vector/cute-boy-stand-cartoon_435121-82.jpg';
  int _selectedIndex = 0; //New

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
            ),
            automaticallyImplyLeading: false,
            backgroundColor: AppColor.primary,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 25.0,
                  backgroundColor: AppColor.primary,
                  child: buildImage(
                      userProfile,
                      AppHelper.getProportionateScreenHeight(60),
                      Colors.grey.shade300,
                      2,
                      () {}),
                ),
                const SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).welcome,
                      style: appBarSubTitle,
                    ),
                    Text(
                      userName,
                      style: appBarTitle,
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              InkWell(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.only(right: 8, top: 16),
                  child: badges.Badge(
                    badgeContent: Text(
                      '3',
                      style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    badgeStyle: badges.BadgeStyle(
                      shape: badges.BadgeShape.circle,
                      badgeColor: AppColor.primary,
                              borderSide: BorderSide(color: Colors.white, width: 1),
                      elevation: 0,
                    ),
                    child: FaIcon(FontAwesomeIcons.bell),
                  ),
                ),
              ),
              Builder(builder: (context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                  icon: const FaIcon(FontAwesomeIcons.bars),
                );
              })
            ],
          ),
          drawer: Drawer(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).title,
                            style: textTitle,
                          ),
                          Text(
                            S.of(context).version,
                            style: textSubTitle,
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            size: 22,
                          ))
                    ],
                  ),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      menuItems(S.of(context).profile, 1),
                      menuItems(S.of(context).inbox, 2),
                      menuItems(S.of(context).about, 3),
                      menuItems(S.of(context).notices, 4),
                      menuItems(S.of(context).circulars, 5),
                      menuItems(S.of(context).faq, 6),
                      menuItems(S.of(context).helpline, 7),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25.0,
                            backgroundColor: AppColor.primary,
                            child: buildImage(
                                userProfile,
                                AppHelper.getProportionateScreenHeight(60),
                                Colors.grey.shade300,
                                2,
                                () {}),
                          ),
                          const SizedBox(width: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                S.of(context).welcome,
                                style: textTitle,
                              ),
                              Text(
                                userName,
                                style: textSubTitle,
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/Login', (Route<dynamic> route) => false);
                          },
                          icon: const Icon(
                            Icons.logout,
                            color: AppColor.primary,
                            size: 20,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: Center(child: AppConstant.pages.elementAt(_selectedIndex)),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColor.primary,
            backgroundColor: Colors.white,
            elevation: 1,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.houseUser),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.folderOpen),
                label: 'CHO',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.searchengin),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.appStore),
                label: 'Apps',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.userTie),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex, //New
            onTap: _onItemTapped,
          )),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  menuItems(String title, int index) {
    return ListTile(
      trailing: const Icon(
        FontAwesomeIcons.arrowRight,
        color: Colors.amber,
        size: 14,
      ),
      title: Text(
        title,
        style: textTitle,
      ),
      onTap: () async {},
    );
  }
}
