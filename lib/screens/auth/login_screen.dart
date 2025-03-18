import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flightbookapp/core/utils/app_routes.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Hình nền du lịch
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login.jpg"), // Hình nền du lịch
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.airplanemode_active, size: 80, color: Colors.redAccent), // Icon máy bay
                  const SizedBox(height: 10),
                  Text(
                    "Welcome to TravelBox",
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Book your flight now!",
                    style: GoogleFonts.poppins(color: Colors.white70),
                  ),
                  const SizedBox(height: 30),

                  // Ô nhập email
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      hintText: "Email",
                      prefixIcon: Icon(Icons.email, color: Colors.redAccent),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Ô nhập mật khẩu
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock, color: Colors.redAccent),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Quên mật khẩu
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Nút đăng nhập
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.homeScreen);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Chuyển sang trang đăng ký
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?", style: GoogleFonts.poppins(color: Colors.white)),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.signupScreen);
                        },
                        child: Text("Sign Up", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.redAccent)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
