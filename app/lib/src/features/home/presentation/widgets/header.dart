import 'package:flutter/material.dart';

import 'package:pontifex_archive/i18n.g.dart';

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
    final size = (MediaQuery.of(context).size.height / 12) * 5.5;
    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: size,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/cathedral-pattern.png'),
                alignment: Alignment(0.0, -0.2),
                fit: BoxFit.cover,
              ),
            )),
        SizedBox(
            width: double.infinity,
            height: size + 1,
            child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[Spacer(), BottomGradientHeader()])),
        SizedBox(
            width: double.infinity,
            height: size - 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Spacer(),
                Row(
                  children: [
                    const Spacer(),
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(
                            top: 3, bottom: 3, left: 20, right: 20),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(3)),
                            color: Theme.of(context).colorScheme.primary),
                        child: Text(context.t.home.header.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary))),
                    const Spacer()
                  ],
                ),
              ],
            )),
      ],
    );
  }
}

class BottomGradientHeader extends StatelessWidget {
  const BottomGradientHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Theme.of(context).colorScheme.surfaceContainer.withOpacity(0),
          Theme.of(context).colorScheme.surfaceContainer.withOpacity(0.5),
          Theme.of(context).colorScheme.surfaceContainer.withOpacity(0.8),
          Theme.of(context).colorScheme.surfaceContainer.withOpacity(1),
        ],
      )),
      child: const SizedBox(
        width: double.infinity,
        height: 20,
      ),
    );
  }
}
