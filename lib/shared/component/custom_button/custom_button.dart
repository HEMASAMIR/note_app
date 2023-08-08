import 'package:flutter/material.dart';

class CutomButtom extends StatelessWidget {
  const CutomButtom(
      {super.key, required this.text, this.onTap, this.isLoading = false});
  final String? text;
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 45,
          decoration: const BoxDecoration(color: Color(0xff62fcd7)),
          child: Center(
            child: isLoading
                ? SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: const CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : Text(
                    text!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
          ),
        ));
  }
}
