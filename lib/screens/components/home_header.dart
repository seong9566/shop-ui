import 'package:custom_shop/constants.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: headerHeight,
      padding: EdgeInsets.all(defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text("Good Morning!",
                  style: Theme.of(context).textTheme.bodySmall),
              Text(
                "Caesar Rincon",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.black54),
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage("assets/images/profile.png"),
          )
        ],
      ),
    );
  }
}
