import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard(this.index, {super.key});
  int index;
  final List<Color> color = [
    Color.fromARGB(255, 30, 147, 231),
    Color.fromARGB(255, 162, 46, 194),
    Color.fromARGB(255, 32, 187, 172),
    Color.fromARGB(255, 239, 75, 25),
    Color.fromARGB(255, 230, 46, 114),
  ];
  List<Color> opacityColor = [
    Color.fromARGB(255, 16, 111, 179),
    Color.fromARGB(255, 137, 34, 166),
    Color.fromARGB(255, 26, 160, 146),
    Color.fromARGB(255, 210, 58, 11),
    Color.fromARGB(255, 194, 35, 93),
  ];
  List description = [
    '24/7 Totally Uninformed Opinions: NFTs Web3 Games Waking Up-ish #TUO',
    'Doodles deepdive + NFT Flipping Masterclass + NFT Market Analysis',
    'Apple Watch Ultra review: an aspirational debut',
    'The Future of Crypto, SPACs, and Trump\'s legal Troubles',
    'Emotion AI, Social Robots, and Self-Driving Cars',
  ];
  List category =[
    'Gaming . Technology . NFTs',
    'Technology . NFTs',
    'Technology',
    'Technology . Crypto',
    'AI/ML . Technology . Cars',
  ];
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: _size.height * 0.45,
          width: _size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: color[index],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 10.0,
                  top: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '23 Sep at 9:30 PM',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz,color: Colors.white,),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 15.0,
                  bottom: 10.0,
                  top: 10.0,
                  right: 5.0,
                ),
                child: Text(
                  description[index],
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.0,
                    wordSpacing: 2.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10.0,
                  bottom: 5.0,
                ),
                child: Text(
                  category[index],
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 10.0,
                  bottom: 5.0,
                ),
                child: Text(
                  '67 listening',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: opacityColor[index],
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          top: 10.0,
                        ),
                        child: Row(
                          children: const [
                            Text(
                              'EMS',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'Speaker',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                backgroundColor:
                                    Color.fromARGB(98, 213, 210, 210),
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w200,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
