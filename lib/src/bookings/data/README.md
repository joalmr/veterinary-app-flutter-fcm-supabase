String? consultationNotifica;
String? dewormingNotifica;
String? groomingNotifica;
String? vaccinationNotifica;

String jsonInputString =
        '''"weight": ${finaliza.weight},"temperature": ${finaliza.temperature},"heart_rhythm": ${finaliza.heartRhythm},"body_condition": ${finaliza.bodyCondition},''';

    if (finaliza.consultationNotificationNextdate != null) {
      consultationNotifica =
          '''"consultation_notification_nextdate": ${finaliza.consultationNotificationNextdate!}, "consultation_notification_reason": ${finaliza.consultationNotificationReason!}, "consultation_notification_observation": ${finaliza.consultationNotificationObservation!},''';
      jsonInputString += consultationNotifica;
    }

    if (finaliza.dewormingNotificationNextdate != null) {
      dewormingNotifica =
          '''"deworming_notification_nextdate": ${finaliza.dewormingNotificationNextdate!},"deworming_notification_reason": ${finaliza.dewormingNotificationReason!},"deworming_notification_observation": ${finaliza.dewormingNotificationObservation!},''';
      jsonInputString += dewormingNotifica;
    }

    if (finaliza.groomingNotificationNextdate != null) {
      groomingNotifica =
          '''"grooming_notification_nextdate":${finaliza.groomingNotificationNextdate!},"grooming_notification_reason": ${finaliza.groomingNotificationReason!},"grooming_notification_observation": ${finaliza.groomingNotificationObservation!},''';
      jsonInputString += groomingNotifica;
    }

    if (finaliza.vaccinationNotificationNextdate != null) {
      vaccinationNotifica =
          '''"vaccination_notification_nextdate":${finaliza.vaccinationNotificationNextdate!},"vaccination_notification_reason":${finaliza.vaccinationNotificationReason!},"vaccination_notification_observation":${finaliza.vaccinationNotificationObservation!},''';
      jsonInputString += vaccinationNotifica;
    }