class Car {
  final String brand;
  final String model;
  final int mileage;

  Car({
    required this.brand,
    required this.model,
    required this.mileage,
  });

  Map<String, dynamic> toJson() => {
    'brand': brand,
    'model': model,
    'mileage': mileage,
  };

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      brand: json['brand'] as String,
      model: json['model'] as String,
      mileage: json['mileage'] as int,
    );
  }
}
