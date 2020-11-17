library utilities;

///////////////////////////////////////////////////
/// Credit Card Error Generation
///////////////////////////////////////////////////

String generateAllCardErrors(name, number, date, code, zip) {
  if (generateNameError(name) != '') {
    return generateNameError(name);
  } else if (generateCardNumberError(number) != '') {
    return generateCardNumberError(number);
  } else if (generateCardDateError(date) != '') {
    return generateCardDateError(date);
  } else if (generateCardCodeError(code) != '') {
    return generateCardCodeError(code);
  } else if (generateCardZipError(zip) != '') {
    return generateCardZipError(zip);
  } else {
    return '';
  }
}

String generateCardNumberError(number) {
  number = number.replaceAll(' ', '');
  if (number == '') {
    return 'Card number cannot be empty';
  } else if (!RegExp(r'[\d]{12,}').hasMatch(number) ||
      double.parse(number, (e) => null) == null) {
    return 'Please enter a valid card number';
  } else {
    return '';
  }
}

String generateCardDateError(date) {
  if (date == '') {
    return 'Date cannot be empty';
  } else if (!RegExp(r'^(0?[1-9]|1[0-2])/(0?[1-9]|[12][0-9]|3[01])$')
      .hasMatch(date)) {
    return 'Date must be MM/YY';
  } else {
    return '';
  }
}

String generateCardCodeError(code) {
  if (code == '') {
    return 'Security code cannot be empty';
  } else if (!RegExp(r'[\d]{3}').hasMatch(code) ||
      double.parse(code, (e) => null) == null) {
    return 'Please enter a valid security code';
  } else {
    return '';
  }
}

String generateCardZipError(zip) {
  if (zip == '') {
    return 'Zip code cannot be empty';
  } else if (!RegExp(r'[\d]{5,}').hasMatch(zip) ||
      double.parse(zip, (e) => null) == null) {
    return 'Please enter a valid zip code';
  } else {
    return '';
  }
}

///////////////////////////////////////////////////
/// User Input Error Generation
///////////////////////////////////////////////////

String generateNameError(name) {
  if (name == '') {
    return 'Name cannot be empty';
  } else {
    return '';
  }
}

String generateBarcodeError(barcode) {
  if (barcode == '') {
    return 'Barcode cannot be empty';
  } else if (!RegExp(r'[\d]{5,}').hasMatch(barcode) ||
      double.parse(barcode, (e) => null) == null) {
    return 'Please enter a valid barcode';
  } else {
    return '';
  }
}

String generateEmailError(email) {
  if (email == '') {
    return 'Email field cannot be empty';
  } else if (!RegExp(r'.+\@.+\..+').hasMatch(email)) {
    return 'Please enter a valid email';
  } else {
    return '';
  }
}

String generateWebsiteError(website) {
  if (website == '') {
    return 'Website cannot be empty';
  } else if (!RegExp(
          r'(https?:\/\/)?([\w\-])+\.{1}([a-zA-Z]{2,63})([\/\w-]*)*\/?\??([^#\n\r]*)?#?([^\n\r]*)')
      .hasMatch(website)) {
    return 'Please enter a valid website';
  } else {
    return '';
  }
}

String formatBarcode(id) {
  String newId = id;
  while (newId.length > 0 && newId[0] == '0') {
    newId = newId.substring(1);
  }
  return newId;
}

String generatePhoneError(phone) {
  if (phone == '') {
    return 'Phone number cannot be empty';
  } else if (!RegExp(
          r'((\(\d{3}\)?)|(\d{3}))([\s-./]?)(\d{3})([\s-./]?)(\d{4})')
      .hasMatch(phone)) {
    return 'Please enter a valid phone number';
  } else {
    return '';
  }
}

String generateAddressError(address) {
  if (address == '') {
    return 'Address number cannot be empty';
  } else if (!RegExp(r'^\d+\s[A-z]+\s[A-z]+').hasMatch(address)) {
    return 'Please enter a valid address';
  } else {
    return '';
  }
}

String generatePriceError(price) {
  if (price == '') {
    return 'Price cannot be empty';
  } else if (!RegExp(r'^\$?[0-9]+\.?[0-9]?[0-9]?$').hasMatch(price)) {
    return 'Please enter a valid price';
  } else {
    return '';
  }
}

String generateQuantityError(quantity) {
  if (quantity == '') {
    return 'Quantity cannot be empty';
  } else if (double.tryParse(quantity) == null) {
    return 'Please enter a number';
  } else if (!RegExp(r'^\d+$').hasMatch(quantity)) {
    return 'Please enter a valid integer';
  } else {
    return '';
  }
}
