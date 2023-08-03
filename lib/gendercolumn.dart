import 'package:flutter/cupertino.dart';

class GenderColumn extends StatelessWidget {
  final IconData gender;
  final String genderString;

  GenderColumn(this.gender, this.genderString);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          gender,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          genderString,
          style: const TextStyle(
            color: Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }
}
