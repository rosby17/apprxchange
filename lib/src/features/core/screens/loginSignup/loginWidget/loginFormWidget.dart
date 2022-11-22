import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rx_change_3/src/features/core/screens/screen.dart';

import '../../dashboard/signInPageGoogle.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: 'Email',
                hintText: 'Email',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.remove_red_eye_sharp,
                    ),
                  )),
            ),
            // const SizedBox(height: 10),
            Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ForgotPassword())),
                  child: const Text('Forget password?'),
                )),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    provider.googleLogin();
                  },
                  child: Text(
                    'Login'.toUpperCase(),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
