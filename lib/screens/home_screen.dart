import 'package:flutter/material.dart';
import '../widgets/atm_card.dart';
import '../widgets/transaction_item.dart';
import '../models/transaction.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      TransactionModel("Kedai Kopi", "-Rp 35.000", "Makanan"),
      TransactionModel("Berkendara", "-Rp 25.000", "Transport"),
      TransactionModel("Langganan Gym", "-Rp 150.000", "Kesehatan"),
      TransactionModel("Tiket Film", "-Rp 60.000", "Acara"),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F3FF),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "KEUANGAN",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "KATEGORI",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 95,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    MenuCircle(icon: Icons.health_and_safety, label: "Kesehatan"),
                    SizedBox(width: 18),
                    MenuCircle(icon: Icons.travel_explore, label: "Liburan"),
                    SizedBox(width: 18),
                    MenuCircle(icon: Icons.fastfood, label: "Makanan"),
                    SizedBox(width: 18),
                    MenuCircle(icon: Icons.event, label: "Acara"),
                    SizedBox(width: 18),
                    MenuCircle(icon: Icons.hotel, label: "Hotel"),
                    SizedBox(width: 18),
                    MenuCircle(icon: Icons.directions_car, label: "Transport"),
                    SizedBox(width: 18),
                    MenuCircle(icon: Icons.shopping_bag, label: "Belanja"),
                    SizedBox(width: 18),
                    MenuCircle(icon: Icons.school, label: "Pendidikan"),
                    SizedBox(width: 18),
                    MenuCircle(icon: Icons.sports_esports, label: "Game"),
                    SizedBox(width: 18),
                    MenuCircle(icon: Icons.savings, label: "Tabungan"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            const Text(
              "KARTU ATM",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 16),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.5,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: const [
                AtmCard(
                  bankName: "Bank Mandiri",
                  cardNumber: "**** 2345",
                  balance: "Rp12.500.000",
                  color1: Colors.black,
                  color2: Color(0xFF1104FF),
                ),
                AtmCard(
                  bankName: "Bank BNI",
                  cardNumber: "**** 8765",
                  balance: "Rp5.350.000",
                  color1: Colors.black,
                  color2: Color(0xFF1104FF),
                ),
                AtmCard(
                  bankName: "Bank BRI",
                  cardNumber: "**** 1111",
                  balance: "Rp10.000.000",
                  color1: Colors.black,
                  color2: Color(0xFF1104FF),
                ),
                AtmCard(
                  bankName: "Bank BCA",
                  cardNumber: "**** 6666",
                  balance: "Rp66.666.666",
                  color1: Colors.black,
                  color2: Color(0xFF1104FF),
                ),
              ],
            ),

            const SizedBox(height: 28),

            const Text(
              "TRANSAKSI",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),

            Column(
              children: transactions
                  .map((trx) => TransactionItem(transaction: trx))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuCircle extends StatelessWidget {
  final IconData icon;
  final String label;

  const MenuCircle({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Colors.black, Color(0xFF1104FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
