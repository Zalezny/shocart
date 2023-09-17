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
    'figi',
    'figi',
    'figi',
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
                decoration: const InputDecoration(
                  hintText: 'Write your first product...',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 60,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: exampleList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: ActionChip(
                          
                          label: Text(exampleList[index]),
                          onPressed: () {},
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
                child: Text(
                  'Your shopping list has:',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.o_500.withOpacity(0.4)),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150.0,
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 0.0,
                  childAspectRatio: 2.5,
                ),
                padding: EdgeInsets.zero,
                itemCount: exampleList.length,
                itemBuilder: (context, index) {
                  return InputChip(
                    label: Text(exampleList[index]),
                    shape: StadiumBorder(side: BorderSide()),
                    backgroundColor: Colors.transparent,
                    onDeleted: () {},
                  );
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
