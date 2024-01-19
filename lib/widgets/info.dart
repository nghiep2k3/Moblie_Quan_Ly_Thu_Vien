import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/models/user.dart';
import '../models/user_interface.dart';

class Info extends StatelessWidget {
  const Info({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserInterface>(
      builder: (context, ui, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Thông tin người mượn"),
            backgroundColor: ui.appBarColor,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ui.borrowers.isEmpty
                ? const Center(
                    child: Text(
                      'Không có dữ liệu.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: ui.borrowers.length,
                    itemBuilder: (context, index) {
                      BorrowerInfo borrower = ui.borrowers[index];
                      return buildBorrowerCard(context, borrower, ui.isDarkMode);
                    },
                  ),
          ),
        );
      },
    );
  }

  Widget buildBorrowerCard(BuildContext context, BorrowerInfo borrower, bool isDarkMode) {
    Color cardColor = isDarkMode ? Color.fromARGB(255, 0, 0, 0) : Colors.white;
    Color iconColor = isDarkMode ? Colors.white : Colors.black;
    Color textColor = isDarkMode ? Colors.white : Colors.black;

    return SizedBox(
      width: 450.0,
      height: 200.0,
      child: Card(
        elevation: 5.0,
        color: cardColor,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildInfoRow("Tên người mượn: ", borrower.borrowerName, textColor),
                  buildInfoRow("Số căn cước: ", borrower.borrowerIdCard, textColor),
                  buildInfoRow("Số điện thoại: ", borrower.borrowerPhone, textColor),
                  buildInfoRow("Mã sách: ", borrower.borrowerBookCode, textColor),
                ],
              ),
            ),
            Positioned(
              top: -8,
              right: -8,
              child: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.delete_rounded),
                  color: iconColor,
                  onPressed: () {
                    // Xử lý khi nhấn nút xóa
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(String label, String value, Color textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
