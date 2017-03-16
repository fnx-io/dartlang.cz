import 'dart:html';
import 'dart:async';

import 'package:dartlang/model.dart';
import 'package:dartlang/templates.dart';

Future<Null> main() async {

  await window.onLoad.first;

  List<CaseStudy> studies = [];

  studies.shuffle();

  studies.add(new CaseStudy()
      ..author="Multimedia atelier s.r.o."
      ..name="Spotřebitelská soutěž Flakes"
      ..image="01.jpg"
      ..link="http://www.m-atelier.cz/"
      ..description="Webové 'flashovky' pro iPady. Běžely v rámci spotřebitelské soutěže, která nebyla určená pro český trh."
          "Hry byly vytvořeny pomocí knihovny StageXL."
  );

  // firebase
  // fnx_ui
  // tisicknih
  //

  HtmlElement gallery = querySelector('#showCases');

  for (var o in studies) {
    var card = new Element.html(renderListing(o));
    gallery.children.add(card);
    card.onClick.listen((_) async {
      var dialog = querySelector("#caseStudyModal");
      if (dialog != null) dialog.remove();
      dialog = new Element.html(renderDialog(o));
      document.body.append(dialog);
      await dialog.querySelector(".modal__close").onClick.first;
      dialog.remove();
    });
  }

}
