String? phoneValidator(val) {
  if (val.isEmpty) {
    return "* Phone is required";
  } else if (val.length != 12) {
    return "* Phone must be at least 12 digits";
  } else if (!val.startsWith("01")) {
    return "* Phone must start with 01";
  }
  return null;
}

String? emailValidator(val) {
  if (val.isEmpty) {
    return "* Email is required";
  } else if (!val.endsWith("@gmail.com")) {
    return "* Email must end with @gmail.com";
  } else if (val.length <= 10) {
    return "* Email must have at least on char before @gmail.com";
  }
  return null;
}

String? passwordValidator(val) {
  if (val.isEmpty) {
    return "* Password is required";
  } else if (val.length <= 7) {
    return "* Password must be at least 7 chars";
  }
  return null;
}

String? confirmPassword(val) {
  if (val.isEmpty) {
    return "* Confirm Password is required";
  }  else if (val.length <= 7) {
    return "* Confirm Password must be at least 7 chars";
  }
  return null;
}

String? nameValidator(val) {
  if (val.isEmpty) {
    return "* Name is required";
  } else if (val.length < 3) {
    return "* Name must be at least 3 digits";
  }
  return null;
}