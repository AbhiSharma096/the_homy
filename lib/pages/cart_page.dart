import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Add this import for date formatting
import 'package:the_homy/model/cart_item.dart';
import 'package:the_homy/model/services.dart';
import 'package:the_homy/pages/payment_page.dart';
import 'package:the_homy/utils/utils.dart';

enum Package { Morning, Noon, Evening }

class CartPage extends StatefulWidget {
  final MyService service;
  final int index;

  const CartPage({super.key, required this.service, required this.index});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final Set<Package> _selectedPackages = {};
  int people = 1;
  int totalPrice = 0;
  DateTime? selectedDate;
  int selectedPlanIndex = -1;
  String selectedPlan = 'select a Plan';

  final Map<String, String> _selectedTimes = {};

  void _handleSelectionChanged(Set<Package> selectedPackages) {
    setState(() {
      _selectedPackages.clear();
      _selectedPackages.addAll(selectedPackages);
    });
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _setprice() {
    if (selectedPlanIndex > -1) {
      setState(() {
        totalPrice =
            widget.service.plans[widget.index].price[selectedPlanIndex].price! *
                _selectedPackages.length;
      });
    }
  }

  void _onContinue() {
    TransactionDetail userSelection = TransactionDetail(
      serviceName: widget.service.name,
      selectedPlan: selectedPlan,
      peopleCount: people,
      selectedDate: selectedDate,
      selectedTimes: _selectedTimes,
    );
    if (userSelection.selectedTimes.isEmpty) {
      showSnakBar(context, 'Please select the shift');
    } else if (userSelection.selectedDate == null) {
      showSnakBar(context, 'Please select the date');
    } else if (userSelection.selectedPlan == 'select a Plan') {
      showSnakBar(context, 'Please select the Plan');
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentPage(details: userSelection),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(children: [
          Text(
            'Cart',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Caladea',
                fontSize: 30,
                color: Colors.red.shade400),
          ),
          const SizedBox(
            height: 6,
          ),
          Container(
            width: 150,
            height: 2,
            color: Colors.red,
          )
        ]),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 25,
                        height: 25,
                        child: Image.asset(
                          'lib/assets/kitchen_king.png',
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.service.name,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.red.shade400,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 3,
                  width: 160,
                  color: Colors.red,
                )
              ]),

              ////////////////////////////////////////////////////////////////////////////////

              PackageSelectionCard(
                  setPrice: _setprice,
                  onSelectionChanged: _handleSelectionChanged,
                  selectedTimes: _selectedTimes),

              ////////////////////////////////////////////////////////////////////////////////////////

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.red.shade50,
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(selectedPlan),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (_) {
                                  return SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 300,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          selectedPlanIndex == -1
                                              ? 'Please select a plan.'
                                              : widget
                                                  .service
                                                  .plans[widget.index]
                                                  .price[selectedPlanIndex]
                                                  .plan!,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Poppins',
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 180,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                itemCount: widget
                                                    .service
                                                    .plans[widget.index]
                                                    .price
                                                    .length,
                                                itemBuilder: (context, index) =>
                                                    _buildPlanOption(
                                                        index,
                                                        context,
                                                        widget
                                                            .service
                                                            .plans[widget.index]
                                                            .price[index]
                                                            .plan!)),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Cancel')),
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Ok'))
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                          child:
                              const Icon(Icons.arrow_drop_down_circle_outlined),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.red.shade50,
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total number of people'),
                          Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (people > 1) people--;
                                    });
                                  },
                                  child: const Icon(Icons.remove_circle)),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(people.toString()),
                              const SizedBox(
                                width: 8,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      people++;
                                    });
                                  },
                                  child: const Icon(Icons.add_circle))
                            ],
                          )
                        ]),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.red.shade50,
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Select a starting Date'),
                          Text(
                            selectedDate == null
                                ? 'No date selected'
                                : DateFormat('yyyy-MM-dd')
                                    .format(selectedDate!),
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Icon(Icons.calendar_today),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.red.shade50,
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Amount to be paid.'),
                          Text(
                            totalPrice.toString(),
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                          )
                        ]),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ElevatedButton(
                  onPressed: _onContinue,
                  child: const Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanOption(int index, BuildContext context, String plan) {
    return ListTile(
      title: Text(plan),
      onTap: () {
        setState(() {
          selectedPlan = plan;
          selectedPlanIndex = index;
          _setprice();
        });
        Navigator.pop(context);
      },
    );
  }
}

class PackageSelectionCard extends StatefulWidget {
  final void setPrice;
  final void Function(Set<Package>) onSelectionChanged;
  final Map<String, String> selectedTimes;

  const PackageSelectionCard({
    super.key,
    required this.onSelectionChanged,
    required this.selectedTimes,
    this.setPrice,
  });

  @override
  State<PackageSelectionCard> createState() => _PackageSelectionCardState();
}

class _PackageSelectionCardState extends State<PackageSelectionCard> {
  final Set<Package> _selectedPackages = {};

  void _onPackageSelected(Package package, String time) {
    setState(() {
      if (_selectedPackages.contains(package) && _selectedPackages.length > 1) {
        _selectedPackages.remove(package);
        widget.selectedTimes.remove(package.toString().split('.').last);
      } else {
        _selectedPackages.add(package);
        widget.selectedTimes[package.toString().split('.').last] = time;
      }
    });
    widget.setPrice;
    widget.onSelectionChanged(_selectedPackages);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            children: Package.values.map((Package package) {
              return Expanded(
                child: GestureDetector(
                  onTap: () => _onPackageSelected(
                      package,
                      widget.selectedTimes[package.toString()] ??
                          'select values'),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: _selectedPackages.contains(package)
                          ? Colors.red.shade100
                          : Colors.white,
                      border: Border.all(color: Colors.red.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Text(
                          package.toString().split('.').last,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DropdownButton<String>(
                          value: widget.selectedTimes[package.toString()],
                          onChanged: (String? newValue) {
                            _onPackageSelected(package, newValue!);
                          },
                          items: _dropdownValues[package]!
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  final Map<Package, List<String>> _dropdownValues = {
    Package.Morning: ['7am-8am', '8am-9am', '9am-10am'],
    Package.Noon: ['11am-12pm', '12pm-1pm', '1pm-2pm'],
    Package.Evening: ['5pm-6pm', '6pm-7pm', '7pm-8pm'],
  };
}

// void _showTimePicker(BuildContext context, Package package) {
//   showTimePicker(
//     context: context,
//     initialTime: TimeOfDay.now(),
//   ).then((TimeOfDay? picked) {
//     if (picked != null) {
//       String formattedTime = picked.format(context);
//       _onPackageSelected(package, formattedTime);
//     }
//   });
// }

class NextPage extends StatelessWidget {
  final TransactionDetail userSelection;

  const NextPage({super.key, required this.userSelection});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Service Name: ${userSelection.serviceName}'),
            Text('Selected Plan: ${userSelection.selectedPlan}'),
            Text('People Count: ${userSelection.peopleCount}'),
            Text('Selected Date: ${userSelection.selectedDate}'),
            Text('Selected Times: ${userSelection.selectedTimes}'),
          ],
        ),
      ),
    );
  }
}
