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
                          fontWeight: FontWeight.bold),
                    ),
                  )
                : ListView.builder(
                    itemCount: ui.borrowers.length,
                    itemBuilder: (context, index) {
                      BorrowerInfo borrower = ui.borrowers[index];
                      return buildBorrowerCard(context, borrower);
                    },
                  ),
          ),
        );
      },
    );
  }

  Widget buildBorrowerCard(BuildContext context, BorrowerInfo borrower) {
    return SizedBox(
      width: 450.0,
      height: 200.0,
      child: Card(
        elevation: 5.0,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildInfoRow("Tên người mượn: ", borrower.borrowerName),
                  buildInfoRow("Số căn cước: ", borrower.borrowerIdCard),
                  buildInfoRow("Số điện thoại: ", borrower.borrowerPhone),
                  buildInfoRow("Mã sách: ", borrower.borrowerBookCode),
                ],
              ),
            ),
            Positioned(
              top: -8,
              right: -8,
              child: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.delete_rounded),
                  onPressed: () {
                    // Hiển thị hộp thoại xác nhận trước khi xóa
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Xác nhận xóa"),
                          content: const Text("Bạn có chắc muốn xóa người mượn này?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Đóng hộp thoại
                              },
                              child: const Text("Hủy"),
                            ),
                            TextButton(
                              onPressed: () {
                                // Xử lý xóa ở đây
                                Provider.of<UserInterface>(context, listen: false)
                                    .removeBorrower(borrower);
                                Navigator.of(context).pop(); // Đóng hộp thoại
                              },
                              child: const Text("Xóa"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value),
        ],
      ),
    );
  }
}
