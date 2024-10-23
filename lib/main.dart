import 'package:card/card_details.dart';
import 'package:flutter/material.dart';  // Import Flutter material package for UI components.

void main() {
  runApp(CardDetailsApp());  // Start the app with CardDetailsApp.
}

class CardDetailsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // Hide the debug banner.
      home: CardFormPage(),  // Display the CardFormPage as the homepage.
    );
  }
}

class CardFormPage extends StatefulWidget {
  @override
  _CardFormPageState createState() => _CardFormPageState();
}

class _CardFormPageState extends State<CardFormPage> {
  final _formKey = GlobalKey<FormState>();  // To validate the form.
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
  final _cardHolderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         width: double.infinity,  // Ensure the container takes the full width.
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade400, Colors.purple.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                const Text(
                  "Enter your card details",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,  // Assign the form key.
                      child: Column(
                        children: [
                          _buildTextField(_cardNumberController, 'Card Number', 'XXXX XXXX XXXX XXXX',16),
                          _buildTextField(_expiryDateController, 'Expiry Date', 'MM/YY',5),
                          _buildTextField(_cvvController, 'CVV', 'XXX',3),
                          _buildTextField(_cardHolderController, 'Card Holder Name', 'eg: John Mathew',15),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Form is valid, navigate to the next page or show data.
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CardDetailsPage(
                                      cardNumber: _cardNumberController.text,
                                      expiryDate: _expiryDateController.text,
                                      cvv: _cvvController.text,
                                      cardHolder: _cardHolderController.text,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Text("Submit"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, String hint, int count) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        maxLength: count,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;  // Validation is successful.
        },
      ),
    );
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    _cardHolderController.dispose();
    super.dispose();
  }
}
