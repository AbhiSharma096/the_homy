import 'package:the_homy/model/price.dart';

class Plan {
  final Map<String, String> Benefits;
  final int Icon;
  final String Name;
  final Prices Price;

  Plan({
    required this.Benefits,
    required this.Icon,
    required this.Name,
    required this.Price,
  });

  
}

class Prices {
  final Map<String, dynamic> prices;

  Prices(this.prices);

  
}