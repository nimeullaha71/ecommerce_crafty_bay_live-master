import 'package:ecommerce_crafty_bay_live/app/app_colors.dart';
import 'package:flutter/material.dart';

class IncDecButton extends StatefulWidget {
  const IncDecButton({super.key});

  @override
  State<IncDecButton> createState() => _IncDecButtonState();
}

class _IncDecButtonState extends State<IncDecButton> {

  int value = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIconButton(onTap: () {
          if(value<=1) return;
          value--;
          setState(() {});
        }, icon: Icons.remove),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text("$value",style: TextStyle(fontSize: 18),),
        ),
        _buildIconButton(onTap: () {
          if(value>=20)return;
          value++;
          setState(() {});
        }, icon: Icons.add),
      ],
    );
  }

  Widget _buildIconButton({required VoidCallback onTap, required IconData icon}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.themeColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(icon,color: Colors.white,),

        ),
    );
  }
}
