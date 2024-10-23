import 'package:flutter/material.dart';

class CardDetailsPage extends StatelessWidget {
  final String cardNumber;
  final String expiryDate;
  final String cvv;
  final String cardHolder;

  CardDetailsPage({
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
    required this.cardHolder,
  });

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Card Details'),
    ),
    body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade400, Colors.purple.shade300],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Card(
          margin: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 12,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              shrinkWrap: true, // Ensure the ListView only takes the needed space
              children: [
                Text(
                  'Card Number: $cardNumber',
                  style:const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  'Expiry Date: $expiryDate',
                  style:const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  'CVV: $cvv',
                  style:const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  'Card Holder: $cardHolder',
                  style:const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),               
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
}