import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grafik Penggunaan"),
        automaticallyImplyLeading: false, // ❌ Menghilangkan tombol back
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: LineChart(
          LineChartData(
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    return Text("M${value.toInt() + 1}"); // Misal: M1, M2, ...
                  },
                ),
              ),
            ),
            gridData: FlGridData(show: true),
            borderData: FlBorderData(show: true),
            lineBarsData: [
              LineChartBarData(
                isCurved: true,
                color: Colors.blue,
                barWidth: 3,
                belowBarData: BarAreaData(show: false),
                spots: const [
                  FlSpot(0, 3),
                  FlSpot(1, 2),
                  FlSpot(2, 5),
                  FlSpot(3, 3.1),
                  FlSpot(4, 4),
                  FlSpot(5, 3),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
