import 'package:get/get.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/resources/utils/datetimeFormat.dart';
import 'package:vet_app/src/calendar/data/calendarRepository.dart';
import 'package:vet_app/src/calendar/data/model/calendarBookingModel.dart';
import 'package:vet_app/src/calendar/data/model/calendarEventModel.dart';
import 'package:vet_app/src/calendar/data/model/calendarNextdateModel.dart';
import 'package:vet_app/src/calendar/data/model/listBookingsModel.dart';

class CalendarController extends GetxController {
  final _repo = CalendarRepository();

  var calendarBookings = <CalendarBooking>[].obs;
  var calendarNextdates = <CalendarNextdate>[].obs;
  var calendarEvents = <CalendarEvent>[].obs;

  var today = DateTime.now();
  var dateString = ''.obs;

  var valueMonth = DateTime.now().month.obs;
  var valueYear = DateTime.now().year.obs;

  var daysPerMonth = 0.obs;
  
  var listCalendarBooking= List<dynamic>(32).obs;
  var listCalendarNextDate= List<dynamic>(32).obs;
  var listCalendarEvent= List<dynamic>(32).obs;

  @override
  void onInit() {
    super.onInit();
    dateString.value = formatDateBasic(today);
    daysPerMonth.value = DateTime(valueYear.value, (valueMonth.value + 1), 0).day;

    listCalendarBookings(today);
    listCalendarNextdate(today);
    listCalendarEvents(today);
  }

  monthMore(){
    if (valueMonth.value < 12) {
      valueMonth.value = valueMonth.value + 1;
      daysPerMonth.value = DateTime(valueYear.value, (valueMonth.value + 1), 0).day;
      
    } else {
      valueYear.value = valueYear.value + 1;
      valueMonth.value = 1;
      daysPerMonth.value = DateTime(valueYear.value, (valueMonth.value + 1), 0).day;
    }

    var dateC = DateTime(valueYear.value, valueMonth.value, 1);
    listCalendarBookings(dateC);
    listCalendarNextdate(dateC);
    listCalendarEvents(dateC);
  }

  monthLess(){
    if (valueMonth.value > 1) {
      valueMonth.value = valueMonth.value - 1;
      daysPerMonth.value = DateTime(valueYear.value, (valueMonth.value + 1), 0).day;
      
    } else {
      valueYear.value = valueYear.value - 1;
      valueMonth.value = 12;
      daysPerMonth.value = DateTime(valueYear.value, (valueMonth.value + 1), 0).day;
    }

    var dateC = DateTime(valueYear.value, valueMonth.value, 1);
    listCalendarBookings(dateC);
    listCalendarNextdate(dateC);
    listCalendarEvents(dateC);
  }

  listCalendarBookings(date)=>_listCalendarBookings(date);
  _listCalendarBookings(date) async {
    final response = await _repo.listCalendarBookings(prefUser.vetId, formatDateYM(date));
    
    listCalendarBooking.clear();
    listCalendarBooking.length = 32;
    
    if(response!=null){
      response.result.forEach((key,value){
        listCalendarBooking[toDateBasic(key).day] = value;
      });
    }
  }

  listCalendarNextdate(date)=>_listCalendarNextdate(date);
  _listCalendarNextdate(date) async {
    final response = await _repo.listCalendarNextdate(prefUser.vetId, formatDateYM(date));
    
    listCalendarNextDate.clear();
    listCalendarNextDate.length = 32;
    
    if(response!=null){
      response.result.forEach((key,value){
        listCalendarNextDate[toDateBasic(key).day] = value;
      });
    }
  }

  listCalendarEvents(date)=>_listCalendarEvents(date);
  _listCalendarEvents(date) async {
    final response = await _repo.listCalendarEvents(prefUser.vetId, formatDateYM(date));
    
    listCalendarEvent.clear();
    listCalendarEvent.length = 32;
    
    if(response!=null){
      response.result.forEach((key,value){
        listCalendarEvent[toDateBasic(key).day] = value;
      });
    }
  }
}
