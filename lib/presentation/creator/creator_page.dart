import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatorPage extends StatelessWidget {
  const CreatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
            )
          ],
        ),
      )),
    );
  }
}
