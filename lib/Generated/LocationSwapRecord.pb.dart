//
//  Generated code. Do not modify.
//  source: LocationSwapRecord.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'ProtoOffset.pb.dart' as $0;

class LocationSwapRecord extends $pb.GeneratedMessage {
  factory LocationSwapRecord({
    $0.ProtoOffset? start,
    $0.ProtoOffset? end,
    $fixnum.Int64? time,
  }) {
    final $result = create();
    if (start != null) {
      $result.start = start;
    }
    if (end != null) {
      $result.end = end;
    }
    if (time != null) {
      $result.time = time;
    }
    return $result;
  }

  LocationSwapRecord._() : super();

  factory LocationSwapRecord.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory LocationSwapRecord.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LocationSwapRecord',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'dottheory'), createEmptyInstance: create)
    ..aOM<$0.ProtoOffset>(1, _omitFieldNames ? '' : 'start', subBuilder: $0.ProtoOffset.create)
    ..aOM<$0.ProtoOffset>(2, _omitFieldNames ? '' : 'end', subBuilder: $0.ProtoOffset.create)
    ..aInt64(3, _omitFieldNames ? '' : 'time')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LocationSwapRecord clone() => LocationSwapRecord()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LocationSwapRecord copyWith(void Function(LocationSwapRecord) updates) =>
      super.copyWith((message) => updates(message as LocationSwapRecord)) as LocationSwapRecord;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LocationSwapRecord create() => LocationSwapRecord._();

  LocationSwapRecord createEmptyInstance() => create();

  static $pb.PbList<LocationSwapRecord> createRepeated() => $pb.PbList<LocationSwapRecord>();

  @$core.pragma('dart2js:noInline')
  static LocationSwapRecord getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LocationSwapRecord>(create);
  static LocationSwapRecord? _defaultInstance;

  @$pb.TagNumber(1)
  $0.ProtoOffset get start => $_getN(0);

  @$pb.TagNumber(1)
  set start($0.ProtoOffset v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStart() => $_has(0);

  @$pb.TagNumber(1)
  void clearStart() => clearField(1);

  @$pb.TagNumber(1)
  $0.ProtoOffset ensureStart() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.ProtoOffset get end => $_getN(1);

  @$pb.TagNumber(2)
  set end($0.ProtoOffset v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEnd() => $_has(1);

  @$pb.TagNumber(2)
  void clearEnd() => clearField(2);

  @$pb.TagNumber(2)
  $0.ProtoOffset ensureEnd() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get time => $_getI64(2);

  @$pb.TagNumber(3)
  set time($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTime() => $_has(2);

  @$pb.TagNumber(3)
  void clearTime() => clearField(3);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
