import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_homy/component/color.dart'; // Adjust import as necessary
import 'package:the_homy/model/user.dart';
import 'package:the_homy/provider/auth_provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();
  final FocusNode _cityFocusNode = FocusNode();
  final FocusNode _pincodeFocusNode = FocusNode();
  final FocusNode _stateFocusNode = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _pincodeController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _addressController.dispose();
    
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    _addressFocusNode.dispose();
    _cityFocusNode.dispose();
    _pincodeFocusNode.dispose();
    _stateFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<AuthProvider>().isLoading;

    return Scaffold(
      backgroundColor: Colors.red.shade50,
      body: isLoading
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
                      const SizedBox(height: 16),
                      const SizedBox(height: 10),
                      // Name field
                      _buildTextFormField(
                        controller: _nameController,
                        hintText: 'Name',
                        focusNode: _nameFocusNode,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 14.0),
                      // Email field
                      _buildTextFormField(
                        controller: _emailController,
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        focusNode: _emailFocusNode,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 14.0),
                      
                      // Address field
                      _buildTextFormField(
                        controller: _addressController,
                        hintText: 'Address',
                        focusNode: _addressFocusNode,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 14.0),
                      // City and Pincode
                      Row(
                        children: [
                          Expanded(
                            child: _buildTextFormField(
                              controller: _cityController,
                              hintText: 'City',
                              focusNode: _cityFocusNode,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your city';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Expanded(
                            child: _buildTextFormField(
                              controller: _pincodeController,
                              hintText: 'Pincode',
                              focusNode: _pincodeFocusNode,
                              keyboardType: TextInputType.numberWithOptions(),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your pincode';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14.0),
                      // State field
                      _buildTextFormField(
                        controller: _stateController,
                        hintText: 'State',
                        focusNode: _stateFocusNode,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your state';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      // Submit button
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: primaryColor,
                        ),
                        width: MediaQuery.of(context).size.width * .9,
                        height: 55,
                        child: TextButton(
                          onPressed: isLoading ? null : () async {
                            if (_formKey.currentState!.validate()) {
                              MyUser user = MyUser(
                                userName: _nameController.text.trim(),
                                userEmail: _emailController.text.trim(),
                                userPhoneNumber: '+91${_phoneController.text.trim()}',
                                address: {
                                  'addressLine1': _addressController.text.trim(),
                                  'city': _cityController.text.trim(),
                                  'pincode': _pincodeController.text.trim(),
                                  'state': _stateController.text.trim(),
                                },
                              );
                              
                              final authProvider = Provider.of<AuthProvider>(context, listen: false);
                              //await authProvider.updateUserProfile(user);
                            }
                          },
                          child: isLoading
                              ? const CircularProgressIndicator(color: Colors.white)
                              : const Text(
                                  "Edit Profile",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    required FocusNode focusNode,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?) validator,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.red.shade400,
        keyboardType: keyboardType,
        focusNode: focusNode,
        validator: validator,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFFb2b7bf),
            fontSize: 18.0,
          ),
        ),
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
