import 'dart:html';
import 'dart:async';

import 'package:dartlang/model.dart';
import 'package:dartlang/templates.dart';

Future<Null> main() async {

  await window.onLoad.first;

  List<Tip> tips = [];

  const TOMUCHA = "Tomáš Zvěřina";
  
  tips.add(new Tip()
      ..name="Future"
      ..description="Základy asynchronního programování pomocí Futures"
      ..dartPadId="b887b707288c7be532237c466f63f273"
      ..author = TOMUCHA
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
    return !attributeName.startsWith("on");
  }

  @override
  bool allowsElement(Element element) {
    return element.tagName.toLowerCase()!="script";
  }

}