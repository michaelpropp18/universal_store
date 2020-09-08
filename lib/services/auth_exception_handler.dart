enum AuthResultStatus {
  successful,
  emailAlreadyExists,
  wrongPassword,
  invalidEmail,
  userNotFound,
  userDisabled,
  operationNotAllowed,
  tooManyRequests,
  networkError,
  undefined,
}

class AuthExceptionHandler {
  static getException(e) {
    print(e.code);
    var status;
    switch (e.code) {
      case "ERROR_INVALID_EMAIL":
        status = AuthResultStatus.invalidEmail;
        break;
      case "ERROR_WRONG_PASSWORD":
        status = AuthResultStatus.wrongPassword;
        break;
      case "ERROR_USER_NOT_FOUND":
        status = AuthResultStatus.userNotFound;
        break;
      case "ERROR_USER_DISABLED":
        status = AuthResultStatus.userDisabled;
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        status = AuthResultStatus.tooManyRequests;
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        status = AuthResultStatus.operationNotAllowed;
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        status = AuthResultStatus.emailAlreadyExists;
        break;
      case "ERROR_NETWORK_REQUEST_FAILED":
        status = AuthResultStatus.networkError;
        break;
      default:
        status = AuthResultStatus.undefined;
        break;
    }
    return status;
  }

  static generateExceptionMessage(exceptionCode) {
    String errorMessage;
    switch (exceptionCode) {
      case AuthResultStatus.invalidEmail:
        errorMessage = "Invalid Email";
        break;
      case AuthResultStatus.wrongPassword:
        errorMessage = "Username or password is incorrect";
        break;
      case AuthResultStatus.userNotFound:
        errorMessage = "No registered account with that email";
        break;
      case AuthResultStatus.userDisabled:
        errorMessage = "User with this email has been disabled";
        break;
      case AuthResultStatus.tooManyRequests:
        errorMessage = "Too many requests. Try again later";
        break;
      case AuthResultStatus.operationNotAllowed:
        errorMessage = "Signing in with Email and Password is not enabled";
        break;
      case AuthResultStatus.emailAlreadyExists:
        errorMessage = "This email is already taken";
        break;
      case AuthResultStatus.networkError:
        errorMessage = "Unable to connect to network";
        break;
      default:
        errorMessage = "Could not sign in";
    }

    return errorMessage;
  }
}
