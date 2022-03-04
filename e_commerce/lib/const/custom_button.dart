import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final BorderRadius? radius;
  final Function function;
  final double buttonWidth;
  
  const CustomButton({Key? key, 
  required this.text, 
  this.radius, 
  required this.function, 
  required this.buttonWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {  
    final Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () => function(),
      child: Material(
        elevation: 5,
        borderRadius: radius ?? BorderRadius.circular(20),
        color: const Color.fromRGBO(30, 62, 60, 1),
        child: SizedBox(
          height: size.height / 17,
          width: size.width / buttonWidth,
          child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            
            style: TextStyle(
              color: Colors.white,
              fontSize: size.width / 22,
              fontWeight: FontWeight.w500,
            ),
            ),
            ),
        ),
      ),
      );

    
  }
}
