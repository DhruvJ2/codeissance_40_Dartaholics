import 'package:dartaholics/models/speakers.dart';
import 'package:dartaholics/widgets/item_widgets.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class EventsDetail extends StatelessWidget {
  const EventsDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.purple500,
      body: Stack(
        children: [
          Column(children: [
            Image.network(
              "https://www.yujdesigns.com/wp-content/uploads/2022/03/ux_meetup_with_design_community.jpg",
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                width: context.screenWidth,
                color: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Remote Design Week"
                          .text
                          .xl2
                          .blue500
                          .extraBold
                          .make()
                          .pOnly(left: 10),
                      20.heightBox,
                      VxBox(
                          child: Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: Color.fromARGB(255, 245, 97, 146),
                            size: 25,
                          ),
                          5.widthBox,
                          Text(
                            "The Concert Hall",
                            style: TextStyle(color: Colors.grey),
                          ),
                          100.widthBox,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.calendar_month),
                              5.widthBox,
                              Text(
                                "6:00 PM",
                                style: TextStyle(color: Colors.grey),
                              ).pOnly(bottom: 3)
                            ],
                          ),
                        ],
                      )).white.make().pOnly(left: 10),
                      35.heightBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Additional Information"
                              .text
                              .xl
                              .bold
                              .make()
                              .pOnly(left: 10),
                          10.heightBox,
                          "This is a great oppurtunity to meet designers,\ndevelopers,directors, and students who are\nbuilding and developing the exciting field that is UX."
                              .text
                              .xl
                              .make()
                              .pOnly(left: 10),
                          30.heightBox,
                          "Speakers".text.xl.bold.make().pOnly(left: 10),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: context.screenWidth,
                              height: 200,
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: CatalogModel.items.length,
                                itemBuilder: (context, index) {
                                  return ItemWidget(
                                      item: CatalogModel.items[index]);
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: 120,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Buy Tickets",
                                style: TextStyle(fontSize: 15),
                              ),
                              style: TextButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 167, 60, 113)),
                            ),
                          ).pOnly(left: 125, bottom: 11)
                        ],
                      )
                    ]).py20(),
              ),
            ),
          ]),
          Positioned(
            top: 191,
            left: 280,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 167, 60, 113),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "22",
                        style: (TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                      ),
                      Text("November",
                          style: (TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)))
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
