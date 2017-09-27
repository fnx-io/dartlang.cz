import 'dart:html';
import 'dart:async';

import 'package:dartlang/model.dart';
import 'package:dartlang/templates.dart';

Future<Null> main() async {
  await window.onLoad.first;

  List<Tip> tips = [];

  const String TOMUCHA = 'Tomáš Zvěřina';
  const String hobi = 'Honza Bittner';

  tips.add(new Tip()
    ..name = 'Konstruktory'
    ..description = 'Různé varianty konstruktorů objektů.'
    ..dartPadId = 'a082ec8f0c1a4e7c409195d228234069'
    ..author = TOMUCHA
  );

  tips.add(new Tip()
    ..name = 'List (pole)'
    ..description = 'List a pole &ndash; v Dartu jednou jsou.'
    ..dartPadId = 'e1f4e71b7d75d29cc7ea9e6870b502c4'
    ..author = TOMUCHA
  );

  tips.add(new Tip()
    ..name = 'Future'
    ..description = 'Základy asynchronního programování pomocí Futures.'
    ..dartPadId = 'b887b707288c7be532237c466f63f273'
    ..author = TOMUCHA
  );

  tips.add(new Tip()
    ..name = 'async / await'
    ..description = 'Pohodlné asynchronní programování pomocí await.'
    ..dartPadId = '3a611f5febde98d5de6c9fe56eb3431b'
    ..author = TOMUCHA
  );

  tips.add(new Tip()
    ..name = 'Stream'
    ..description = 'Tok dat a událostí.'
    ..dartPadId = '454a0e659a3aea422f78416ddd4ffef1'
    ..author = TOMUCHA
  );

  tips.add(new Tip()
    ..name = 'Synchronní generátor'
    ..description = 'Iterování přes komplikované struktury.'
    ..dartPadId = 'fe6e4f3f9e14fcbd111fdcd9e3295a93'
    ..author = TOMUCHA
  );

  tips.add(new Tip()
    ..name = 'DOM eventy a atributy'
    ..description = 'Přiřazování eventů a změna atributů v DOM.'
    ..dartPadId = 'a1d0bc7572132d99ece391a9c50e5881'
    ..author = hobi
  );

  tips.add(new Tip()
    ..name = 'Null-aware operátory'
    ..description = 'Operátory pro ošetření null hodnot.'
    ..dartPadId = 'be4b77088a4f3398a2acac22a202c98d'
    ..author = hobi
  );

  tips.add(new Tip()
    ..name = 'Factory pattern'
    ..description = 'Klíčové slovo factory a jeho možnosti.'
    ..dartPadId = '13de616df0b5212fa63812c6d4a391cf'
    ..author = hobi
  );

  tips.add(new Tip()
    ..name = 'Gettery a settery'
    ..description = 'Gettery a settery sdílejí API s vlastnostmi.'
    ..dartPadId = '994b884d8f9d5798d2e192c78464683a'
    ..author = hobi
  );

  tips.add(new Tip()
    ..name = 'Cykly'
    ..description = 'Procházení struktur.'
    ..dartPadId = '7d1ecafeec6f44606dc4cb656988f7c2'
    ..author = hobi
  );

  tips.add(new Tip()
    ..name = 'Typedef'
    ..description = 'Typové aliasy a Function-type.'
    ..dartPadId = 'd7ee9641be446ec949e2020ba1b60541'
    ..author = hobi
  );

  var benevolentValidator = new BenevolentNodeValidator();
  HtmlElement gallery = querySelector('#tips');

  for (var t in tips) {
    var card = new Element.html(renderTip(t), validator: benevolentValidator);
    gallery.children.add(card);
  }
}

class BenevolentNodeValidator implements NodeValidator {

  @override
  bool allowsAttribute(Element element, String attributeName, String value) {
    return !attributeName.startsWith('on');
  }

  @override
  bool allowsElement(Element element) {
    return element.tagName.toLowerCase() != 'script';
  }
}
