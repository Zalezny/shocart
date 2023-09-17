import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shocart/res/colors/app_colors.dart';

class CreatorPage extends StatelessWidget {
  CreatorPage({super.key});

  final List<String> exampleList = [
    'fish',
    'orange',
    'keys',
    'figi',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Hello!, Create your new list!',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Write your first product...',
                  border: const OutlineInputBorder(),
                ),
              ),
              ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: exampleList.length,
                  itemBuilder: (context, index) {
                    return Chip(label: Text(exampleList[index]));
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
                child: Text(
                  'Your shopping list has:',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.o_500.withOpacity(0.4)),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
