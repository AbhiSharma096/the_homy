class Service {
  final String serviceId;
  final String banner;
  final Map<String, String> benefits;
  final int img;
  final String price;
  final Map<String, Plan> plans;

  Service({
    required this.serviceId,
    required this.banner,
    required this.benefits,
    required this.img,
    required this.price,
    required this.plans,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    Map<String, Plan> plans = {};
    if (json['plans'] != null) {
      json['plans'].forEach((key, value) {
        plans[key] = Plan.fromJson(value);
      });
    }
    return Service(
      serviceId: json['serviceId'],
      banner: json['banner'],
      benefits: (json['benefits'] ?? {}) as Map<String, String>,
      img: json['img'],
      price: json['price'],
      plans: plans,
    );
  }
}

class Plan {
  final String planId;
  final String plan;
  final Map<String, String> benefits;
  final Map<String, Map<String, String>> price;

  Plan({
    required this.planId,
    required this.plan,
    required this.benefits,
    required this.price,
  });

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      planId: json['planId'],
      plan: json['plan'],
      benefits: (json['benefits'] ?? {}) as Map<String, String>,
      price: (json['price'] ?? {}) as Map<String, Map<String, String>>,
    );
  }
}
