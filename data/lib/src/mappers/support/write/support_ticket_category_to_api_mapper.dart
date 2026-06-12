part of '../support_mappers.dart';

extension TicketCategoryTypeApiMapper on TicketCategoryType {
  String toApi() => switch (this) {
    TicketCategoryType.fastTrack => 'fast_track',
    TicketCategoryType.vipLounge => 'vip_lounge',
    TicketCategoryType.transfer => 'transfer',
    TicketCategoryType.meetAssist => 'meet_assist',
    TicketCategoryType.other => 'other',
  };
}
