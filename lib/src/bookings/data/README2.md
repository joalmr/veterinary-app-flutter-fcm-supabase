
    Map<String, dynamic> generalData = {
      'weight': finaliza.weight,
      'temperature': finaliza.temperature,
      'heart_rhythm': finaliza.heartRhythm,
      'body_condition': finaliza.bodyCondition,
    };

    Map<String, dynamic>? consultationNotifica;
    Map<String, dynamic>? dewormingNotifica;
    Map<String, dynamic>? groomingNotifica;
    Map<String, dynamic>? vaccinationNotifica;

    String request;

    request = jsonEncode(generalData);

    if (finaliza.consultationNotificationNextdate != null) {
      consultationNotifica = {
        'consultation_notification_nextdate':
            finaliza.consultationNotificationNextdate!,
        'consultation_notification_reason':
            finaliza.consultationNotificationReason!,
        'consultation_notification_observation':
            finaliza.consultationNotificationObservation!,
      };

      request += jsonEncode(consultationNotifica);
    }

    if (finaliza.dewormingNotificationNextdate != null) {
      dewormingNotifica = {
        'deworming_notification_nextdate':
            finaliza.dewormingNotificationNextdate!,
        'deworming_notification_reason': finaliza.dewormingNotificationReason!,
        'deworming_notification_observation':
            finaliza.dewormingNotificationObservation!,
      };
      request += jsonEncode(dewormingNotifica);
    }

    if (finaliza.groomingNotificationNextdate != null) {
      groomingNotifica = {
        'grooming_notification_nextdate':
            finaliza.groomingNotificationNextdate!,
        'grooming_notification_reason': finaliza.groomingNotificationReason!,
        'grooming_notification_observation':
            finaliza.groomingNotificationObservation!,
      };
      request += jsonEncode(groomingNotifica);
    }

    if (finaliza.vaccinationNotificationNextdate != null) {
      vaccinationNotifica = {
        'vaccination_notification_nextdate':
            finaliza.vaccinationNotificationNextdate!,
        'vaccination_notification_reason':
            finaliza.vaccinationNotificationReason!,
        'vaccination_notification_observation':
            finaliza.vaccinationNotificationObservation!,
      };
      request += jsonEncode(vaccinationNotifica);
    }