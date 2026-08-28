abstract class DoctorState {}

class MedicineInitial extends DoctorState {}

class MedicineLoading extends DoctorState {}

class MedicineLoaded extends DoctorState {
  // final List<Medicine> medicines;

  // MedicineLoaded(this.medicines);
}

class MedicineSuccess extends DoctorState {
  final String message;

  MedicineSuccess(this.message);
}

class MedicineError extends DoctorState {
  final String message;

  MedicineError(this.message);
}

class MedicineAdded extends DoctorState {}

class MedicineFormUpdated extends DoctorState {}
