#!/usr/bin/env dart
// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library enum_generator_test;

import 'package:protoc_plugin/indenting_writer.dart';
import 'package:protoc_plugin/protoc.dart';
import 'package:protoc_plugin/src/descriptor.pb.dart';
import 'package:test/test.dart';

import 'golden_file.dart';

void main() {
  test('testEnumGenerator', () {
    EnumDescriptorProto ed = EnumDescriptorProto()
      ..name = 'PhoneType'
      ..value.addAll([
        EnumValueDescriptorProto()
          ..name = 'MOBILE'
          ..number = 0,
        EnumValueDescriptorProto()
          ..name = 'HOME'
          ..number = 1,
        EnumValueDescriptorProto()
          ..name = 'WORK'
          ..number = 2,
        EnumValueDescriptorProto()
          ..name = 'BUSINESS'
          ..number = 2
      ]);
    IndentingWriter writer = IndentingWriter(filename: 'sample.proto');
    FileGenerator fg =
        FileGenerator(FileDescriptorProto(), GenerationOptions());
    EnumGenerator eg = EnumGenerator.topLevel(ed, fg, Set<String>(), 0);
    eg.generate(writer);
    expectMatchesGoldenFile(writer.toString(), 'test/goldens/enum');
    expectMatchesGoldenFile(
        writer.sourceLocationInfo.toString(), 'test/goldens/enum.meta');
  });
}
