class MyService {
    MyService({
        required this.banner,
        required this.benefits,
        required this.fun,
        required this.img,
        required this.name,
        required this.plans,
        required this.price,
        required this.desc,
    });

    final String banner;
    final List<String> benefits;
    final String fun;
    final String img;
    final String name;
    final List<Plan> plans;
    final String price;
    final String desc;

    factory MyService.fromJson(Map<dynamic, dynamic> json){ 
        return MyService(
            banner: json["Banner"],
            benefits: json["Benefits"] == null ? [] : List<String>.from(json["Benefits"]!.map((x) => x)),
            fun: json["Fun"],
            img: json["Img"],
            name: json["Name"],
            plans: json["Plans"] == null ? [] : List<Plan>.from(json["Plans"]!.map((x) => Plan.fromJson(x))),
            price: json["Price"],
            desc: json["desc"],
        );
    }

    Map<String, dynamic> toJson() => {
        "Banner": banner,
        "Benefits": benefits.map((x) => x).toList(),
        "Fun": fun,
        "Img": img,
        "Name": name,
        "Plans": plans.map((x) => x.toJson()).toList(),
        "Price": price,
        "desc": desc,
    };

    @override
    String toString(){
        return "$banner, $benefits, $fun, $img, $name, $plans, $price, $desc, ";
    }
}

class Plan {
    Plan({
        required this.benefits,
        required this.icon,
        required this.name,
        required this.price,
    });

    final List<String> benefits;
    final int? icon;
    final String name;
    final List<Price> price;

    factory Plan.fromJson(Map<dynamic, dynamic> json){ 
        return Plan(
            benefits: json["Benefits"] == null ? [] : List<String>.from(json["Benefits"]!.map((x) => x)),
            icon: json["Icon"],
            name: json["Name"],
            //price: []
            price: json["Price"] == null ? [] : List<Price>.from(json["Price"]!.map((x) => Price.fromJson(x))),
        );
    }

    Map<String, dynamic> toJson() => {
        "Benefits": benefits.map((x) => x).toList(),
        "Icon": icon,
        "Name": name,
        "Price": price.map((x) => x.toJson()).toList(),
    };

    @override
    String toString(){
        return "$benefits, $icon, $name, $price, ";
    }
}

class Price {
    Price({
        required this.hours,
        required this.off,
        required this.plan,
        required this.price,
    });

    final int? hours;
    final String? off;
    final String? plan;
    final int? price;

    factory Price.fromJson(Map<dynamic, dynamic> json){ 
        return Price(
            hours: json["Hours"],
            off: json["Off"],
            plan: json["Plan"],
            price: json["Price"],
        );
    }

    Map<String, dynamic> toJson() => {
        "Hours": hours,
        "Off": off,
        "Plan": plan,
        "Price": price,
    };

    @override
    String toString(){
        return "$hours, $off, $plan, $price, ";
    }
}
