import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = '';
  String password = '';
  String otp = '';

  switchObscure({required isObscure}) {
    setState(() {
      isObscure = !isObscure;
    });
  }

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        welcomeUserSignIn(),
        signInContainer(),
        signInContainer(label: 'Password'),
        otpRequesting(),
        otpFields(),
        Container(
          constraints: const BoxConstraints(
            maxWidth: 337,
            maxHeight: 60,
          ),
          margin: const EdgeInsets.only(top: 50),
          child: ElevatedButton(
            onPressed: () => debugPrint(
              'Username: $username, Password: $password, OTP: $otp',
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.purple[700]),
              foregroundColor: MaterialStatePropertyAll(Colors.orange[400]),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            child: const Center(
              child: Text(
                'Đăng nhập',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Container welcomeUserSignIn() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 360),
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(bottom: 20, left: 25),
      child: const Text(
        'Chào mừng !',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }

  Container signInContainer({label = 'Username'}) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 360,
      ),
      padding: const EdgeInsets.all(8),
      child: TextField(
        obscureText: label == 'Password' ? _isObscure : false,
        onChanged: (value) =>
            label != 'Password' ? username = value : password = value,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        cursorColor: Colors.orange,
        textInputAction: label != 'Password' ? TextInputAction.next : null,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          height: 1.2,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black.withOpacity(0.2),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          // alignLabelWithHint: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.white60,
          ),
          alignLabelWithHint: true,
          hintText: 'Nhập ${label.toLowerCase()}',
          hintStyle: const TextStyle(
            color: Colors.white38,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
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

  Container otpRequesting() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 360),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 50, bottom: 15),
      child: Text(
        'Nhập mã OTP cơ bản',
        style: TextStyle(
          color: Colors.white.withOpacity(0.9),
          fontSize: 16,
        ),
      ),
    );
  }

  Row otpFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        otpField(isFirstField: true),
        otpField(),
        otpField(),
        otpField(),
        otpField(),
        otpField(isLastField: true),
      ],
    );
  }

  Container otpField({bool isFirstField = false, bool isLastField = false}) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 360 / 6.1,
        maxHeight: 76,
      ),
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (value) {
          isFirstField ? otp = value : otp += value;
          if (value.length == 1) {
            !isLastField ? FocusScope.of(context).nextFocus() : null;
          } else if (value.isEmpty) {
            !isFirstField ? FocusScope.of(context).previousFocus() : null;
          }
        },
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        cursorColor: Colors.orange,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.top,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black.withOpacity(0.2),
          labelStyle: const TextStyle(
            color: Colors.white60,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white70,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
