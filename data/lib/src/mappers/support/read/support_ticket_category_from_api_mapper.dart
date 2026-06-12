part of '../support_mappers.dart';

TicketCategoryType mapTicketCategoryFromApi(String value) => switch (value) {
  'fast_track' => TicketCategoryType.fastTrack,
  'vip_lounge' => TicketCategoryType.vipLounge,
  'transfer' => TicketCategoryType.transfer,
  'meet_assist' => TicketCategoryType.meetAssist,
  'other' => TicketCategoryType.other,
  _ => TicketCategoryType.other,
};
