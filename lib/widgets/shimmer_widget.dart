import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:shopping_app_assignment/constants.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView.builder(
      itemBuilder: ((context, index) {
        return Column(
          children: [
            Shimmer(
              duration: const Duration(seconds: 3), //Default value
              interval: const Duration(
                  milliseconds: 100), //Default value: Duration(seconds: 0)
              color: Colors.black, //Default value
              colorOpacity: 0.2, //Default value
              enabled: true, //Default value
              direction: const ShimmerDirection.fromLTRB(), //Default Value
              child: Container(
                decoration: kshimmerBoxDecoration,
                height: MediaQuery.of(context).size.height / 5,
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        );
      }),
    ));
  }
}
