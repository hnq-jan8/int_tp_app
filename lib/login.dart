import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  switchObscure({required isObscure}) {
    setState(() {
      isObscure = !isObscure;
    });
  }

  bool _isObscure = true;

  Container signInContainer({label = 'Username'}) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 360,
        // maxHeight: 73,
      ),
      padding: const EdgeInsets.all(8),
      child: TextField(
        obscureText: label == 'Password' ? _isObscure : false,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        cursorColor: Colors.orange,
        textAlignVertical: const TextAlignVertical(y: 0.4),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black.withOpacity(0.2),
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelStyle: const TextStyle(
            color: Colors.white70,
          ),
          alignLabelWithHint: true,
          hintText: 'Nhập ${label.toLowerCase()}',
          hintStyle: const TextStyle(
            color: Colors.white38,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide.none,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white70,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          prefixIcon: Icon(
            label == 'Username'
                ? Icons.person_outline_rounded
                : Icons.lock_outline_rounded,
            color: Colors.white,
          ),
          suffixIcon: label == 'Password'
              ? IconButton(
                  icon: Icon(
                    !_isObscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.orange,
                  ),
                  onPressed: () {
                    setState(() => _isObscure = !_isObscure);
                  },
                )
              : null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          constraints: const BoxConstraints(maxWidth: 360),
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(bottom: 20, left: 25),
          child: const Text(
            'Chào mừng đến với ATKQ!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        signInContainer(),
        signInContainer(label: 'Password'),
      ],
    );
  }
}
