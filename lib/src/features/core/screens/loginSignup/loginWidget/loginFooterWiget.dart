import 'package:flutter/material.dart';

import '../../../../../../main.dart';
import '../../../../../constants/constants.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('OR', style: Theme.of(context).textTheme.headline4),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyAppGoogle())),
              icon: const Image(
                image: AssetImage(tGoogleLogoImage),
                width: 25.0,
              ),
              label: Text(
                'Sign-In with Google',
                style: Theme.of(context).textTheme.subtitle2,
              )),
        ),
        const SizedBox(height: 5),
        TextButton(
          onPressed: () {},
          child: Text.rich(
            TextSpan(
                text: 'Don\'t have an Account?',
                style: Theme.of(context).textTheme.bodyText1,
                children: const [
                  TextSpan(
                      text: ' Signup', style: TextStyle(color: kVertclair)),
                ]),
          ),
        ),
      ],
    );
  }
}
