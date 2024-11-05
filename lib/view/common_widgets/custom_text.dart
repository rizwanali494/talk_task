import 'package:flutter/material.dart';
import 'package:talk_task/utilis/app_text_styles.dart';


class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final double? height;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.height,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: AppTextStyles.poppins(
        fontSize: fontSize,
        color: color,
        weight: fontWeight,
      ),
    );
  }
}
