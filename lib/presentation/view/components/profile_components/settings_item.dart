
import 'package:flutter/material.dart';
import 'package:todos/main.dart';

class ProfileSettingsItem extends StatelessWidget {
  final IconData? icon;
  
  final String itemLabel;

  const ProfileSettingsItem({
    super.key,
    required this.icon,
    required this.itemLabel
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      height: 70,
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade800.withOpacity(0.5),),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade900,
                ),
                child: Icon(
                  icon,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                itemLabel,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Icon(
            Icons.navigate_next,
            size: 30,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
