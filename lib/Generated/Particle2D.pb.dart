//
//  Generated code. Do not modify.
//  source: Particle2D.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'Dot2D.pb.dart' as $0;

class Particle2D extends $pb.GeneratedMessage {
  factory Particle2D({
    $core.Iterable<$0.Dot2D>? dots,
  }) {
    final $result = create();
    if (dots != null) {
      $result.dots.addAll(dots);
    }
    return $result;
  }

  Particle2D._() : super();

  factory Particle2D.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);

  factory Particle2D.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Particle2D',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'dottheory'), createEmptyInstance: create)
    ..pc<$0.Dot2D>(1, _omitFieldNames ? '' : 'dots', $pb.PbFieldType.PM, subBuilder: $0.Dot2D.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Particle2D clone() => Particle2D()..mergeFromMessage(this);

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Particle2D copyWith(void Function(Particle2D) updates) => super.copyWith((message) => updates(message as Particle2D)) as Particle2D;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Particle2D create() => Particle2D._();

  Particle2D createEmptyInstance() => create();

  static $pb.PbList<Particle2D> createRepeated() => $pb.PbList<Particle2D>();

  @$core.pragma('dart2js:noInline')
  static Particle2D getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Particle2D>(create);
  static Particle2D? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.Dot2D> get dots => $_getList(0);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
