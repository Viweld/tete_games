import 'package:core/core.dart';

/// A utility that allows applying different [EventTransformer]s based on the event type.
/// [mapping] is a map where the key is the event [Type] and the value is the corresponding [EventTransformer].
/// Events matching a type in the mapping will be processed using the associated transformer,
/// while all other events will be processed sequentially.
EventTransformer<E> applyTransformersByEventType<E>(Map<Type, EventTransformer<E>> mapping) {
  return (Stream<E> events, EventMapper<E> mapper) {
    final List<Stream<E>> streams = <Stream<E>>[];

    mapping.forEach((Type type, EventTransformer<E> transformer) {
      final Stream<E> matched = events.where((E e) => e.runtimeType == type);

      streams.add(transformer(matched, mapper));
    });

    final Stream<E> others = events.where((E e) => !mapping.containsKey(e.runtimeType));

    streams.add(others.asyncExpand(mapper));

    return StreamGroup.merge(streams);
  };
}
