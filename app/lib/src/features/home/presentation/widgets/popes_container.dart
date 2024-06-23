import 'package:flutter/material.dart';
import 'package:pontifex_archive/i18n.g.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/home_state.dart';

class PopesContainer extends StatelessWidget {
  final HomeState state;
  const PopesContainer({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final popes = state.popes;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(context.t.home.popes.title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith()),
      Padding(
          padding: const EdgeInsets.only(top: 5),
          child: SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: popes.length,
                itemBuilder: (context, index) {
                  final pope = popes[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/author/${pope.id}");
                    },
                    child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Theme.of(context).colorScheme.surfaceContainer,
                        borderOnForeground: true,
                        child: Column(
                          children: [
                            Image.network(
                              pope.imageUrl,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            const Spacer(),
                            Text(
                              pope.nameLocale(
                                  LocaleSettings.currentLocale.flutterLocale),
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(),
                            ),
                            const Spacer(),
                          ],
                        )),
                  );
                },
              )))
    ]);
  }
}
