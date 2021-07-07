import 'dart:convert';

FinalizeAttention finalizeAttentionFromJson(String str) =>
    FinalizeAttention.fromJson(json.decode(str));

String finalizeAttentionToJson(FinalizeAttention data) =>
    json.encode(data.toJson());

class FinalizeAttention {
  FinalizeAttention(
      {this.weight,
      this.temperature,
      this.heartRhythm,
      this.bodyCondition,
      this.consultationNotificationNextdate,
      this.consultationNotificationReason,
      this.consultationNotificationObservation,
      this.dewormingNotificationNextdate,
      this.dewormingNotificationReason,
      this.dewormingNotificationObservation,
      this.groomingNotificationNextdate,
      this.groomingNotificationReason,
      this.groomingNotificationObservation,
      this.vaccinationNotificationNextdate,
      this.vaccinationNotificationReason,
      this.vaccinationNotificationObservation});

  double? weight;
  double? temperature;
  double? heartRhythm;
  String? bodyCondition;
  String? consultationNotificationNextdate;
  String? consultationNotificationReason;
  String? consultationNotificationObservation;
  String? dewormingNotificationNextdate;
  String? dewormingNotificationReason;
  String? dewormingNotificationObservation;
  String? groomingNotificationNextdate;
  String? groomingNotificationReason;
  String? groomingNotificationObservation;
  String? vaccinationNotificationNextdate;
  String? vaccinationNotificationReason;
  String? vaccinationNotificationObservation;

  factory FinalizeAttention.fromJson(Map<String, dynamic> json) =>
      FinalizeAttention(
        weight: json['weight'].toDouble() ?? 0.0,
        temperature: json['temperature'],
        heartRhythm: json['heart_rhythm'],
        bodyCondition: json['body_condition'],
        consultationNotificationNextdate:
            json['consultation_notification_nextdate'],
        consultationNotificationReason:
            json['consultation_notification_reason'],
        consultationNotificationObservation:
            json['consultation_notification_observation'],
        dewormingNotificationNextdate: json['deworming_notification_nextdate'],
        dewormingNotificationReason: json['deworming_notification_reason'],
        dewormingNotificationObservation:
            json['deworming_notification_observation'],
        groomingNotificationNextdate: json['grooming_notification_nextdate'],
        groomingNotificationReason: json['grooming_notification_reason'],
        groomingNotificationObservation:
            json['grooming_notification_observation'],
        vaccinationNotificationNextdate:
            json['vaccination_notification_nextdate'],
        vaccinationNotificationReason: json['vaccination_notification_reason'],
        vaccinationNotificationObservation:
            json['vaccination_notification_observation'],
      );

  Map<String, dynamic> toJson() => {
        'weight': weight,
        'temperature': temperature,
        'heart_rhythm': heartRhythm,
        'body_condition': bodyCondition,
        'consultation_notification_nextdate': consultationNotificationNextdate,
        'consultation_notification_reason': consultationNotificationReason,
        'consultation_notification_observation':
            consultationNotificationObservation,
        'deworming_notification_nextdate': dewormingNotificationNextdate,
        'deworming_notification_reason': dewormingNotificationReason,
        'deworming_notification_observation': dewormingNotificationObservation,
        'grooming_notification_nextdate': groomingNotificationNextdate,
        'grooming_notification_reason': groomingNotificationReason,
        'grooming_notification_observation': groomingNotificationObservation,
        'vaccination_notification_nextdate': vaccinationNotificationNextdate,
        'vaccination_notification_reason': vaccinationNotificationReason,
        'vaccination_notification_observation':
            vaccinationNotificationObservation,
      };
}
