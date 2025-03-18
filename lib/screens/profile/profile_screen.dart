import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileScreen(),
  ));
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Hồ sơ cá nhân', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 600),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Avatar + Tên + Thành viên
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey.shade300,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/tutu.jpg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Nguyễn Thị Cẩm Tú',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Thành viên VIP',
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                // Mã thành viên với Barcode
                Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/u22.png',
                                  width: 50,
                                  height: 50,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'ĐẶC QUYỀN',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios,
                                size: 18, color: Colors.grey),
                          ],
                        ),
                        Divider(color: Colors.grey.shade300, thickness: 1),
                        SizedBox(height: 8),
                        BarcodeWidget(
                          barcode: Barcode.code128(),
                          data: '9992348190631070',
                          drawText: false,
                          width: double.infinity,
                          height: 50,
                          color: Colors.black,
                        ),
                        SizedBox(height: 8),
                        Text(
                          '9992348190631070',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),

                // Danh sách menu chức năng
                GridView.count(
                  crossAxisCount: screenWidth > 400 ? 3 : 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(16),
                  children: [
                    _buildMenuItem(
                        context, Icons.flight_takeoff, 'Đặt vé', BookingPage()),
                    _buildMenuItem(
                        context, Icons.history, 'Lịch sử vé', HistoryPage()),
                    _buildMenuItem(
                        context, Icons.local_offer, 'Ưu đãi', OffersPage()),
                    _buildMenuItem(
                        context, Icons.card_giftcard, 'Quà tặng', GiftPage()),
                    _buildMenuItem(context, Icons.account_circle, 'Hồ sơ',
                        ProfileDetailsPage()),
                    _buildMenuItem(
                        context, Icons.settings, 'Cài đặt', SettingsPage()),
                    _buildMenuItem(
                        context, Icons.help_outline, 'Trợ giúp', HelpPage()),
                    _buildMenuItem(
                        context, Icons.phone, 'Liên hệ', ContactPage()),
                    _buildMenuItem(
                        context, Icons.exit_to_app, 'Đăng xuất', LogoutPage()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
      BuildContext context, IconData icon, String title, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade900,
            radius: 30,
            child: Icon(icon, size: 32, color: Colors.blueAccent),
          ),
          SizedBox(height: 8),
          Text(title, style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}

// Các trang chi tiết

class BookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildPage(context, 'Đặt vé');
  }
}

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildPage(context, 'Lịch sử vé');
  }
}

class OffersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildPage(context, 'Ưu đãi');
  }
}

class GiftPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildPage(context, 'Quà tặng');
  }
}

class ProfileDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildPage(context, 'Hồ sơ cá nhân');
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildPage(context, 'Cài đặt');
  }
}

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildPage(context, 'Trợ giúp');
  }
}

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildPage(context, 'Liên hệ');
  }
}

class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildPage(context, 'Đăng xuất');
  }
}

// Hàm tạo trang chung
Widget _buildPage(BuildContext context, String title) {
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
    ),
    body: Center(
      child: Text(title, style: TextStyle(fontSize: 24)),
    ),
  );
}
