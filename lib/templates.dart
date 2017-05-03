import 'package:dartlang/model.dart';

String renderListing(CaseStudy caseStudy) {
  return """
      <div class="l3 m6 s12 bg--white pointer card shadow--raising">
        <img src="img/gallery/${caseStudy.image}">
        <div class="padding">
          <h5>${caseStudy.name}</h5>
          <p>${caseStudy.author}</p>
        </div>
      </div>
  """;
}


String renderTip(Tip tip) {
  return """
      <a class="l3 m4 s12 bg--white pointer card shadow--raising"
       href="https://dartpad.dartlang.org/${tip.dartPadId}"
       target="_blank">
        <div class="padding">
          <h4>${tip.name} <span class='mi'>arrow_forward</span></h4>
          <p>${tip.description}</p>
          <p class="italics">${tip.author}</p>
        </div>
      </a>
  """;
}


String renderDialog(CaseStudy caseStudy) {
  return """
  <div id="caseStudyModal" class="modal__wrapper">
    <div class="modal">
      <a class="modal__close bg--light-blue--l4 text--white">close</a>
      <div class="flex--column">
          <header class="modal__header padding bg--light-blue--l4 text--white">
            <h1>${caseStudy.name}</h1>
          </header>
          <div class="spacer scroll">
              <img src="img/gallery/${caseStudy.image}">
              <div class="padding">
                <h5>${caseStudy.author}</h5>
                <p>${caseStudy.description}</p>
                <p><a href="${caseStudy.link}" target='_blank'>${caseStudy.link}</a></p>
              </div>
          </div>
        </div>
    </div>
  </div>
  """;
}