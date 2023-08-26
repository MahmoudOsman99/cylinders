import 'package:cylinders/extensions/app_extentions.dart';
import 'package:flutter/material.dart';

class GetGapScreen extends StatefulWidget {
  GetGapScreen({super.key});

  @override
  State<GetGapScreen> createState() => _GetGapScreenState();
}

class _GetGapScreenState extends State<GetGapScreen> {
  List<bool> selections = List.generate(2, (index) => false);
  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  labelText: 'اكتب قطر السلندر',
                  filled: true,
                  fillColor: Colors.amber,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    title: const Text('مشرشر او مطلوب جاب ١ مم'),
                    leading: Radio<int>(
                      value: 1,
                      groupValue: selectedOption,
                      activeColor: Colors
                          .red, // Change the active radio button color here
                      fillColor: MaterialStateProperty.all(
                        Colors.red,
                      ), // Change the fill color when selected
                      splashRadius: 20, // Change the splash radius when clicked
                      onChanged: (int? value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('فلات (جاب اعلي من ١ مم)'),
                    leading: Radio<int>(
                      value: 2,
                      groupValue: selectedOption,
                      activeColor: Colors
                          .blue, // Change the active radio button color here
                      fillColor: MaterialStateProperty.all(
                        Colors.blue,
                      ), // Change the fill color when selected
                      splashRadius: 50, // Change the splash radius when clicked
                      onChanged: (int? value) {
                        setState(
                          () {
                            selectedOption = value!;
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'حساب قيمة الجاب',
                          style: context.textList.bodyMedium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
