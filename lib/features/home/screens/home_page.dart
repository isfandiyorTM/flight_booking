import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/image_strings.dart';
import '../../../core/constants/text_strings.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String tripType = AppTexts.oneWay;
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate() async{
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate:DateTime(2100),
    );

    if(_picked != null){
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: AppColors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.worldMap),
                  fit: BoxFit.fitHeight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap:()=>Navigator.pop(context),
                        child: const Icon(
                          CupertinoIcons.back,
                          size: 30,
                          color: AppColors.white,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      const Text(
                        AppTexts.searchFlights,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Expanded(child: SizedBox()),

                    ],
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    AppTexts.discoverANewWorld,
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        value: AppTexts.oneWay,
                        activeColor: AppColors.blue,
                        groupValue: tripType,
                        onChanged: (value) {
                          setState(() {
                            tripType = value!;
                          });
                        },
                      ),
                      const Text(
                        AppTexts.oneWay,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textBlack,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Radio<String>(
                        value: AppTexts.roundTrip,
                        activeColor: AppColors.blue,
                        groupValue: tripType,
                        onChanged: (value) {
                          setState(() {
                            tripType = value!;
                          });
                        },
                      ),
                      const Text(
                        AppTexts.roundTrip,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textBlack,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  ChooseFlightInput(
                    title: AppTexts.from,
                    hintText: AppTexts.newYork,
                    icon: const Icon(
                      Icons.flight_takeoff_outlined,
                      color: AppColors.blue,
                    ),
                  ),
                  ChooseFlightInput(
                    title: AppTexts.to,
                    hintText: AppTexts.vietnam,
                    icon: const Icon(
                      Icons.flight_land_outlined,
                      color: AppColors.blue,
                    ),
                  ),
                  ChooseFlightInput(
                    title: AppTexts.departureDate,
                    hintText: AppTexts.date,
                    icon: const Icon(
                      Icons.calendar_month,
                      color: AppColors.blue,
                    ),
                      onPressed: (){
                        _selectDate();
                      },
                    readOnly: true,
                    controller: _dateController,
                  ),
                  ChooseFlightInput(
                    title: AppTexts.travelers,
                    hintText: AppTexts.travelersCount,
                    icon: const Icon(
                      Icons.person,
                      color: AppColors.blue,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.blue,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        AppTexts.searchFlights,
                        style: TextStyle(color: AppColors.white,fontSize: 16,fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChooseFlightInput extends StatelessWidget {
  ChooseFlightInput(
      {super.key,
      required this.title,
      required this.hintText,
      required this.icon,
        this.onPressed,
        this.readOnly,
        this.controller
      });


  String? title;
  String? hintText;
  Icon? icon;
  VoidCallback? onPressed;
  bool? readOnly;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: AppColors.textBlack,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.bgLight,
              border: Border.all(width: 1, color: AppColors.borderColor)),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: icon!,
              hintText: hintText!,
              contentPadding: const EdgeInsets.only(top: 13),
              border: InputBorder.none,
            ),
            onTap: onPressed,
            readOnly: readOnly??false,
          ),
        ),
      ],
    );
  }
}
