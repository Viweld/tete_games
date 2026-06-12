part of 'airports_mappers.dart';

extension TerminalDtoMapper on TerminalDto {
  Terminal get toModel => Terminal(id: id, name: name ?? '', ordering: ordering ?? 0);
}
