import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> with TickerProviderStateMixin {
  final pkImageUrl =
      "https://instagram.fbom8-1.fna.fbcdn.net/v/t51.2885-19/297723103_131991389535733_3394524039300739566_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fbom8-1.fna.fbcdn.net&_nc_cat=101&_nc_ohc=e3LSQuZ8lyAAX8FGPcZ&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AT_ZDsEcPwOtO8vlGp7kmdvC_2a67RMLBbiLtwmTPPVDdg&oe=6335B1F9&_nc_sid=8fd12b";

  final pic1 =
      "https://pbs.twimg.com/media/FKNlhKZUcAEd7FY?format=jpg&name=4096x4096";
  final pic2 =
      "https://images.unsplash.com/photo-1618401471353-b98afee0b2eb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=888&q=80";
  TabController? _tabController;

  double? anim = 1.0;
  double? anim2 = 1.0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);

    withAnimation(
      vsync: this,
      tween: Tween(begin: 1.0, end: 0.0),
      callBack: (double? animationVal, controllerVal) {
        anim = animationVal;
        setState(() {});
      },
    );

    withRepeatAnimation(
      vsync: this,
      isRepeatReversed: true,
      tween: Tween(begin: 2.0, end: 3.0),
      callBack: (double? animationVal, controllerVal) {
        anim2 = animationVal;
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final tabIndex = _tabController!.index;

    return Scaffold(
      backgroundColor: Vx.blue500,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: VStack([
          VxBox().size(20, 2).white.make(),
          5.heightBox,
          VxBox().size(28, 2).white.make(),
          5.heightBox,
          VxBox().size(15, 2).white.make(),
        ]).pOnly(left: 16, top: 16),
      ),
      body: VStack([
        VxBox(
                child: [
          VxBox()
              .square(100)
              .roundedFull
              .neumorphic(color: Vx.blue600, elevation: 30.0)
              .bgImage(DecorationImage(
                  image: NetworkImage(
                pkImageUrl,
              )))
              .make()
              .onTap(() {
            context.showLoading(
              msg: "Your message",
            );
          }),
          "Hi, "
              .richText
              .withTextSpanChildren(["Siddesh".textSpan.bold.make()])
              .white
              .xl2
              .make()
              .p8()
              .offset(offset: Offset(-300 * anim!, 0.0)),
          "App Developer,UI/UX".text.white.make(),
          VxTextField(
            borderType: VxTextFieldBorderType.none,
            borderRadius: 18,
            hint: "Search",
            fillColor: Vx.gray200.withOpacity(0.3),
            contentPaddingTop: 13,
            autofocus: false,
            prefixIcon: Icon(Icons.search_outlined, color: Colors.white),
          )
              .customTheme(
                  themeData: ThemeData(
                brightness: Brightness.dark,
              ))
              .cornerRadius(10)
              .p16()
        ].column())
            .makeCentered()
            .h32(context),
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: VxBox(
              child: VStack([
            TabBar(
              controller: _tabController,
              indicatorColor: Vx.black,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Vx.blue600,
              unselectedLabelColor: Vx.gray400,
              labelPadding: Vx.m16,
              tabs: [
                Icon(Icons.star, size: 10)
                    .scale(scaleValue: tabIndex == 0 ? anim2 : 3.00),
                Icon(Icons.pin_drop, size: 10)
                    .scale(scaleValue: tabIndex == 1 ? anim2 : 3.00),
                Icon(Icons.restaurant, size: 10)
                    .scale(scaleValue: tabIndex == 2 ? anim2 : 3.00),
                Icon(Icons.person, size: 10)
                    .scale(scaleValue: tabIndex == 3 ? anim2 : 3.00),
              ],
            ),
            TabBarView(
              controller: _tabController,
              children: ["1", "2"]
                  .map((e) => VStack([
                        "Badges Earned By You".text.gray600.xl2.bold.make(),
                        20.heightBox,
                        TravelCard(
                          imageUrl: pic1,
                          title: "Dart Expert",
                          subtitle: "Flutter Festival 2022",
                        ),
                        20.heightBox,
                        TravelCard(
                          imageUrl: pic2,
                          title: "Git Hacker",
                          subtitle: "Github Hacktober 2022",
                        )
                      ]).p16())
                  .toList(),
            ).expand()
          ])).white.make(),
        ).expand()
      ]),
    );
  }
}

class TravelCard extends StatelessWidget {
  final String? title, subtitle, imageUrl;

  const TravelCard({Key? key, this.title, this.subtitle, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HStack([
      Image.network(
        imageUrl!,
        fit: BoxFit.cover,
        width: 65,
        height: 65,
      ).cornerRadius(100),
      20.widthBox,
      VStack(
        [
          title!.text.semiBold.make(),
          3.heightBox,
          subtitle!.text.make().shimmer(),
          5.heightBox,
          [
            VxRating(
              size: 13,
              onRatingUpdate: (value) {},
            ),
            5.widthBox,
            "(100)".text.xs.gray600.make(),
          ].row()
        ],
        crossAlignment: CrossAxisAlignment.start,
      ).expand()
    ])
      ..backgroundColor(Vx.white);
  }
}
