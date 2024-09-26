import 'package:diabets/profile.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // Import the fl_chart package

// ignore: must_be_immutable
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

    int selectedIndex = 0;
    void _onItemTapped(int index) {
  setState(() {
    selectedIndex = index;
  });

  if (index == 4) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PersonalPage()),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: _buildSearchBar(),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGlucoseRateCard(),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildActivityCard()),
                const SizedBox(width: 16),
                Expanded(child: _buildCaloriesCard()),
              ],
            ),
            const SizedBox(height: 16),
            _buildServicesSection(),
            const SizedBox(height: 16),
            _buildDailyTipsSection(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  } 

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search here',
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey.shade200,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      ),
    );
  }

  Widget _buildGlucoseRateCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.bloodtype, color: Colors.red), // Blood icon
                  SizedBox(width: 1.6),
                  Text(
                    'Glucose Rate',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Daily', style: TextStyle(color: Color(0xFF034985))),
                  SizedBox(width: 16),
                  Text('Weekly', style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 16),
                  Text('Monthly', style: TextStyle(color: Colors.grey)),
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '5.5 mmol/L',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold , color: Color(0xFF034985)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Highs', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                  Text('8.5 mmol/L', style: TextStyle(color: Colors.green)),
                  Text('Normal', style: TextStyle(color: Color(0xFF034985), fontWeight: FontWeight.bold)),
                  Text('5.5 mmol/L', style: TextStyle(color: Color(0xFF034985))),
                  Text('Lows', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                  Text('3.5 mmol/L', style: TextStyle(color: Colors.red)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 150,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: true),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toStringAsFixed(1), // Display y-axis values
                          style: const TextStyle(color: Colors.black, fontSize: 12),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          'Day ${value.toInt() + 1}', // Display x-axis values
                          style: const TextStyle(color: Colors.black, fontSize: 10),
                        );
                      },
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: Colors.black12),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 3.5), // Sample data points
                      const FlSpot(1, 4.5),
                      const FlSpot(2, 5.5),
                      const FlSpot(3, 6.5),
                      const FlSpot(4, 7.5),
                      const FlSpot(5, 6.0),
                      const FlSpot(6, 5.5),
                    ],
                    isCurved: true,
                    color: Colors.red,
                    barWidth: 4,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(show: true, color: Colors.red.withOpacity(0.3)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange.shade100, Colors.orange.shade200],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 60,
                width: 60,
                child: CircularProgressIndicator(
                  value: 0.76, // Represents 7600 steps out of a hypothetical 10,000 steps goal
                  backgroundColor: Colors.grey.shade200,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.orange),
                  strokeWidth: 6,
                ),
              ),
              const Icon(Icons.directions_run, color: Colors.orange, size: 30),
            ],
          ),
          const SizedBox(width: 9),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Activities', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                Text('7600 steps',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF034985),
                    )),
                SizedBox(height: 4),
                Text('76% of your goal', style: TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildCaloriesCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange.shade100, Colors.orange.shade200],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 60,
                width: 60,
                child: CircularProgressIndicator(
                  value: 0.71, // Example: 1420 kcal out of a 2000 kcal goal
                  backgroundColor: Colors.grey.shade200,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.orange),
                  strokeWidth: 6,
                ),
              ),
              const Icon(Icons.local_fire_department, color: Colors.orange, size: 30),
            ],
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Calories', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                Text(
                  '1420 kcal',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF034985),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '71% of daily goal',
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildServicesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Services', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold , color: Color(0xFF034985))),
            Text('See all', style: TextStyle(color: Colors.grey)),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildServiceCard('Reminder', Icons.notifications),
            _buildServiceCard('Meal Planner', Icons.restaurant_menu),
            _buildServiceCard('Drug', Icons.medical_services),
          ],
        ),
      ],
    );
  }

  Widget _buildServiceCard(String title, IconData icon) {
    return SizedBox(
      width: 100, // Fixed width for all cards
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
          children: [
            Icon(icon, color: Colors.orange, size: 30),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyTipsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Daily tips', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold , color: Color(0xFF034985))),
            Text('See all', style: TextStyle(color: Colors.grey)),
          ],
        ),
        const SizedBox(height: 8),
        _buildTipCard('It is important to walk at least 10 minutes after meals, it will help you digest food...'),
        _buildTipCard('Try to consume the right amounts of protein and good fats according to the requirements...'),
      ],
    );
  }

  Widget _buildTipCard(String text) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE3EAFF), // Updated color
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.lightbulb, color: Colors.orange), // Updated icon color
              const SizedBox(width: 10),
              Expanded(child: Text(text, style: const TextStyle(fontSize: 14, color: Color(0xFF034985)))), // Updated text color
            ],
          ),
          const Positioned(
            bottom: -5,
            right: 0,
            child: Text('Read more', style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.add_circle, size: 40), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
      ],
      selectedItemColor: const Color(0xFF034985),
      unselectedItemColor: Colors.grey,
      currentIndex: selectedIndex,
      onTap: _onItemTapped ,
      type: BottomNavigationBarType.fixed,
    );
  }
}
