// Copyright (c) 2017, tomucha. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

void main() {
  querySelector('#motto').innerHtml = '<p class="text--center">Pokud vidíte tento text: <span class="monospace fs-l">1!="1"</span>, pak váš prohlížeč podporuje Dart.</p>';
}
