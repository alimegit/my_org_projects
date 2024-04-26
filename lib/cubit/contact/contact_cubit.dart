import 'package:default_project/data/local/locals.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/contact_model.dart';

class ContactCubit extends Cubit<List<ContactModel>> {
  ContactCubit() : super(allContacts);
}