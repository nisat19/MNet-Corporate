import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mnet_corporate/common/fadeIn.dart';
import 'package:mnet_corporate/common/size_config.dart';
import 'package:mnet_corporate/constant/app_color.dart';
import 'package:mnet_corporate/constant/text_styles.dart';
import 'package:mnet_corporate/generated/l10n.dart';
import 'package:mnet_corporate/provider/noticeProvider.dart';
import 'package:mnet_corporate/views/shimmer/skeleton.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  bool _isLoading = false;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    _isLoading = true;
    final noticeData = Provider.of<NoticeProvider>(context, listen: false);
    noticeData.getNotices();
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        width: SizeConfig.screenWidth,
        padding: const EdgeInsets.all(8.0),
        child: RefreshIndicator(
          key: refreshKey,
          onRefresh: () async => _refreshData(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    S.of(context).recent_notices,
                    style: textTitle,
                  ),
                  Text(
                    S.of(context).archieves,
                    style: textSubTitle,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Consumer<NoticeProvider>(
                builder: (context, noticeProv, _) {
                  if (noticeProv.isRequestError) {
                    return Center(child: Text(S.of(context).error));
                  }
                  return _isLoading ||
                          noticeProv.isLoading ||
                          noticeProv.notices.isEmpty
                      ? AspectRatio(
                          aspectRatio: 2.8,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Skeleton(),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Skeleton(),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Skeleton(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Skeleton(
                                    width: 200,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : FadeIn(
                          curve: Curves.easeIn,
                          duration: const Duration(milliseconds: 250),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CarouselSlider(
                                options: CarouselOptions(
                                  autoPlay: true,
                                  aspectRatio: 2.8,
                                  viewportFraction: 1,
                                  enlargeCenterPage: true,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      currentIndex = index;
                                    });
                                  },
                                ),
                                items: noticeProv.notices
                                    .map((item) => SizedBox(
                                          width: SizeConfig.screenWidth,
                                          child: Card(
                                              child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  item.title,
                                                  maxLines: 3,
                                                  style: textBody,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  item.subTitle,
                                                  maxLines: 1,
                                                  style: textBodyBold,
                                                ),
                                              ],
                                            ),
                                          )),
                                        ))
                                    .toList(),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: noticeProv.notices
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  return Container(
                                    width: 9.0,
                                    height: 9.0,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 4.0, horizontal: 4.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: (Theme.of(context).brightness ==
                                                    Brightness.dark
                                                ? Colors.white
                                                : AppColor.primary)
                                            .withOpacity(
                                                currentIndex == entry.key
                                                    ? 0.9
                                                    : 0.4)),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                        );
                },
              ),
              const SizedBox(
                height: widgetVerticaGap,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  punchTime('09:53 AM', '26 March', PunchType.punchIn),
                  punchTime('04:48 PM', '26 March', PunchType.punchOut)
                ],
              ),
              const SizedBox(
                height: widgetVerticaGap,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    S.of(context).leave_status,
                    style: textTitle,
                  )
                ],
              ),
              const SizedBox(
                height: widgetVerticaGap,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    S.of(context).mtb_circulars,
                    style: textTitle,
                  ),
                  Text(
                    S.of(context).see_more,
                    style: textSubTitle,
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Future<void> _refreshData(BuildContext context) async {
    refreshKey.currentState?.show(atTop: false);
    await Provider.of<NoticeProvider>(context, listen: false)
        .getNotices(isRefresh: true);
  }

  Widget punchTime(String time, String date, PunchType type) {
    return SizedBox(
        width: SizeConfig.screenWidth / 2.1,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  time,
                  style: textLarge,
                ),
                Text(
                  date,
                  style: textFaded,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Divider(height: 1, color: Colors.grey.shade300),
                ),
                type == PunchType.punchIn
                    ? SizedBox(
                        height: 30,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  S.of(context).punch_in,
                                  style: textBody,
                                ),
                                const FaIcon(
                                  FontAwesomeIcons.solidCircleCheck,
                                  size: 12,
                                  color: AppColor.primary,
                                )
                              ],
                            )))
                    : Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 30,
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.primary,
                              ),
                              onPressed: () {},
                              child: Text(S.of(context).punch_out,
                                  style: const TextStyle(fontSize: 12))),
                        ),
                      )
              ],
            ),
          ),
        ));
  }
}

enum PunchType { punchIn, punchOut }
