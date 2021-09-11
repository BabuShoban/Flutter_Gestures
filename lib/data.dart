enum ObjectType { land, air }

class Object {
  final String imageUrl;
  final ObjectType type;

  Object({
    this.imageUrl,
    this.type,
  });
}

final allAnimals = [
  Object(
    type: ObjectType.land,
    imageUrl: 'images/iPhone8.png',
  ),
  Object(
    type: ObjectType.land,
    imageUrl: 'images/iPhone12.png',
  ),
  Object(
    type: ObjectType.land,
    imageUrl: 'images/samsung-galaxy-s10-plus.jpg',
  ),

  // Animal(
  //   type: AnimalType.air,
  //   imageUrl: 'assets/bird2.png',
  // ),
  // Animal(
  //   type: AnimalType.land,
  //   imageUrl: 'assets/animal2.png',
  // ),
  // Animal(
  //   type: AnimalType.air,
  //   imageUrl: 'assets/bird3.png',
  // ),
  // Animal(
  //   type: AnimalType.land,
  //   imageUrl: 'assets/animal3.png',
  // ),
];