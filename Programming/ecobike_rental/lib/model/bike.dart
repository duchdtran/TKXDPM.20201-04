abstract class Bike {
  static const SINGLE_BIKE = 1;
  static const DOUBLE_BIKE = 2;
  static const ELECTRIC_BIKE = 3;

  Bike({
    this.id,
    this.bikeName,
    this.description,
    this.size,
    this.images,
    this.costStartingRent,
    this.costHourlyRent,
    this.bikeType,
    this.licensePlates,
    this.deposits,
    this.isRented,
  });

  Bike.empty();

  int id;
  String bikeName;
  String description;
  double size;
  List<String> images;
  int costStartingRent;
  int costHourlyRent;
  int bikeType;
  String licensePlates;
  int deposits;
  bool isRented;
}
