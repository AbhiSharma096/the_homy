class TransactionDetail {
  final String serviceName;
  final String selectedPlan;
  final int peopleCount;
  final DateTime? selectedDate;
  final Map<dynamic, String> selectedTimes;

  TransactionDetail({
    required this.serviceName,
    required this.selectedPlan,
    required this.peopleCount,
    required this.selectedDate,
    required this.selectedTimes,
  });
}

enum Package { Morning, Noon, Evening }
