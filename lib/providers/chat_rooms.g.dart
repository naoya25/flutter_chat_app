// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_rooms.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatRoomsNotifierHash() => r'f6691a3e1782a4321112c4ad33ed7c173931b40c';

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

abstract class _$ChatRoomsNotifier
    extends BuildlessAutoDisposeStreamNotifier<List<RoomModel>> {
  late final String userId;

  Stream<List<RoomModel>> build(
    String userId,
  );
}

/// See also [ChatRoomsNotifier].
@ProviderFor(ChatRoomsNotifier)
const chatRoomsNotifierProvider = ChatRoomsNotifierFamily();

/// See also [ChatRoomsNotifier].
class ChatRoomsNotifierFamily extends Family<AsyncValue<List<RoomModel>>> {
  /// See also [ChatRoomsNotifier].
  const ChatRoomsNotifierFamily();

  /// See also [ChatRoomsNotifier].
  ChatRoomsNotifierProvider call(
    String userId,
  ) {
    return ChatRoomsNotifierProvider(
      userId,
    );
  }

  @override
  ChatRoomsNotifierProvider getProviderOverride(
    covariant ChatRoomsNotifierProvider provider,
  ) {
    return call(
      provider.userId,
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
  String? get name => r'chatRoomsNotifierProvider';
}

/// See also [ChatRoomsNotifier].
class ChatRoomsNotifierProvider extends AutoDisposeStreamNotifierProviderImpl<
    ChatRoomsNotifier, List<RoomModel>> {
  /// See also [ChatRoomsNotifier].
  ChatRoomsNotifierProvider(
    String userId,
  ) : this._internal(
          () => ChatRoomsNotifier()..userId = userId,
          from: chatRoomsNotifierProvider,
          name: r'chatRoomsNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chatRoomsNotifierHash,
          dependencies: ChatRoomsNotifierFamily._dependencies,
          allTransitiveDependencies:
              ChatRoomsNotifierFamily._allTransitiveDependencies,
          userId: userId,
        );

  ChatRoomsNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Stream<List<RoomModel>> runNotifierBuild(
    covariant ChatRoomsNotifier notifier,
  ) {
    return notifier.build(
      userId,
    );
  }

  @override
  Override overrideWith(ChatRoomsNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChatRoomsNotifierProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<ChatRoomsNotifier, List<RoomModel>>
      createElement() {
    return _ChatRoomsNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatRoomsNotifierProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChatRoomsNotifierRef
    on AutoDisposeStreamNotifierProviderRef<List<RoomModel>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _ChatRoomsNotifierProviderElement
    extends AutoDisposeStreamNotifierProviderElement<ChatRoomsNotifier,
        List<RoomModel>> with ChatRoomsNotifierRef {
  _ChatRoomsNotifierProviderElement(super.provider);

  @override
  String get userId => (origin as ChatRoomsNotifierProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
