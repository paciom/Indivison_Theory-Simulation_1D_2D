//
//  Generated code. Do not modify.
//  source: Dot2D.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use dot2DDescriptor instead')
const Dot2D$json = {
  '1': 'Dot2D',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'position', '3': 2, '4': 1, '5': 11, '6': '.dottheory.ProtoOffset', '10': 'position'},
    {'1': 'direction', '3': 3, '4': 1, '5': 11, '6': '.dottheory.ProtoOffset', '10': 'direction'},
    {'1': 'connectedDotId', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Int64Value', '10': 'connectedDotId'},
    {'1': 'collisions', '3': 5, '4': 3, '5': 11, '6': '.dottheory.CollisionRecord', '10': 'collisions'},
    {'1': 'locationHistory', '3': 6, '4': 3, '5': 11, '6': '.dottheory.ProtoOffset', '10': 'locationHistory'},
    {'1': 'locationSwapHistory', '3': 7, '4': 3, '5': 11, '6': '.dottheory.LocationSwapRecord', '10': 'locationSwapHistory'},
  ],
};

/// Descriptor for `Dot2D`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dot2DDescriptor = $convert.base64Decode('CgVEb3QyRBIOCgJpZBgBIAEoA1ICaWQSMgoIcG9zaXRpb24YAiABKAsyFi5kb3R0aGVvcnkuUH'
    'JvdG9PZmZzZXRSCHBvc2l0aW9uEjQKCWRpcmVjdGlvbhgDIAEoCzIWLmRvdHRoZW9yeS5Qcm90'
    'b09mZnNldFIJZGlyZWN0aW9uEkMKDmNvbm5lY3RlZERvdElkGAQgASgLMhsuZ29vZ2xlLnByb3'
    'RvYnVmLkludDY0VmFsdWVSDmNvbm5lY3RlZERvdElkEjoKCmNvbGxpc2lvbnMYBSADKAsyGi5k'
    'b3R0aGVvcnkuQ29sbGlzaW9uUmVjb3JkUgpjb2xsaXNpb25zEkAKD2xvY2F0aW9uSGlzdG9yeR'
    'gGIAMoCzIWLmRvdHRoZW9yeS5Qcm90b09mZnNldFIPbG9jYXRpb25IaXN0b3J5Ek8KE2xvY2F0'
    'aW9uU3dhcEhpc3RvcnkYByADKAsyHS5kb3R0aGVvcnkuTG9jYXRpb25Td2FwUmVjb3JkUhNsb2'
    'NhdGlvblN3YXBIaXN0b3J5');
