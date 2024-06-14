import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InternalContainer extends StatelessWidget {
  final Widget child;
  final double? width;

  const InternalContainer({super.key, required this.child, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: Padding(padding: const EdgeInsets.all(8.0), child: child));
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: (MediaQuery.of(context).size.height / 3),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/vatican.png'),
                alignment: Alignment(0.0, -0.2),
                fit: BoxFit.cover,
              ),
            )),
        SizedBox(
            width: double.infinity,
            height: (MediaQuery.of(context).size.height / 3) + 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SafeArea(
                    child: Text(AppLocalizations.of(context)!.hello,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith())),
                const Spacer(),
                Container(
                  foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).colorScheme.surface.withOpacity(0),
                      Theme.of(context).colorScheme.surface.withOpacity(0.5),
                      Theme.of(context).colorScheme.surface.withOpacity(0.8),
                      Theme.of(context).colorScheme.surface.withOpacity(1),
                    ],
                  )),
                  child: const SizedBox(
                    width: double.infinity,
                    height: 50,
                  ),
                )
              ],
            ))
      ],
    );
  }
}
