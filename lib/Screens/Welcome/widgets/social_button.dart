import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/google_sign_in.dart';

Widget signInWithText() {
  return Column(
    children: const <Widget>[
      Text(
        '- OR -',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 13.5,
          fontFamily: 'sourceSansPro',
        ),
      ),
      SizedBox(height: 14.0),
      Text(
        'Sign up with',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontFamily: 'sourceSansPro',
          fontSize: 18,
        ),
      ),
    ],
  );
}

Widget socialBtn(void Function() onTap, AssetImage image) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 60.0,
      width: 80.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(221, 44, 0, .5),
            offset: Offset(0, 2),
            blurRadius: 6.0,
          ),
        ],
        image: DecorationImage(
          image: image,
        ),
      ),
    ),
  );
}

Widget socialBtnRow(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 28.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        socialBtn(
          () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.googleLogin();
          },
          const AssetImage(
            'assets/images/google.png',
          ),
        ),
      ],
    ),
  );
}
