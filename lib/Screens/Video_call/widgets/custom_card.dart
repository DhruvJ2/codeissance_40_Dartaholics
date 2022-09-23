import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

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
            color: const Color.fromARGB(255, 175, 59, 59),
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
                      icon: const Icon(Icons.more_horiz),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  bottom: 10.0,
                  top: 10.0,
                  right: 5.0,
                ),
                child: Text(
                  '24/7 Totally Uninformed Opinions: NFTs Web3 Games Waking Up-ish #TUO',
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
              const Padding(
                padding: EdgeInsets.only(
                  left: 10.0,
                  bottom: 5.0,
                ),
                child: Text(
                  'Gaming . Technology . NFTs',
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
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 136, 37, 37),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text(
                            'EMS',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 10.0,),
                          Text(
                            'Speaker',
                            textAlign: TextAlign.center,
                            
                            style: TextStyle(
                              backgroundColor:Color.fromARGB(98, 213, 210, 210),                                color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w200,
                            ),
                          )
                        ],
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
