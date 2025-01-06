import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:ticket_widget/ticket_widget.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/image_strings.dart';
import '../booking_detail/booking_detail.dart';

class SearchPage extends StatelessWidget {
  final List<Map<String, dynamic>> tickets = [
    {
      'departure': 'LGA',
      'arrival': 'DAD',
      'departureCity': 'New York',
      'arrivalCity': 'Da Nang',
      'departureTime': '8:00 AM',
      'arrivalTime': '7:00 AM',
      'flightDuration': '23:00 hours',
      'departureDate': 'August 28, 2021',
      'arrivalDate': 'August 29, 2021',
      'price': 340,
      'airlineLogo': 'assets/images/qatar.png',
    },
    {
      'departure': 'LAX',
      'arrival': 'HND',
      'departureCity': 'Los Angeles',
      'arrivalCity': 'Tokyo',
      'departureTime': '10:00 AM',
      'arrivalTime': '3:00 PM',
      'flightDuration': '12:00 hours',
      'departureDate': 'September 10, 2021',
      'arrivalDate': 'September 11, 2021',
      'price': 500,
      'airlineLogo': 'assets/images/qatar.png',
    },
    {
      'departure': 'JFK',
      'arrival': 'DXB',
      'departureCity': 'New York',
      'arrivalCity': 'Dubai',
      'departureTime': '6:00 PM',
      'arrivalTime': '5:00 AM',
      'flightDuration': '13:00 hours',
      'departureDate': 'October 5, 2021',
      'arrivalDate': 'October 6, 2021',
      'price': 450,
      'airlineLogo': 'assets/images/qatar.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: AppColors.blue,
      ),
      body: Stack(
        children: [
          Positioned(
            child: Image.asset(
              AppImages.worldMap,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 20),
              // Top Section
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: AppColors.white,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'Search Flights',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                  child: ListView.builder(
                    itemCount: tickets.length,
                    itemBuilder: (context, index) {
                      final ticket = tickets[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookingDetailPage(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TicketWidget(
                            width: double.infinity,
                            height: 200,
                            isCornerRounded: true,
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                            color: AppColors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Departure and Arrival
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ticket['departure'],
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.textBlack,
                                          ),
                                        ),
                                        Text(
                                          ticket['departureCity'],
                                          style: const TextStyle(
                                            color: AppColors.textGray,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const CircleAvatar(
                                              radius: 8,
                                              backgroundColor: AppColors.lightGray,
                                              child: CircleAvatar(
                                                radius: 4,
                                                backgroundColor: AppColors.textGray,
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.symmetric(horizontal: 8),
                                              child: const DottedLine(
                                                direction: Axis.horizontal,
                                                lineLength: 50,
                                                lineThickness: 2,
                                                dashLength: 4,
                                                dashGapLength: 3,
                                                dashColor: AppColors.borderColor,
                                              ),
                                            ),
                                            Image.asset(
                                              'assets/icons/flights.png',
                                              width: 24,
                                              height: 24,
                                              fit: BoxFit.contain,
                                              color: AppColors.blue,
                                            ),
                                            Container(
                                              margin: const EdgeInsets.symmetric(horizontal: 8),
                                              child: const DottedLine(
                                                direction: Axis.horizontal,
                                                lineLength: 50,
                                                lineThickness: 2,
                                                dashLength: 4,
                                                dashGapLength: 3,
                                                dashColor: AppColors.borderColor,
                                              ),
                                            ),
                                            const CircleAvatar(
                                              radius: 8,
                                              backgroundColor: AppColors.lightGray,
                                              child: CircleAvatar(
                                                radius: 4,
                                                backgroundColor: AppColors.textGray,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          ticket['flightDuration'],
                                          style: const TextStyle(
                                            color: AppColors.textGray,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          ticket['arrival'],
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.textBlack,
                                          ),
                                        ),
                                        Text(
                                          ticket['arrivalCity'],
                                          style: const TextStyle(
                                            color: AppColors.textGray,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ticket['departureTime'],
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: AppColors.textBlack,
                                          ),
                                        ),
                                        Text(
                                          ticket['departureDate'],
                                          style: const TextStyle(color: AppColors.textGray),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          ticket['arrivalTime'],
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: AppColors.textBlack,
                                          ),
                                        ),
                                        Text(
                                          ticket['arrivalDate'],
                                          style: const TextStyle(color: AppColors.textGray),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const DottedLine(
                                  direction: Axis.horizontal,
                                  lineThickness: 1,
                                  dashLength: 4,
                                  dashGapLength: 2,
                                  dashColor: Colors.grey,
                                  lineLength: double.infinity,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          ticket['airlineLogo'],
                                          width: 24,
                                          height: 24,
                                          fit: BoxFit.contain,
                                        ),
                                        const SizedBox(width: 8),
                                        const Text(
                                          "Qatar Airways",
                                          style: TextStyle(fontSize: 16, color: AppColors.textGray),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "\$${ticket['price']}",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: AppColors.textBlack,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
