import 'dart:html';
import 'dart:async';

import 'package:dartlang/model.dart';
import 'package:dartlang/templates.dart';

Future<Null> main() async {
  await window.onLoad.first;

  List<CaseStudy> studies = [];

  studies.add(new CaseStudy()
    ..author = 'Multimedia atelier s.r.o.'
    ..name = 'Spotřebitelská soutěž Flakes'
    ..image = '01.jpg'
    ..link = 'http://www.stagexl.org/'
    ..description = 'Webové "flashovky" pro iPady. Běžely v rámci spotřebitelské soutěže, která nebyla určená pro český trh. '
        'Hry byly vytvořeny pomocí knihovny StageXL.'
  );

  studies.add(new CaseStudy()
    ..author = 'Jana Moudrá'
    ..name = 'Oficiální knihovna pro Firebase'
    ..image = '02.jpg'
    ..link = 'https://pub.dartlang.org/packages/firebase'
    ..description = 'Knihovna původně vznikla jako Open Source projekt, který později Google převzal a stal se oficiální implementací.'
  );

  studies.add(new CaseStudy()
    ..author = 'fnx.io s.r.o.'
    ..name = 'fnx|ui'
    ..image = '03.jpg'
    ..link = 'https://github.com/fnx-io/fnx_ui'
    ..description = 'Knihovna Angular Dart komponent, která je určená pro rychlý vývoj informačních systémů, administračních rozhraní a CMS.'
  );

  studies.add(new CaseStudy()
    ..author = 'Filip Hráček'
    ..name = 'Tisíc knih'
    ..image = '04.jpg'
    ..link = 'http://tisicknih.cz'
    ..description = 'Nástroj, který vám na základě dat Městské knihovny v Praze doporučí knihy, které by se Vám mohly líbit.'
  );

  studies.add(new CaseStudy()
    ..author = 'SnowlyCode s.r.o.'
    ..name = 'FxSimulátor'
    ..image = '06.jpg'
    ..link = 'http://fxsimulator.com'
    ..description = 'FxSimulátor simuluje chování forexových trhů ve zrychleném čase. Zajišťuje bleskový a nenáročný vstup do problematiky.'
  );

  studies.add(new CaseStudy()
    ..author = 'Websitemaster a.s.'
    ..name = 'Dragito'
    ..image = '05.jpg'
    ..link = 'https://www.dragito.com'
    ..description = 'Dragito je experimentální služba pro tvorbu webových stránek.'
  );

  studies.add(new CaseStudy()
    ..author = 'Státní fond životního prostředí'
    ..name = 'Dotace Dešťovka'
    ..image = '07.jpg'
    ..link = 'https://www.dotacedestovka.cz'
    ..description = 'Formuláře pro příjem žádostí v programu Dešťovka.'
  );

  studies.add(new CaseStudy()
    ..author = 'Jakub Zvěřina'
    ..name = 'Pivastika'
    ..image = 'pivastika.jpg'
    ..link = 'https://app.pivastika.cz'
    ..description = 'Pivastika Vám ukáže restaurace v okolí s jejich nabídkou piv a při návštěvě restaurace, počítáním Vaší útraty, '
        'předejde nepříjemným překvapením při placení účtu.'
  );

  studies.add(new CaseStudy()
    ..author = 'Technologická agentura ČR'
    ..name = 'Průvodce podáním nabídky'
    ..image = 'pruvodce.jpg'
    ..link = 'https://pruvodce.beta.tacr.cz/'
    ..description = 'Průvodce je nástroj pro elektronické podání nabídky do veřejných zakázek vyhlašovaných TAČR.'
  );

  studies.add(new CaseStudy()
    ..author = 'Galeos a.s.'
    ..name = 'Galeos LMS'
    ..image = 'galeos.jpg'
    ..link = 'http://www.galeos.eu'
    ..description = 'Interní systém pro správu licencí poskytovaných společností Galeos a.s.'
  );
  
  studies.shuffle();

  // firebase
  // fnx_ui
  // tisicknih
  //

  HtmlElement gallery = querySelector('#showCases');

  void closeLastDialog([_]) {
    var dialog = querySelector('#caseStudyModal');
    if (dialog != null) dialog.remove();
  }

  document.onKeyUp.where((KeyboardEvent e) => e.keyCode == KeyCode.ESC).listen(closeLastDialog);

  for (var o in studies) {
    var card = new Element.html(renderListing(o));
    gallery.children.add(card);
    card.onClick.listen((_) async {
      closeLastDialog();
      var dialog = new Element.html(renderDialog(o), validator: new BenevolentNodeValidator());
      document.body.append(dialog);
      await dialog
          .querySelector('.modal__close')
          .onClick
          .first;
      dialog.remove();
    });
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
