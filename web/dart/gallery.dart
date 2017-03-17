import 'dart:html';
import 'dart:async';

import 'package:dartlang/model.dart';
import 'package:dartlang/templates.dart';

Future<Null> main() async {

  await window.onLoad.first;

  List<CaseStudy> studies = [];

  studies.add(new CaseStudy()
      ..author="Multimedia atelier s.r.o."
      ..name="Spotřebitelská soutěž Flakes"
      ..image="01.jpg"
      ..link="http://www.m-atelier.cz/"
      ..description='Webové "flashovky" pro iPady. Běžely v rámci spotřebitelské soutěže, která nebyla určená pro český trh. '
          'Hry byly vytvořeny pomocí knihovny StageXL.'
  );

  studies.add(new CaseStudy()
    ..author="Jana Moudrá"
    ..name="Oficiální knihovna pro Firebase"
    ..image="02.jpg"
    ..link="https://pub.dartlang.org/packages/firebase"
    ..description="Knihovna původně vznikla jako Open Source projekt, který později Google převzal a stal se oficiální implementací."
  );

  studies.add(new CaseStudy()
    ..author="fnx.io s.r.o."
    ..name="fnx|ui"
    ..image="03.jpg"
    ..link="https://github.com/fnx-io/fnx_ui"
    ..description="Knihovna Angular Dart komponent, která je určená pro rychlý vývoj informačních systémů, administračních rozhraní a CMS."
  );

  studies.add(new CaseStudy()
    ..author="Filip Hráček"
    ..name="Tisíc knih"
    ..image="04.jpg"
    ..link="http://tisicknih.cz/"
    ..description="Nástroj, který vám na základě dat z Městské knihovny v Praze doporučí knihy, které by se Vám mohly líbit."
  );

  studies.shuffle();

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
