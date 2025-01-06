import 'package:flutter/material.dart';



class SeatBookingApp extends StatelessWidget {
  const SeatBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SeatBookingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SeatBookingPage extends StatefulWidget {
  @override
  _SeatBookingPageState createState() => _SeatBookingPageState();
}

class _SeatBookingPageState extends State<SeatBookingPage> {
  // 2D list representing seat status
  // 0 = Not Available, 1 = Available, 2 = Selected
  List<List<int>> seatStatus = [
    [0, 1, 1, 0, 1, 1, 0],
    [1, 1, 0, 1, 1, 0, 1],
    [0, 1, 2, 0, 1, 1, 0],
    [1, 0, 0, 1, 0, 0, 1],
    [0, 0, 0, 0, 0, 0, 0],
    [1, 0, 1, 1, 0, 0, 1],
    [0, 1, 1, 0, 0, 1, 1],
    [1, 0, 0, 0, 0, 0, 1],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seat Booking'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          // Top Row for Column Letters
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 30), // Space for row numbers
                ...List.generate(
                  7,
                      (index) => Expanded(
                    child: Text(
                      String.fromCharCode(65 + index), // A to G
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: seatStatus.length,
              itemBuilder: (context, rowIndex) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Row number
                    SizedBox(
                      width: 30,
                      child: Text(
                        (rowIndex + 1).toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    // Seats
                    ...List.generate(
                      seatStatus[rowIndex].length,
                          (colIndex) {
                        if (colIndex == 3) {
                          // Replace seats in column D with row numbers
                          return Expanded(
                            child: Center(
                              child: Text(
                                (rowIndex + 1).toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          );
                        }

                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (seatStatus[rowIndex][colIndex] == 1) {
                                setState(() {
                                  seatStatus[rowIndex][colIndex] = 2;
                                });
                              } else if (seatStatus[rowIndex][colIndex] == 2) {
                                setState(() {
                                  seatStatus[rowIndex][colIndex] = 1;
                                });
                              }
                            },
                            child: Container(
                              margin: const EdgeInsets.all(4.0),
                              width: 30,
                              height: 40,
                              decoration: BoxDecoration(
                                color: seatStatus[rowIndex][colIndex] == 0
                                    ? Colors.grey[300]
                                    : seatStatus[rowIndex][colIndex] == 1
                                    ? Colors.lightBlue[100]
                                    : Colors.blue,
                                borderRadius: BorderRadius.circular(20), // Oval shape
                                border: Border.all(
                                  color: seatStatus[rowIndex][colIndex] == 2
                                      ? Colors.blue
                                      : Colors.blueAccent,
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: seatStatus[rowIndex][colIndex] == 2
                                    ? Icon(Icons.check, color: Colors.white)
                                    : null,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
          // Legend
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.blue),
                    SizedBox(width: 8),
                    Text("Selected"),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[100],
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text("Available"),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text("Not Available"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
