import 'data.dart';
import 'package:flutter/material.dart';

class DraggableWidget extends StatelessWidget {
  final Object object;

  const DraggableWidget({
    Key key,
    @required this.object,
  }) : super(key: key);

  static double size = 150;

  @override
  Widget build(BuildContext context) => Draggable<Object>(
    data: object,
    feedback: buildImage(),
    child: buildImage(),
    childWhenDragging: Container(height: size),
  );

  Widget buildImage() => Container(
    height: size,
    width: size,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(24),
      color: Colors.white,
    ),
    child: Image.asset(object.imageUrl),
  );
}