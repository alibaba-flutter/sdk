// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.5

// part of "core_patch.dart";

@patch
@pragma("vm:exact-result-type", bool)
bool identical(Object? a, Object? b) native "Identical_comparison";

@patch
@pragma("vm:entry-point", "call")
int identityHashCode(Object? object) =>
    object == null ? null.hashCode : object._identityHashCode;
