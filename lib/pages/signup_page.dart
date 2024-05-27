import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_homy/component/color.dart';
import 'package:the_homy/model/user.dart';
import 'package:the_homy/provider/auth_provider.dart';
import 'package:the_homy/utils/utils.dart';

class SignupPage extends StatefulWidget {
  final Function()? onTap;
  const SignupPage({super.key, this.onTap});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  bool checked = true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

    @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _pincodeController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void onChange() {
    setState(() {
      checked = !checked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      body: isLoading == true
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Image.asset(
                          'lib/assets/logo.png',
                          height: 62,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Center(
                        child: Text(
                          'Register Account',
                          style: TextStyle(fontSize: 42, fontFamily: 'Poppins'),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Name of the person
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 20.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          cursorColor: Colors.red.shade400,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Name';
                            }
                            return null;
                          },
                          controller: _nameController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Name",
                            hintStyle: TextStyle(
                              color: Color(0xFFb2b7bf),
                              fontSize: 18.0,
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      const SizedBox(height: 14.0),
                      // Email
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 20.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          cursorColor: Colors.red.shade400,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Email';
                            }
                            return null;
                          },
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: Color(0xFFb2b7bf),
                              fontSize: 18.0,
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      const SizedBox(height: 14.0),

                      // Phone Number
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 20.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const Text(
                              "+91",
                              style: TextStyle(
                                color: Color(0xFFb2b7bf),
                                fontSize: 18.0,
                              ),
                            ),
                            const SizedBox(
                                width:
                                    8), // Add some space between "+91" and the TextFormField
                            Expanded(
                              child: TextFormField(
                                maxLength: 10,
                                cursorColor: Colors.red.shade400,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Phone Number';
                                  }
                                  return null;
                                },
                                controller: _phoneController,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Phone Number",
                                  hintStyle: TextStyle(
                                    color: Color(0xFFb2b7bf),
                                    fontSize: 18.0,
                                  ),
                                ),
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 14.0),
                      // Address
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 20.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          cursorColor: Colors.red.shade400,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Address';
                            }
                            return null;
                          },
                          controller: _addressController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Address",
                            hintStyle: TextStyle(
                              color: Color(0xFFb2b7bf),
                              fontSize: 18.0,
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      // City and Pincode
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 10.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                cursorColor: Colors.red.shade400,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter City';
                                  }
                                  return null;
                                },
                                controller: _cityController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "City",
                                  hintStyle: TextStyle(
                                    color: Color(0xFFb2b7bf),
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 10.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                cursorColor: Colors.red.shade400,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Pincode';
                                  }
                                  return null;
                                },
                                controller: _pincodeController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Pincode",
                                  hintStyle: TextStyle(
                                    color: Color(0xFFb2b7bf),
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14.0),
                      // State
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 20.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          cursorColor: Colors.red.shade400,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Address';
                            }
                            return null;
                          },
                          controller: _stateController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "State",
                            hintStyle: TextStyle(
                              color: Color(0xFFb2b7bf),
                              fontSize: 18.0,
                            ),
                          ),
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      // checkbox

                      Row(
                        children: [
                          Checkbox(
                            fillColor: MaterialStateColor.resolveWith(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return Colors.red.shade400;
                                }
                                return Colors.transparent;
                              },
                            ),
                            value: checked,
                            onChanged: (bool? value) {
                              setState(() {
                                checked = !checked;
                              });
                            },
                          ),
                          const Expanded(
                            child: Wrap(
                              children: [
                                Text(
                                  'By continuing you accept our Privacy Policy and Terms of Use',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Button
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: primaryColor),
                        width: MediaQuery.of(context).size.width * .9,
                        height: 55,
                        child: TextButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                MyUser user = MyUser(
                                    userName: _nameController.text.trim(),
                                    userEmail: _emailController.text.trim(),
                                    userPhoneNumber:
                                        '+91${_phoneController.text.trim()}',
                                    address: {
                                      'addressLine1':
                                          _addressController.text.trim(),
                                      'city': _cityController.text.trim(),
                                      'pincode': _pincodeController.text.trim(),
                                      'state': _stateController.text.trim(),
                                    });
                                // If all fields are filled up, execute sendPhoneNo method
                                if (checked) {
                                  sendPhoneNo(user);
                                } else {
                                  showSnakBar(context,
                                      "Please accept our Privacy policy and terms of use.");
                                }
                              } else {
                                // If any field is not filled up, show error messages
                                // You can use the validator functions attached to each TextFormField
                              }
                            },
                            child: isLoading == true
                                ? const CircularProgressIndicator()
                                : const Text(
                                    "SIGN UP",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already have an account? '),
                            const SizedBox(
                              width: 12,
                            ),
                            GestureDetector(
                                onTap: widget.onTap,
                                child: Text(
                                  'Login',
                                  style: TextStyle(color: Colors.red.shade300),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  void sendPhoneNo(MyUser user) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = _phoneController.text.trim();
    ap.signInWithPhone(context, '+91$phoneNumber', user);
  }
}
