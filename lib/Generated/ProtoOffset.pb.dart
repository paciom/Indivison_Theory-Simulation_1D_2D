//
//  Generated code. Do not modify.
//  source: ProtoOffset.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ProtoOffset extends $pb.GeneratedMessage {
  factory ProtoOffset({
    $core.double? dx,
    $core.double? dy,
  }) {
    final $result = create();
    if (dx != null) {
      $result.dx = dx;
    }
    if (dy != null) {
      $result.dy = dy;
    }
    return $result;
  }

  ProtoOffset._() : super();

  factory ProtoOffset.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);

  factory ProtoOffset.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ProtoOffset',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'dottheory'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'dx', $pb.PbFieldType.OD)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'dy', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ProtoOffset clone() => ProtoOffset()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ProtoOffset copyWith(void Function(ProtoOffset) updates) => super.copyWith((message) => updates(message as ProtoOffset)) as ProtoOffset;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoOffset create() => ProtoOffset._();

  ProtoOffset createEmptyInstance() => create();

  static $pb.PbList<ProtoOffset> createRepeated() => $pb.PbList<ProtoOffset>();

  @$core.pragma('dart2js:noInline')
  static ProtoOffset getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProtoOffset>(create);
  static ProtoOffset? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get dx => $_getN(0);

  @$pb.TagNumber(1)
  set dx($core.double v) {
    $_setDouble(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDx() => $_has(0);

  @$pb.TagNumber(1)
  void clearDx() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get dy => $_getN(1);

  @$pb.TagNumber(2)
  set dy($core.double v) {
    $_setDouble(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDy() => $_has(1);

  @$pb.TagNumber(2)
  void clearDy() => clearField(2);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
