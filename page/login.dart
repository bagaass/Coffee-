import 'package:flutter/material.dart';
import 'package:ukkkasir/page/home_page.dart';
import 'admin_home_page.dart';
import 'manager_home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selectedRole = 'Kasir'; // Default role

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header text
                  Text(
                    'Selamat datang',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[800],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Role selection dropdown
                  DropdownButtonFormField<String>(
                    value: selectedRole,
                    items: <String>['Kasir', 'Admin', 'Manager']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText: 'Pilih role',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 241, 236, 236),
                      border: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedRole = newValue!;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  // Login button
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 228, 222, 221),
                        padding:
                            EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        // Navigate to the corresponding home page based on the role
                        if (selectedRole == 'Kasir') {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        } else if (selectedRole == 'Admin') {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => AdminHomePage(
                                  
                            )),
                          );
                        } else if (selectedRole == 'Manager') {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => ManagerHomePage()),
                          );
                        }
                      },
                      child: Text(
                        'Masuk',
                        style: TextStyle(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 40, 37, 37),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
