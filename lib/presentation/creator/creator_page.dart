import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shocart/bloc/search_cubit/creator_cubit.dart';
import 'package:shocart/res/colors/app_colors.dart';
import 'package:shocart/utils/product.dart';

class CreatorPage extends StatefulWidget {
  CreatorPage({super.key});

  @override
  State<CreatorPage> createState() => _CreatorPageState();
}

class _CreatorPageState extends State<CreatorPage> {
  final _formProductKey = GlobalKey<FormState>();

  final _productController = TextEditingController();

  final _productFocusNode = FocusNode();

  final exampleSearchList = [
    'bulki',
    'bigos',
    'biedra',
  ];

  @override
  void dispose() {
    _productController.dispose();
    _productFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<CreatorCubit, CreatorState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Hello \nCreate your new list!',
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ),
                  Form(
                    key: _formProductKey,
                    child: TextFormField(
                      controller: _productController,
                      focusNode: _productFocusNode,
                      decoration: const InputDecoration(
                        hintText: 'Write your first product...',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        _formProductKey.currentState!.validate();
                      },
                      validator: (value) {
                        return '';
                      },
                      onFieldSubmitted: (newProductName) {
                        final newProduct = Product(
                          category: 'undefined',
                          name: newProductName,
                        );
                        context.read<CreatorCubit>().addProduct(newProduct);
                        _productController.clear();
                        FocusScope.of(context).requestFocus(_productFocusNode);
                      },
                      textInputAction: TextInputAction.send,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: exampleSearchList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: ActionChip(label: Text(exampleSearchList[index]), onPressed: () {}),
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
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      return InputChip(
                        label: Text(state.products[index].name),
                        shape: const StadiumBorder(side: BorderSide()),
                        backgroundColor: Colors.transparent,
                        onDeleted: () => context.read<CreatorCubit>().removeProduct(state.products[index]),
                      );
                    },
                  )
                ],
              );
            },
          ),
        ),
      )),
    );
  }
}
