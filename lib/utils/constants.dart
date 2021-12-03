class ConstantsUtils {
  /// Common Constants
  static const String LANGUAGE = 'LANGUAGE';
  static const int DURATION_TIME_CLICKABLE = 500;

  //API
  static const int PAGE_SIZE = 10;

  //IMAGE
  static const int IMAGE_LARGE_MAX_WIDTH = 1600;
  static const int IMAGE_SMALL_MAX_WIDTH = 400;
  static const int IMAGE_QUALITY = 80;

  //LOGIN
  static const int ID_PROTECTOR = 1; //1: 保護者
  // static const int ID_SUB_PROTECTOR = 2; // 2: 招待者
  static const int ID_STAFF = 3; //3: 職員
  static const String USER_LOGIN_KEY = 'USER_LOGIN_KEY';
  static const String LOGIN_TENANT_KEY = 'login_tenant';
  static const String LOGIN_ID_KEY = 'login_id';
  static const String LOGIN_TYPE_KEY = 'login_pwd';

  //HOME
  static const String MAIL = 'MAIL';
  static const String ENQUETES = 'ENQUETES';
  static const String MENU = 'MENU';

  //Chat

  static const String GET_STREAM_URL_TOS = 'https://getstream.io/legal/';
  static const String CHAT_API_KEY = 'dsxsfq6kxmdv';
  static const int SCROLL_DURATION = 2;
  static const int PAGING_LIMIT = 15;
  static const NEW_CHAT_EVENT = 'message.new';
  static const CHAT_TYPE_GROUP = 'CHAT_TYPE_GROUP';
  static const CHAT_TYPE_PERSONAL = 'CHAT_TYPE_PERSONAL';
  static const CHAT_TYPE_ALL = 'CHAT_TYPE_ALL';
  static const LIMIT_PAGINATION = 30;

  // Memo
  static const int MIN_LINE_COMMENT_BOX = 10;
  static const int DESCRIPTION_MAX_LENGTH = 500;
  static const int DESCRIPTION_MAX_LINE = 10;

  //DaTa
  static const String ADD = 'add';
  static const String UPDATE = 'update';
  static const String NO_CHANGE = 'nochange';
  static const String DELETE = 'delete';

  //Tag
  static const String FULL_TAG = 'FULL_TAG';
  static const String HISTORY_TAG = 'HISTORY_TAG';
  static const String GRADE_TAG_FULL = 'GRADE_TAG_FULL';
  static const String GROUP_TAG_FULL = 'GROUP_TAG_FULL';
  static const String GRADE_TAG_HISTORY = 'GRADE_TAG_HISTORY';
  static const String GROUP_TAG_HISTORY = 'GROUP_TAG_HISTORY';
  static const String BASE_TAG_HISTORY = 'BASE_TAG_HISTORY';
  static const double MAX_DROPDOWN_SUGGESTION_LENGTH = 2;
}

class ApiConstant {
  static const CONNECT_TIMEOUT = 45;

  //CODE from server
  static const CODE_ACCESS_TOKEN_EXPIRED = 'A000-1';
  static const CODE_ERROR = 500;

  //code client define
  static const CODE_NETWORK_ERROR = "C001";
  static const CODE_SERVER_ERROR = "C001";
  static const CODE_ERROR_LOGIN = "A001-1";
}

class KeyArgument {
  static const String KEY_TITLE = 'title';
  static const String KEY_LINK = 'link';
  static const String KEY_IS_GROUP_CHAT = 'isGroupChat';
  static const String KEY_MEMO_MODEL = 'memo_model';
  static const String KEY_SUBMIT_DATA_STATE = 'submit_data_state';
}

enum DataState { none, loading, success, failure, refreshing, loadingMore }
enum SubmitDataState { create, update, delete }
