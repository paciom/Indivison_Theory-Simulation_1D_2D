//
//  Generated code. Do not modify.
//  source: DotData.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use dotDataDescriptor instead')
const DotData$json = {
  '1': 'DotData',
  '2': [
    {'1': 'initialAreaWidth', '3': 1, '4': 1, '5': 1, '10': 'initialAreaWidth'},
    {'1': 'initialAreaHeight', '3': 2, '4': 1, '5': 1, '10': 'initialAreaHeight'},
    {'1': 'collisionRadius', '3': 3, '4': 1, '5': 1, '10': 'collisionRadius'},
    {'1': 'seed', '3': 4, '4': 1, '5': 3, '10': 'seed'},
    {'1': 'numberOfDots', '3': 5, '4': 1, '5': 3, '10': 'numberOfDots'},
    {'1': 'time', '3': 6, '4': 1, '5': 3, '10': 'time'},
    {'1': 'dots', '3': 7, '4': 3, '5': 11, '6': '.dottheory.DotData.DotsEntry', '10': 'dots'},
  ],
  '3': [DotData_DotsEntry$json],
};

@$core.Deprecated('Use dotDataDescriptor instead')
const DotData_DotsEntry$json = {
  '1': 'DotsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 3, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.dottheory.Dot2D', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `DotData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dotDataDescriptor = $convert.base64Decode('CgdEb3REYXRhEioKEGluaXRpYWxBcmVhV2lkdGgYASABKAFSEGluaXRpYWxBcmVhV2lkdGgSLA'
    'oRaW5pdGlhbEFyZWFIZWlnaHQYAiABKAFSEWluaXRpYWxBcmVhSGVpZ2h0EigKD2NvbGxpc2lv'
    'blJhZGl1cxgDIAEoAVIPY29sbGlzaW9uUmFkaXVzEhIKBHNlZWQYBCABKANSBHNlZWQSIgoMbn'
    'VtYmVyT2ZEb3RzGAUgASgDUgxudW1iZXJPZkRvdHMSEgoEdGltZRgGIAEoA1IEdGltZRIwCgRk'
    'b3RzGAcgAygLMhwuZG90dGhlb3J5LkRvdERhdGEuRG90c0VudHJ5UgRkb3RzGkkKCURvdHNFbn'
    'RyeRIQCgNrZXkYASABKANSA2tleRImCgV2YWx1ZRgCIAEoCzIQLmRvdHRoZW9yeS5Eb3QyRFIF'
    'dmFsdWU6AjgB');
