import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lamie_pro/application/user_bloc/user_bloc.dart';
import 'package:lamie_pro/presentation/screens/login_screen.dart';
import 'package:lamie_pro/presentation/screens/signin_screen.dart';

showSnackbar(String? text, BuildContext context) {
  if (text == null) return;
  final snackBar = SnackBar(
    content: Text(text),
    backgroundColor: Colors.black,
  );
  ScaffoldMessenger.of(context).removeCurrentSnackBar();

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class ActionButtons extends StatelessWidget {
  const ActionButtons(
      {super.key,
      required this.colr,
      required this.string,
      required this.stringColor});

  final Color colr;
  final String string;
  final Color stringColor;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(20),
        color: colr,
      ),
      height: size.width * .16,
      width: size.height * .43,
      child: Center(
          child: Text(
        string,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: stringColor),
      )),
    );
  }
}

class GoogleSignUpButton extends StatelessWidget {
  GoogleSignUpButton({
    super.key,
  });
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog.adaptive(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            title: const Text("Enter email"),
            content: SizedBox(
              width: size.width * 0.3,
              height: size.height * 0.2,
              child: TextFormFeildSignin(
                controller: emailController,
                title: 'Email Id',
                hiniText: 'eg: johnsmith@gmail.com',
                emailValidation: true,
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close_rounded,
                    color: Colors.red,
                    size: 35,
                  )),
              IconButton(
                  onPressed: () {
                    {
                      if (emailController.text.isEmpty) {
                        showSnackbar('All fields are required', context);
                      } else {
                        if (RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(emailController.text)) {
                          Navigator.pop(context);
                        } else {
                          showSnackbar('Email format is incorrect', context);
                        }
                      }
                    }
                  },
                  icon: const Icon(
                    Icons.check_outlined,
                    color: Colors.green,
                    size: 35,
                  ))
            ],
          ),
        );
      },
      child: SizedBox(
          height: 30, width: 30, child: Image.asset("asset/icons/Google.png")),
    );
  }
}

class HaveAccount extends StatelessWidget {
  const HaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have account?'),
        InkWell(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          child: const Text(
            ' Login',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class TextFormFeildSignin extends StatefulWidget {
  TextFormFeildSignin(
      {super.key,
      required this.controller,
      this.trailIcon1,
      this.trailIcon2,
      this.hiniText,
      this.passwordVisibility = false,
      required this.title,
      this.isPasswordLength = false,
      this.emailValidation = false});
  final TextEditingController controller;
  final IconData? trailIcon1;
  final IconData? trailIcon2;
  bool passwordVisibility = false;
  final String? hiniText;
  final String title;
  bool emailValidation;
  bool isPasswordLength;
  @override
  State<TextFormFeildSignin> createState() => _TextFormFeildSigninState();
}

class _TextFormFeildSigninState extends State<TextFormFeildSignin> {
  late ValueNotifier<bool> visibilityNotifier =
      ValueNotifier(widget.passwordVisibility);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ValueListenableBuilder(
            valueListenable: visibilityNotifier,
            builder: (context, visible, child) {
              return TextFormField(
                  obscureText: visible,
                  cursorColor: Colors.black,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'required';
                    } else if (widget.emailValidation) {
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return "Enter Valid Email";
                      }
                    } else if (widget.isPasswordLength) {
                      if (value.length < 6) {
                        return 'Password must contains more than 6 letters';
                      }
                    }
                    return null;
                  },
                  controller: widget.controller,
                  decoration: InputDecoration(
                      labelText: widget.title,
                      labelStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      contentPadding: const EdgeInsets.all(0),
                      hintText: widget.hiniText,
                      hintStyle: const TextStyle(color: Colors.grey),
                      suffixIcon: widget.trailIcon1 != null
                          ? ValueListenableBuilder(
                              valueListenable: visibilityNotifier,
                              builder: (context, visibility, _) {
                                return IconButton(
                                    onPressed: () {
                                      visibilityNotifier.value =
                                          !visibilityNotifier.value;
                                    },
                                    icon: visibility
                                        ? Icon(
                                            widget.trailIcon1,
                                            color: Colors.grey,
                                          )
                                        : Icon(
                                            widget.trailIcon2,
                                            color: Colors.grey,
                                          ));
                              })
                          : null));
            }),
      ],
    );
  }
}

class BackNavigationButton extends StatelessWidget {
  const BackNavigationButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SignUpScreen(),
            ));
      },
      icon: const Icon(
        Icons.arrow_circle_left_rounded,
        size: 35,
        color: Colors.black,
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: searchcontroller,
      cursorColor: Colors.black,
      style: const TextStyle(color: Colors.black),
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.zero,
          prefixIcon: Icon(Icons.search),
          // filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          hintText: 'Search',
          hintStyle: TextStyle(fontSize: 15, height: 1.5, color: Colors.black)),
      onChanged: (value) {},
    );
  }
}

class UserListWidget extends StatelessWidget {
  const UserListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<UserBloc>(context).add(FetchUserDataEvent());
    });
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage("http://via.placeholder.com/350x150"),
          ),
          title: Text("user${index + 1}"),
          subtitle: Text("email${index + 1}"),
        );
      },
    );
  }
}
