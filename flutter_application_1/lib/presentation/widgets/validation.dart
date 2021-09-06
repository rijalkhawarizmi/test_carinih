
String? validateEmail(String? email) {
    if (email!.isEmpty) {
      return 'Email harus diisi';
    }
    return null;
  }

  String? validatePass(String? pass) {
    if (pass!.isEmpty) {
      return 'Password haru diisi';
    }
    return null;
  }

  String? validateTitle(String? email) {
    if (email!.isEmpty) {
      return 'Judul harus diisi';
    }
    return null;
  }

  String? validateDesc(String? pass) {
    if (pass!.isEmpty) {
      return 'Deskripsi harus diisi';
    }
    return null;
  }

