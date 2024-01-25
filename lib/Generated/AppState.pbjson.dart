//
//  Generated code. Do not modify.
//  source: AppState.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use appStateDescriptor instead')
const AppState$json = {
  '1': 'AppState',
  '2': [
    {'1': 'data', '3': 1, '4': 1, '5': 11, '6': '.dottheory.DotData', '10': 'data'},
    {'1': 'ui', '3': 2, '4': 1, '5': 11, '6': '.dottheory.UiState', '10': 'ui'},
    {'1': 'particles', '3': 3, '4': 3, '5': 11, '6': '.dottheory.AppState.ParticlesEntry', '10': 'particles'},
  ],
  '3': [AppState_ParticlesEntry$json],
};

@$core.Deprecated('Use appStateDescriptor instead')
const AppState_ParticlesEntry$json = {
  '1': 'ParticlesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.dottheory.Particle2D', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `AppState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List appStateDescriptor = $convert.base64Decode('CghBcHBTdGF0ZRImCgRkYXRhGAEgASgLMhIuZG90dGhlb3J5LkRvdERhdGFSBGRhdGESIgoCdW'
    'kYAiABKAsyEi5kb3R0aGVvcnkuVWlTdGF0ZVICdWkSQAoJcGFydGljbGVzGAMgAygLMiIuZG90'
    'dGhlb3J5LkFwcFN0YXRlLlBhcnRpY2xlc0VudHJ5UglwYXJ0aWNsZXMaUwoOUGFydGljbGVzRW'
    '50cnkSEAoDa2V5GAEgASgJUgNrZXkSKwoFdmFsdWUYAiABKAsyFS5kb3R0aGVvcnkuUGFydGlj'
    'bGUyRFIFdmFsdWU6AjgB');
