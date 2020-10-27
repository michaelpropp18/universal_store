// list of named routes. Use these names instead of hardcoded strings (e.g. LoginRoute instead of '/login')

const String HomeRoute = '/';
const String LoginRoute = '/login';

//registration routes
const String RegisterTypeRoute = '/register/type';
const String RegisterCustomerNameRoute = '/register/customer/name';
const String RegisterCustomerEmailPasswordRoute = '/register/customer/email';
const String RegisterManagerNameRoute = '/register/manager/name';
const String RegisterManagerEmailRoute = '/register/manager/email';
const String ForgotPasswordRoute = '/register/forgot_password';

//customer drawer
const String ProfileRoute = '/drawer/profile';
const String PurchasesRoute = '/drawer/purchases';
const String PaymentRoute = '/drawer/payment';
const String PrivacyRoute = '/drawer/privacy';
const String FeedbackRoute = '/drawer/feedback';
const String HelpRoute = '/drawer/help';

//edit customer drawer fields
const String EditCustomerFirstRoute = '/drawer/profile/edit_first';
const String EditCustomerLastRoute = '/drawer/profile/edit_last';
const String EditCustomerEmailRoute = '/drawer/profile/edit_email';

//customer
const String SearchRoute = '/search';
const String ShoppingCartRoute = '/shopping_cart';
const String ViewProductRoute = '/view_product';
const String ViewStoreRoute = '/view_store';
const String AddItemCodeRoute = '/item_code';
const String SelectStoreRoute = '/select_store';
const String SelectPreviousShoppingTrip = '/select_previous_shopping_trip';
const String CheckoutScreenRoute = '/checkout';

//primary manager routes
const String ManagerStoreRoute = '/manager/store';
const String ManagerInventoryRoute = '/manager/inventory';
const String ManagerOrdersRoute = '/manager/orders';
const String ManagerPaymentRoute = '/manager/payment';
const String ManagerAnalyticsRoute = '/manager/analytics';

//manager edit store fields
const String ManagerEditStoreEmailRoute = '/manager/store/edit/store_email_field';
const String ManagerEditStoreWebsiteRoute = '/manager/store/edit/store_website_field';
const String ManagerEditStorePhoneRoute = '/manager/store/edit/store_phone_field';
const String ManagerEditStoreAddressRoute = '/manager/store/edit/store_address_field';

//inventory
const String ManagerInventoryItemRoute = '/manager/inventory/item';
const String ManagerInventoryEditPrice = '/manager/inventory/edit/price';
const String ManagerInventoryEditQuantity = '/manager/inventory/edit/quantity';
const String ManagerInventoryAddItem = '/manager/inventory/add_item';