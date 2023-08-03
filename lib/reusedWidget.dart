import 'package:flutter/cupertino.dart';

class ReusedWidget extends StatelessWidget {
  ReusedWidget(this.ontap, this.colour, this.cardChild);
  final Color colour;
  final Widget cardChild;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
        child: cardChild,
      ),
    );
  }
}
