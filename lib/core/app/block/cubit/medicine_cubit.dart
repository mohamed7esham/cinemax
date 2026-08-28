// import 'package:doctor_hunt/apps/core/app/block/cubit/medicine_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class MedicineCubit extends Cubit<DoctorState> {
//   MedicineCubit() : super(MedicineInitial());

  //================================================
  // VARIABLES
  //================================================

  // final formKey = GlobalKey<FormState>();

  // final TextEditingController nameController = TextEditingController();

  // List<Medicine> allMedicines = [];

  // List<Medicine> filteredMedicines = [];

  // DateTime currentSelectedDate = DateTime.now();

  // DateTime selectedDate = DateTime.now();

  // TimeOfDay? selectedTime;

  // bool repeatDaily = false;

  // String? imagePath;

  // //================================================
  // // PUBLIC methods
  // //================================================

  // void setLoading() {
  //   emit(MedicineLoading());
  //   debugPrint("=================MedicineLoading=================");
  // }

  // void setLoaded(List<Medicine> medicines) {
  //   emit(MedicineLoaded(medicines));
  //   debugPrint("=================MedicineLoaded=================");
  // }

  // void setSuccess(String message) {
  //   emit(MedicineSuccess(message));
  //   debugPrint("=================MedicineSuccess=================");
  // }

  // void setError(String message) {
  //   emit(MedicineError(message));
  //   debugPrint("=================MedicineError: $message=================");
  // }

  // void setFormUpdated() {
  //   emit(MedicineFormUpdated());
  //   debugPrint("=================MedicineFormUpdated=================");
  // }

  // //================================================
  // // LOAD
  // //================================================

  // Future<void> loadMedicines() async {
  //   await LoadMedicines.execute(this);
  // }

  // //================================================
  // // ADD
  // //================================================

  // Future<void> addMedicine(BuildContext context) async {
  //   await AddMedicine.execute(this, context);
  // }

  // //================================================
  // // UPDATE
  // //================================================

  // Future<void> updateMedicine(BuildContext context, int medicineId) async {
  //   await UpdateMedicine.execute(this, context, medicineId);
  // }

  // //================================================
  // // DELETE
  // //================================================

  // Future<void> deleteMedicine(int id) async {
  //   await DeleteMedicine.execute(this, id);
  // }

  // //================================================
  // // FILTER
  // //================================================

  // void filterByDate(DateTime date) {
  //   FilterMedicines.execute(this, date);
  // }

  // //================================================
  // // FORM
  // //================================================

  // void clearForm() {
  //   ClearForm.execute(this);
  //   debugPrint("=================ClearForm=================");
  // }

  // void loadMedicineForEdit(Medicine medicine) {
  //   LoadEditData.execute(this, medicine);
  //   debugPrint("=================LoadEditData=================");
  // }

  // //================================================
  // // PICKERS
  // //================================================

  // Future<void> pickDate(BuildContext context) async {
  //   await PickDate.execute(this, context);
  // }

  // Future<void> pickTime(BuildContext context) async {
  //   await PickTime.execute(this, context);
  // }

  // void emitFormUpdate() {
  //   emit(MedicineFormUpdated());
  // }

  // //================================================
  // // SETTERS
  // //================================================

  // void changeRepeat(bool value) {
  //   repeatDaily = value;

  //   emit(MedicineFormUpdated());
  // }

  // void changeImage(String? path) {
  //   imagePath = path;

  //   emit(MedicineFormUpdated());
  // }

  // //================================================
  // // getters
  // //================================================
  // String get selectedTimeText {
  //   if (selectedTime == null) {
  //     return "Select Time";
  //   }

  //   return selectedTime!.format(navigatorKey.currentContext!);
  // }

  // String get selectedDateText {
  //   return selectedDate.toString().split(' ')[0];
  // }

  // //================================================
  // // DISPOSE
  // //================================================

  // @override
  // Future<void> close() {
  //   nameController.dispose();

  //   return super.close();
  // }
// }
