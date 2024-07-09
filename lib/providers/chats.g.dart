// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chats.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatsNotifierHash() => r'2da7294798e56ca11d3d9712082b08f6e52d3868';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ChatsNotifier
    extends BuildlessAutoDisposeStreamNotifier<List<types.Message>> {
  late final String roomId;

  Stream<List<types.Message>> build(
    String roomId,
  );
}

/// See also [ChatsNotifier].
@ProviderFor(ChatsNotifier)
const chatsNotifierProvider = ChatsNotifierFamily();

/// See also [ChatsNotifier].
class ChatsNotifierFamily extends Family<AsyncValue<List<types.Message>>> {
  /// See also [ChatsNotifier].
  const ChatsNotifierFamily();

  /// See also [ChatsNotifier].
  ChatsNotifierProvider call(
    String roomId,
  ) {
    return ChatsNotifierProvider(
      roomId,
    );
  }

  @override
  ChatsNotifierProvider getProviderOverride(
    covariant ChatsNotifierProvider provider,
  ) {
    return call(
      provider.roomId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'chatsNotifierProvider';
}

/// See also [ChatsNotifier].
class ChatsNotifierProvider extends AutoDisposeStreamNotifierProviderImpl<
    ChatsNotifier, List<types.Message>> {
  /// See also [ChatsNotifier].
  ChatsNotifierProvider(
    String roomId,
  ) : this._internal(
          () => ChatsNotifier()..roomId = roomId,
          from: chatsNotifierProvider,
          name: r'chatsNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chatsNotifierHash,
          dependencies: ChatsNotifierFamily._dependencies,
          allTransitiveDependencies:
              ChatsNotifierFamily._allTransitiveDependencies,
          roomId: roomId,
        );

  ChatsNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.roomId,
  }) : super.internal();

  final String roomId;

  @override
  Stream<List<types.Message>> runNotifierBuild(
    covariant ChatsNotifier notifier,
  ) {
    return notifier.build(
      roomId,
    );
  }

  @override
  Override overrideWith(ChatsNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChatsNotifierProvider._internal(
        () => create()..roomId = roomId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        roomId: roomId,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<ChatsNotifier, List<types.Message>>
      createElement() {
    return _ChatsNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatsNotifierProvider && other.roomId == roomId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, roomId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChatsNotifierRef
    on AutoDisposeStreamNotifierProviderRef<List<types.Message>> {
  /// The parameter `roomId` of this provider.
  String get roomId;
}

class _ChatsNotifierProviderElement
    extends AutoDisposeStreamNotifierProviderElement<ChatsNotifier,
        List<types.Message>> with ChatsNotifierRef {
  _ChatsNotifierProviderElement(super.provider);

  @override
  String get roomId => (origin as ChatsNotifierProvider).roomId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
