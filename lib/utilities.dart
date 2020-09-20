library utilities;

///////////////////////////////////////////////////
/// User Input Error Generation
///////////////////////////////////////////////////

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