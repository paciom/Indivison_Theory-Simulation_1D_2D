//
//  Generated code. Do not modify.
//  source: ProtoSize.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ProtoSize extends $pb.GeneratedMessage {
  factory ProtoSize({
    $core.double? width,
    $core.double? height,
  }) {
    final $result = create();
    if (width != null) {
      $result.width = width;
    }
    if (height != null) {
      $result.height = height;
    }
    return $result;
  }

  ProtoSize._() : super();

  factory ProtoSize.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);

  factory ProtoSize.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ProtoSize',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'dottheory'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'width', $pb.PbFieldType.OD)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'height', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ProtoSize clone() => ProtoSize()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ProtoSize copyWith(void Function(ProtoSize) updates) => super.copyWith((message) => updates(message as ProtoSize)) as ProtoSize;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoSize create() => ProtoSize._();

  ProtoSize createEmptyInstance() => create();

  static $pb.PbList<ProtoSize> createRepeated() => $pb.PbList<ProtoSize>();

  @$core.pragma('dart2js:noInline')
  static ProtoSize getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProtoSize>(create);
  static ProtoSize? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get width => $_getN(0);

  @$pb.TagNumber(1)
  set width($core.double v) {
    $_setDouble(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasWidth() => $_has(0);

  @$pb.TagNumber(1)
  void clearWidth() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get height => $_getN(1);

  @$pb.TagNumber(2)
  set height($core.double v) {
    $_setDouble(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasHeight() => $_has(1);

  @$pb.TagNumber(2)
  void clearHeight() => clearField(2);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
