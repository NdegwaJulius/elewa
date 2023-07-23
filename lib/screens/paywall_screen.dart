

import 'package:flutter/material.dart';


import '../services/premium_service.dart';

class PaywallScreen extends StatelessWidget {
  void _upgradeToPremium() async {
    // Implement the logic for upgrading the user to premium membership
    // This might include payment processing and updating the user's premium status
    await PremiumService.setPremiumUser(true); // Assuming the user is upgraded to premium after a successful payment
    Navigator.pop; // Navigate back to the previous screen after upgrading to premium
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Premium Membership'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Upgrade to Premium Membership',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _upgradeToPremium,
              child: Text('Upgrade Now'),
            ),
          ],
        ),
      ),
    );
  }
}
