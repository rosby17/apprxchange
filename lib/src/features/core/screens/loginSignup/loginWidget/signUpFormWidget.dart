import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/signUpController.dart';

class SignForm extends StatelessWidget {
  const SignForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              // key
              controller: controller.name,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: 'name',
                hintText: 'name',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter name';
                } else {
                  return null;
                }
              },
              // onSaved: (value) {
              //   setState(() {
              //     name = value!;
              //   }
              // );
              // },
            ),
            const SizedBox(height: 10),
            TextFormField(
                controller: controller.username,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  labelText: 'username',
                  hintText: 'username',
                )),
            const SizedBox(height: 10),
            TextFormField(
                controller: controller.email,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  labelText: 'email',
                  hintText: 'email',
                )),
            const SizedBox(height: 10),
            TextFormField(
              controller: controller.password,
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
            const SizedBox(height: 10),
            TextFormField(
              controller: controller.confirmpassword,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'confirm Password',
                  hintText: 'confirm Password',
                  suffixIcon: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.remove_red_eye_sharp,
                    ),
                  )),
            ),
            // const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      SignUpController.instance.registerUser(
                          controller.email.text.trim(),
                          controller.password.text.trim());
                    }
                  },
                  child: Text(
                    'SignUp'.toUpperCase(),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
