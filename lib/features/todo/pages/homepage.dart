import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:task_managment_with_riverpod/common/utils/constants.dart';
import 'package:task_managment_with_riverpod/common/widgets/appstyle.dart';
import 'package:task_managment_with_riverpod/common/widgets/custom_text_field.dart';
import 'package:task_managment_with_riverpod/common/widgets/expansion_tile.dart';
import 'package:task_managment_with_riverpod/common/widgets/reusabletext.dart';
import 'package:task_managment_with_riverpod/common/widgets/width_spacer.dart';
import 'package:task_managment_with_riverpod/features/todo/controller/expansion_provider.dart';
import 'package:task_managment_with_riverpod/features/todo/widgets/todo_tile.dart';

import '../../../common/widgets/height_spacer.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> with TickerProviderStateMixin {
  final searchController = TextEditingController();
  late final TabController tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(85),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(text: "Dashboard", style: appStyle(18, AppConst.kLight, FontWeight.bold)),
                    Container(
                      width: 25.w,
                      height: 25.w,
                      decoration: BoxDecoration(color: AppConst.kLight, borderRadius: BorderRadius.all(Radius.circular(9))),
                      child: GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.add,
                          color: AppConst.kBkDark,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              HeightSpacer(height: 20),
              CustomTextField(
                hintText: "Search",
                controller: searchController,
                prefixIcon: Container(
                  padding: EdgeInsets.all(14.h),
                  child: GestureDetector(
                    onTap: null,
                    child: Icon(
                      AntDesign.search1,
                      color: AppConst.kGreyLight,
                    ),
                  ),
                ),
                suffixIcon: Icon(
                  FontAwesome.sliders,
                  color: AppConst.kGreyLight,
                ),
              ),
              HeightSpacer(height: 15),
              Container()
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            HeightSpacer(height: 25),
            Row(
              children: [
                Icon(
                  FontAwesome.tasks,
                  size: 20,
                  color: AppConst.kLight,
                ),
                WidthSpacer(width: 10.0),
                ReusableText(text: "Today's task", style: appStyle(18, AppConst.kLight, FontWeight.bold))
              ],
            ),
            HeightSpacer(height: 25),
            Container(
              decoration:
                  BoxDecoration(color: AppConst.kLight, borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius))),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicator:
                    BoxDecoration(color: AppConst.kGreyLight, borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius))),
                controller: tabController,
                labelPadding: EdgeInsets.zero,
                labelColor: AppConst.kBlueLight,
                labelStyle: appStyle(24, AppConst.kBlueLight, FontWeight.w700),
                unselectedLabelColor: AppConst.kLight,
                isScrollable: false,
                tabs: [
                  Tab(
                    child: SizedBox(
                      width: AppConst.kWidth * 0.5,
                      child: Center(
                        child: ReusableText(text: "Pending", style: appStyle(16, AppConst.kBkDark, FontWeight.bold)),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: EdgeInsets.only(left: 30.w),
                      width: AppConst.kWidth * 0.5,
                      child: Center(
                        child: ReusableText(text: "Complete", style: appStyle(16, AppConst.kBkDark, FontWeight.bold)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            HeightSpacer(height: 20),
            SizedBox(
              height: AppConst.kHeight * 0.3,
              width: AppConst.kWidth,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius)),
                child: TabBarView(controller: tabController, children: [
                  Container(
                    color: AppConst.kBkLight,
                    height: AppConst.kHeight * 0.3,
                    child: ListView(
                      children: [
                        TodoTile(
                          start: "03:00",
                          end: "05:00",
                          switcher: Switch(
                            value: true,
                            onChanged: (value) {},
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: AppConst.kBkLight,
                    height: AppConst.kHeight * 0.3,
                  )
                ]),
              ),
            ),
            HeightSpacer(height: 20),
            ExpansionTileWidget(
              text: "Tomorrow's Task",
              text2: "Day after tomorrow task",
              onExpansionChanged: (bool expanded) {
                ref.read(expansionStateProvider.notifier).setStart(!expanded);
              },
              trailing: Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: ref.watch(expansionStateProvider)
                    ? Icon(
                        AntDesign.circledown ,
                        color: AppConst.kLight,
                      )
                    : Icon(
                        AntDesign.closecircleo,
                        color: AppConst.kBlueLight,
                      ),
              ),
              children: [
                TodoTile(
                  start: "03:00",
                  end: "05:00",
                  switcher: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                )
              ],
            ),
            HeightSpacer(height: 20),
            ExpansionTileWidget(
                text: DateTime.now().add(Duration(days: 2)).toString().substring(5, 10),
                text2: "Tomorrow's tasks are shown here",
                onExpansionChanged: (bool expanded) {
                  ref.read(expansionState0Provider.notifier).setStart(!expanded);
                },
                trailing: Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: ref.watch(expansionState0Provider)
                      ? Icon(
                    AntDesign.circledown ,
                    color: AppConst.kLight,
                  )
                      : Icon(
                    AntDesign.closecircleo,
                    color: AppConst.kBlueLight,
                  ),
                ),
              children: [
                TodoTile(
                  start: "03:00",
                  end: "05:00",
                  switcher: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                )
              ]),
          ],
        ),
      )),
    );
  }
}
