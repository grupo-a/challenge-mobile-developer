import 'package:flutter/material.dart';
import 'package:lists_joao_nogueira/src/utils/theme/theme_app.dart';

abstract class ListAppBottomSheet {
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required String titleButtonOne,
    required String titleButtonTwo,
    required T valueButtonOne,
    required T valueButtonTwo,
  }) {
    return showModalBottomSheet<T>(
        context: context,
        builder: (context) {
          return BottomSheet(
            onClosing: () {},
            builder: (context) {
              final size = MediaQuery.of(context).size;
              return ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 215),
                child: SizedBox(
                  height: size.height * 0.33,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: theme.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                                maxHeight: 40, maxWidth: 120),
                            child: SizedBox(
                              height: size.height * .06,
                              width: size.width * 0.33,
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      theme.primaryColor),
                                ),
                                onPressed: () {
                                  Navigator.pop(
                                    context,
                                    valueButtonOne,
                                  );
                                },
                                child: Text(
                                  titleButtonOne,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.11,
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                                maxHeight: 40, maxWidth: 120),
                            child: SizedBox(
                              height: size.height * .06,
                              width: size.width * 0.33,
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      theme.primaryColor),
                                ),
                                onPressed: () {
                                  Navigator.pop(
                                    context,
                                    valueButtonTwo,
                                  );
                                },
                                child: Text(
                                  titleButtonOne,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
