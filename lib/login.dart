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

  InputDecoration inputDecor(String label) {
    return InputDecoration(
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: Colors.white54,
          // width: 2,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.deepOrange,
          width: 2,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      labelText: label,
      labelStyle: const TextStyle(
        color: Colors.white54,
      ),
      floatingLabelStyle: TextStyle(
        color: Colors.orange[400],
      ),
      suffixIcon: label == 'Password'
          ? IconButton(
              icon: Icon(
                _isObscure ? Icons.visibility_off : Icons.visibility,
                color: Colors.orange,
              ),
              onPressed: () {
                setState(() => _isObscure = !_isObscure);
              },
            )
          : null,
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
          padding: const EdgeInsets.all(10),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            decoration: inputDecor('Username'),
          ),
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 360),
          padding: const EdgeInsets.all(10),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            obscureText: _isObscure,
            decoration: inputDecor('Password'),
          ),
        ),
      ],
    );
  }
}
