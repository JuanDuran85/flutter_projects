import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:transparent_image/transparent_image.dart';
import 'package:meals/models/model.dart';

class MealItem extends StatelessWidget {
  final MealModel meal;

  const MealItem({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            // first the button
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 44),
                child: Column(children: [
                  Text(
                    meal.title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis, // add ... at the end
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,),
                  ),
                  const SizedBox(height: 22),
                  const Row(
                    children: [],
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
