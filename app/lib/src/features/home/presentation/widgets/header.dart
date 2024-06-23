import 'package:flutter/material.dart';

import 'package:pontifex_archive/i18n.g.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(context.t.home.header.title,
        style: Theme.of(context)
            .textTheme
            .displayMedium
            ?.copyWith(fontWeight: FontWeight.bold));
  }
}
