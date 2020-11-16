library utilities;

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
