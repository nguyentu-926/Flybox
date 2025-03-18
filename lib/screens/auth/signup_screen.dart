import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flightbookapp/core/utils/app_routes.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage("assets/images/login1.jpg"), // Hình nền máy bay
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
                  Icon(Icons.flight_takeoff,
                      size: 80,
                      color: Colors.redAccent), // Icon máy bay cất cánh
                  const SizedBox(height: 10),
                  Text(
                    "Register Now",
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Create your FlyBox account",
                    style: GoogleFonts.poppins(color: Colors.white70),
                  ),
                  const SizedBox(height: 30),

                  // Ô nhập họ tên
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      hintText: "Full Name",
                      prefixIcon: Icon(Icons.person, color: Colors.redAccent),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Ô nhập email
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      hintText: "Email",
                      prefixIcon: Icon(Icons.email, color: Colors.redAccent),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
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
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Nút đăng ký
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.homeScreen);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Chuyển sang trang đăng nhập
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",
                          style: GoogleFonts.poppins(color: Colors.white)),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.loginScreen);
                        },
                        child: Text("Login",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent)),
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
