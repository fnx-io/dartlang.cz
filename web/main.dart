import 'dart:html';

void main() {
  querySelector('#motto').innerHtml = '''
    <p class="text--center">
      Pokud vidíte tento text:
      <span class="monospace fs-l">1!="1"</span>,<br>
      pak váš prohlížeč podporuje Dart.
    </p>
  ''';
}
