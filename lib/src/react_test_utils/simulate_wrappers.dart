// Copyright (c) 2016, the Clean project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@JS()
library react.test_utils.simulate_wrappers;

import 'package:js/js.dart';

@JS('React.addons.TestUtils.Simulate')
abstract class Simulate {
  external static void animationEnd(componentOrNode, [eventData]);
  external static void animationIteration(componentOrNode, [eventData]);
  external static void animationStart(componentOrNode, [eventData]);
  external static void blur(componentOrNode, [eventData]);
  external static void change(componentOrNode, [eventData]);
  external static void click(componentOrNode, [eventData]);
  external static void contextMenu(componentOrNode, [eventData]);
  external static void copy(componentOrNode, [eventData]);
  external static void compositionEnd(componentOrNode, [eventData]);
  external static void compositionStart(componentOrNode, [eventData]);
  external static void compositionUpdate(componentOrNode, [eventData]);
  external static void cut(componentOrNode, [eventData]);
  external static void doubleClick(componentOrNode, [eventData]);
  external static void drag(componentOrNode, [eventData]);
  external static void dragEnd(componentOrNode, [eventData]);
  external static void dragEnter(componentOrNode, [eventData]);
  external static void dragExit(componentOrNode, [eventData]);
  external static void dragLeave(componentOrNode, [eventData]);
  external static void dragOver(componentOrNode, [eventData]);
  external static void dragStart(componentOrNode, [eventData]);
  external static void drop(componentOrNode, [eventData]);
  external static void focus(componentOrNode, [eventData]);
  external static void gotPointerCapture(componentOrNode, [eventData]);
  external static void input(componentOrNode, [eventData]);
  external static void keyDown(componentOrNode, [eventData]);
  external static void keyPress(componentOrNode, [eventData]);
  external static void keyUp(componentOrNode, [eventData]);
  external static void lostPointerCapture(componentOrNode, [eventData]);
  external static void mouseDown(componentOrNode, [eventData]);
  external static void mouseMove(componentOrNode, [eventData]);
  external static void mouseOut(componentOrNode, [eventData]);
  external static void mouseOver(componentOrNode, [eventData]);
  external static void mouseUp(componentOrNode, [eventData]);
  external static void pointerCancel(componentOrNode, [eventData]);
  external static void pointerDown(componentOrNode, [eventData]);
  external static void pointerEnter(componentOrNode, [eventData]);
  external static void pointerLeave(componentOrNode, [eventData]);
  external static void pointerMove(componentOrNode, [eventData]);
  external static void pointerOut(componentOrNode, [eventData]);
  external static void pointerOver(componentOrNode, [eventData]);
  external static void pointerUp(componentOrNode, [eventData]);
  external static void paste(componentOrNode, [eventData]);
  external static void scroll(componentOrNode, [eventData]);
  external static void submit(componentOrNode, [eventData]);
  external static void touchCancel(componentOrNode, [eventData]);
  external static void touchEnd(componentOrNode, [eventData]);
  external static void touchMove(componentOrNode, [eventData]);
  external static void touchStart(componentOrNode, [eventData]);
  external static void transitionEnd(componentOrNode, [eventData]);
  external static void wheel(componentOrNode, [eventData]);
}
