//
//  Generated code. Do not modify.
//  source: CollisionRecord.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use collisionRecordDescriptor instead')
const CollisionRecord$json = {
  '1': 'CollisionRecord',
  '2': [
    {'1': 'dotId', '3': 1, '4': 1, '5': 3, '10': 'dotId'},
    {'1': 'time', '3': 2, '4': 1, '5': 3, '10': 'time'},
    {'1': 'location', '3': 3, '4': 1, '5': 11, '6': '.dottheory.ProtoOffset', '10': 'location'},
  ],
};

/// Descriptor for `CollisionRecord`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List collisionRecordDescriptor =
    $convert.base64Decode('Cg9Db2xsaXNpb25SZWNvcmQSFAoFZG90SWQYASABKANSBWRvdElkEhIKBHRpbWUYAiABKANSBH'
        'RpbWUSMgoIbG9jYXRpb24YAyABKAsyFi5kb3R0aGVvcnkuUHJvdG9PZmZzZXRSCGxvY2F0aW9u');
