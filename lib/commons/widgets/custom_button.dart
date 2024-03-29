import 'package:flutter/material.dart';
import 'package:utibu_health_app/commons/utils/colors.dart';


class CustomButton extends StatelessWidget {
  final VoidCallback ontap;
  final String text;
  const CustomButton({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 50,
        width: 250,
        decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(20),
            boxShadow: CustomboxShadow,
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
            )),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              fontSize: 24,
              color: ColorsContants.textColor3,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
