//
//  VTConstant.h
//  MidtransCoreKit
//
//  Created by atta on 6/9/16.
//  Copyright © 2016 Veritrans. All rights reserved.
//

/**
 *  error domain
 */
static NSString * const VT_ERROR_DOMAIN = @"error.veritrans.co.id";

/**
 *  transaction status
 */
static NSString * const VT_TRANSACTION_STATUS_DENY   = @"deny";
static NSString * const VT_TRANSACTION_STATUS_SETTLE   = @"settlement";


/**
 *  credit card type
 *
 *  @param systemVersion]
 *
 *  @return 
 */
static NSString * const CREDIT_CARD_TYPE_AMEX   = @"Amex";
static NSString * const CREDIT_CARD_TYPE_JCB    = @"JCB";
static NSString * const CREDIT_CARD_TYPE_MASTER_CARD    = @"MasterCard";
static NSString * const CREDIT_CARD_TYPE_VISA    = @"Visa";

/**
 *  PAYMENT TYPE
 */
static NSString * const VT_PAYMENT_BCA_KLIKPAY = @"bca_klikpay";
static NSString * const VT_PAYMENT_KLIK_BCA = @"KlikBCA";
static NSString * const VT_PAYMENT_INDOMARET = @"indomaret";
static NSString * const VT_PAYMENT_CIMB_CLICKS = @"cimb_clicks";
static NSString * const VT_PAYMENT_CSTORE = @"cstore";
static NSString * const VT_PAYMENT_MANDIRI_ECASH = @"mandiri_ecash";
static NSString * const VT_PAYMENT_CREDIT_CARD = @"credit_card";
static NSString * const VT_PAYMENT_BANK_TRANSFER = @"bank_transfer";
static NSString * const VT_PAYMENT_ECHANNEL = @"echannel";
static NSString * const VT_PAYMENT_BRI_EPAY = @"bri_epay";

static NSString *const TRANSACTION_SUCCESS = @"vtTRANSACTION_SUCCESS";
static NSString *const TRANSACTION_FAILED = @"vtTRANSACTION_FAILED";

static NSString *const VT_CREDIT_CARD_IDENTIFIER = @"cc";
static NSString *const VT_VA_IDENTIFIER = @"atm";
static NSString *const VT_PAYMENT_KLIK_BCA_IDENTIFIER = @"bca_klikbca";
static NSString *const VT_PAYMENT_KLIK_BCA_IDENTIFIER2 = @"klikbca";
static NSString *const VT_VA_PERMATA_IDENTIFIER = @"vapermata";
static NSString *const VT_VA_BCA_IDENTIFIER = @"vabca";
static NSString *const VT_VA_MANDIRI_IDENTIFIER = @"vamandiri";
static NSString *const VT_VA_OTHER_IDENTIFIER = @"vaother";
static NSString *const VT_KLIK_BCA_IDENTIFIER = @"klikbca";
static NSString *const VT_BCA_KLIKPAY_IDENTIFIER = @"klikpay";
static NSString *const VT_MANDIRI_CLICKPAY_IDENTIFIER = @"clickpay";
static NSString *const VT_CIMB_CLIKS_IDENTIFIER = @"clicks";
static NSString *const VT_ECASH_IDENTIFIER = @"ecash";
static NSString *const VT_EPAY_IDENTIFIER = @"epay";
static NSString *const VT_TELKOMSEL_TCASH_IDENTIFIER = @"tcash";
static NSString *const VT_INDOMARET_IDENTIFIER = @"indomaret";


/**
 *  CONSTANT REGEX
 */
static NSString * const VT_VISA_REGEX         = @"^4[0-9]{12}(?:[0-9]{3})?$";
static NSString * const VT_MASTER_CARD_REGEX   = @"^5[1-5][0-9]{5,}$";
static NSString * const VT_JCB_REGEX          = @"^(?:2131|1800|35\d{3})\d{11}$";
static NSString * const VT_AMEX_REGEX         = @"^3[47][0-9]{13}$";

/**
 *  MESSAGE CONSTANT
 */

static NSString * const VT_MESSAGE_CARD_INVALID = @"Card number is invalid";
static NSString * const VT_MESSAGE_EXPIRE_DATE_INVALID = @"Expiry Year is invalid";
static NSString * const VT_MESSAGE_EXPIRE_MONTH_INVALID = @"Expiry Month is invalid";
static NSString * const VT_MESSAGE_CARD_CVV_INVALID = @"CVV is invalid";
static NSString * const VT_MESSAGE_MERCHANT_SERVER_NOT_SET = @"Please set your merchant server URL in VTConfig";
static NSString * const VT_MESSAGE_CLIENT_KEY_NOT_SET = @"Please set your Veritrans Client Key in VTConfig";


static NSString *const VT_SANDBOX_API_URL = @"https://api.sandbox.veritrans.co.id/v2";
static NSString *const VT_SANDBOX_MIXPANEL = @"cc005b296ca4ce612fe3939177c668bb";
static NSString *const VT_PRODUCTION_API_URL = @"https://api.veritrans.co.id/v2";
static NSString *const VT_PRODUCTION_MIXPANEL = @"0269722c477a0e085fde32e0248c6003";

static NSString *const VT_TRACKING_CC_TOKEN = @"token";
static NSString *const VT_TRACKING_PAYMENT_METHOD = @"payment_method";
static NSString *const VT_TRACKING_PAYMENT_AMOUNT = @"amount";
static NSString *const VT_TRACKING_PAYMENT_FEATURE = @"payment_feature";
static NSString *const VT_TRACKING_SECURE_PROTOCOL = @"secure";

static NSString *const VT_TRACKING_APP_TOKENIZER = @"track.app.tokenizer";
/**
 *  if needed we maybe need it as is to detect ios version and also device version
 *
 *  @param systemVersion]
 *
 *  @return
 */

#define SYSTEM_VERSION                              ([[UIDevice currentDevice] systemVersion])
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([SYSTEM_VERSION compare:v options:NSNumericSearch] != NSOrderedAscending)
#define IS_IOS8_OR_ABOVE                            (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0"))
