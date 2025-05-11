# GirlsXBattle2Decompilation
Full decompilation of the game Girls x Battle 2, as EOL is approaching, for archival / private server purposes

---

# Communications with server

Overall HTTP(S) communications between client and server, for base on login and init part, payloads taken from an android device, some fields may be hidden and replaced with [text as such], in-game part seem to be handled over WSS

### URLS
- **MAIN_API** : `mhome.carolgames.com/apis/sdk`
- **ALT_API** : `mhomeorig.carolgames.com/apis/sdk`
- **GAME_API** : `xuemeih5back.carolgames.com/api` (USES HTTP !!)
- **UPDATE_CDN** : `yottacdn.akamaized.net/xuemeiunityres`

---

### Pub messages

The game communicates with server using pubMsg, the request is json and contains the message in base64 encoded json, bellow is the structure of a pubMsg request, for the message themselves, see the specific packets defined under

#### Overview

```mermaid
sequenceDiagram
    participant C as Client
    participant S as Server

    C->>S: POST [ALT_API]/send_pub_msg
    Note right of C: Message (pubMsg)
    S-->>C: 200 OK
    Note left of S: Response code (pubRes)
```

#### Payloads

* pubMsg
```json
{
  "msg": "{\"messages\":[{\"data\":\"[BASE64 ENCODED JSON MESSAGE]\",\"attributes\":{\"eventid\":\"64d3d661-1746964618-1746964618-2-2\"}}]}",
  "attribute_lang": "fr_FR",
  "rtime": "1746964619413454",
  "error_info": "",
  "device_id": "64d3d66152258464",
  "type": "1",
  "os_type": "android",
  "sdk_version": "2.240304.1",
  "package_name": "com.carolgames.moemoegirls",
  "rkey": "[RKEY]",
  "topic": "",
  "lang": "en_US",
  "game_id": "115",
  "sign": "[SIGN]"
}
```

* pubRes
```json
{
  "error_code": "0",
  "error_msg": "(TID:81549010-b033-498d-99cf-3529abff7ea7)"
}
```

---

### Init

For when the game starts up, may be missing some steps

#### Overview

```mermaid
sequenceDiagram
    participant C as Client
    participant S as Server

    C->>S: POST [MAIN_API]/init
    Note right of C: Sends apps & device infos (initPacket)
    S-->>C: 200 OK
    Note left of S: Returns app config (appConfigPacket)

    C->>S: POST [ALT_API]/send_pub_msg
    Note right of C: Message exchange channel, init message (pubInit)
    S-->>C: 200 OK
    Note left of S: Response code (pubRes)

    C->>S: POST [MAIN_API]/update_device_info
    Note right of C: More device infos (deviceInfos)
    S-->>C: 200 OK
    Note left of S: Response code (deviceInfosRes)
```

#### Payloads

* initPacket
```json
{
  "system_time": "1746964618883",
  "attribute_lang": "fr_FR",
  "rtime": "1746964618962792",
  "app_version": "1.5.686",
  "device_id": "64d3d66152258464",
  "system_lang": "fr_FR",
  "sdk_flag": "IFTFT",
  "os_version": "11",
  "channel": "",
  "advertising_id": "afdc986f-9fe8-4fd2-b2ef-a3c4523bf6fa",
  "device_type": "samsung:SM-A505FN",
  "new_privacy_version": "0",
  "device_resolution": "810*1598",
  "os_type": "android",
  "cpu_type": "ARM",
  "package_name": "com.carolgames.moemoegirls",
  "sdk_version": "2.240304.1",
  "rkey": "[UNKNOWN]",
  "appsflyer_id": "1746964618238-1700667239338582461",
  "lang": "en_US",
  "sub_device_id": "[DEVICE ID]",
  "game_id": "115",
  "sign": "[SIGN KEY]"
}
```

* appConfigPacket
```json
{
  "error_code": 0,
  "package_info": {
    "fbAppId": "204551043692742",
    "third_product_id": "com.carolgames.moemoegirls.30day",
    "payment_id": 1,
    "currency_name": "USD",
    "base64EncodedPublicKey": "[YOUR PUBLIC KEY]",
    "AppsFlyer_Key": "zoVuo66f4of7gdo2JFuATc",
    "firebase_app_id": "1:207969861579:android:03d5dc893ff679c9",
    "firebase_api_secret": "[API SECRET]",
    "line_channel_id": "1598798049",
    "is_new_pay": true,
    "use_fb_web": 0,
    "micro_end_url": "https://yottacdn.akamaized.net/xuemeih5res/1619708801_wei.html?game_back_url=xuemeih5back.carolgames.com&parent_url=1",
    "need_privacy": true,
    "privacy_version": 1,
    "channel": "gxb2en",
    "game_domain": "girlsh5.carolgames.com",
    "patch_infos": [],
    "pubsub_info": {
      "project_id": "heidao-market",
      "topic": "girlsh5_ods.sdk_events",
      "error_topic": "girlsh5_ods.dmp_log_error",
      "access_token": "[TOKEN]",
      "curr_time": 1746964619320
    },
    "auto_check": [],
    "sub_version_id": "1612517005",
    "enable_init_recaptcha": false
  },
  "channel_sdk": [],
  "device_id": "64d3d66152258464",
  "attribute_lang": "fr",
  "is_new_install": true,
  "is_return_install": false,
  "experiment_info": [],
  "device_create_time": 1746964619,
  "is_usa_strict_location": false,
  "is_applied_area": true,
  "new_privacy_tips": {
    "privacy_title": "Politique de Confidentialité et Cookies",
    "privacy_cookie_policy_content": "En installant et en jouant à ce jeu, vous acceptez nos Conditions d'Utilisation et Politique de Confidentialité. Appuyer sur \"Continuer\" ci-dessous signifie que vous acceptez tous les cookies de notre part et de nos prestataires tiers. Accepter tous les cookies offre la meilleure expérience de jeu en personnalisant votre expérience et en optimisant les performances du jeu. Pour en savoir plus, lisez notre Politique de Cookies. Pour ajuster vos paramètres de cookies, comme l'ajustement de votre expérience publicitaire, veuillez appuyer sur ici.",
    "second_privacy_cookie_policy_content": "Modifier ces paramètres de cookies peut altérer votre expérience de jeu. Pour en savoir plus, veuillez lire notre Politique de Cookies. Si vous souhaitez personnaliser vos préférences en matière de cookies, vous pouvez basculer les interrupteurs ci-dessous et appuyer sur Confirmer Mes Choix.",
    "accept_all": "Confirmer Mes Choix",
    "accept_control": "Tout Autoriser",
    "continue": "Continuer",
    "privacy_cookie_policy_content_bold_front": [
      "Appuyer sur \"Continuer\" ci-dessous signifie que vous acceptez tous les cookies de notre part et de nos prestataires tiers.",
      "Accepter tous les cookies"
    ],
    "match_replace": {
      "terms_of_service": {
        "match_txt": "Conditions d'Utilisation",
        "replace_value": "https://mhome.carolgames.com/fr/article/terms_of_use?game_id=115&device_id=64d3d66152258464",
        "underlined": true
      },
      "privacy_policy": {
        "match_txt": "Politique de Confidentialité",
        "replace_value": "https://mhome.carolgames.com/fr/article/privacy_policy?game_id=115&device_id=64d3d66152258464",
        "underlined": true
      },
      "cookie_policy": {
        "match_txt": "Politique de Cookies",
        "replace_value": "https://mhome.carolgames.com/fr/article/cookie_policy?game_id=115&device_id=64d3d66152258464",
        "underlined": true
      }
    },
    "mark_value": {
      "here": {
        "match_txt": "ici",
        "event": "in_page_jump",
        "underlined": true
      }
    },
    "strictly_cookie_button": {
      "button_name": "Cookies strictement nécessaires",
      "button_value": "Ces cookies essentiels sont nécessaires au fonctionnement de l'application et ne peuvent pas être désactivés. Ils s'activent pour des actions telles que la configuration des préférences de confidentialité, la connexion ou le remplissage de formulaires. Notez que ces cookies ne stockent aucune information personnelle.",
      "button_status": true,
      "button_status_txt": "Toujours activé"
    },
    "performance_cookie_button": {
      "button_name": "Cookies de Performance",
      "button_value": "Ces cookies suivent les visites et le trafic pour améliorer les performances de l'application. Ils nous montrent les fonctionnalités populaires et moins utilisées, nous aidant à comprendre la navigation des joueurs. Sans ces cookies, nous ne pouvons pas surveiller efficacement les performances de l'application.",
      "button_status": false
    },
    "marketing_cookie_button": {
      "button_name": "Publicité Personnalisée",
      "button_value": "Nous collaborons avec des annonceurs tiers dans notre application pour fournir des publicités personnalisées. Ces partenaires peuvent recueillir des données sur vos interactions à des fins de publicité ciblée. Vous pouvez désactiver cette fonctionnalité dans les paramètres de l'application. Désactiver cette fonctionnalité signifie que vous verrez toujours des publicités, mais elles ne seront pas personnalisées en fonction de votre activité dans l'application.",
      "button_status": false
    },
    "need_show": true,
    "new_privacy_version": 1
  },
  "single_layer_privacy_info": [],
  "recorded_cpu_type": 1,
  "events_not_track": {
    "appsflyer": [
      "af_skad_revenue",
      "vip3",
      "vip1",
      "5star-1",
      "5star-2",
      "5star-3",
      "5star-4",
      "5star-5",
      "5star-6",
      "5star-7",
      "5star-8",
      "5star-9",
      "5star-10",
      "stage_1_9",
      "stage_3_6",
      "stage_5_2",
      "stage_7_2",
      "stage_10_3",
      "stage_13_7",
      "stage_17_7",
      "lv10",
      "lv20",
      "lv32",
      "lv40",
      "lv50",
      "lv60",
      "lv70",
      "lv80",
      "lv90",
      "lv100",
      "af_purchase",
      "af_purchase_small",
      "af_purchase_plus"
    ],
    "firebase": [],
    "facebook": [],
    "adjust": []
  },
  "origkey": "[SIGN KEY]",
  "ip": "[YOUR IP]"
}
```

* pubInit (Note: this is the json content of the message itself, the entire request is different)
```json
{
    "event_type": 8,
    "system_info": "get game package success",
    "stage_id": 10002,
    "app_v": "1.5.686",
    "timestamp_mills": 1746964619412,
    "device_id": "64d3d66152258464",
    "platform_id": "29",
    "os_type": "android",
    "req_id": "2-2",
    "sdk_version": "2.240304.1"
}
```

* deviceInfos
```json
{
  "attribute_lang": "fr",
  "rtime": "1746964619450907",
  "device_id": "64d3d66152258464",
  "os_type": "android",
  "sdk_version": "2.240304.1",
  "package_name": "com.carolgames.moemoegirls",
  "rkey": "[RKEY]",
  "google_install_info": "{\"referrer_url\":\"utm_source=google-play&utm_medium=organic\",\"referrer_click_time\":0,\"click_download_time\":1746964168,\"local_referrer_click_time\":0,\"local_click_download_time\":1746964170,\"app_install_time\":1746964603190}",
  "lang": "en_US",
  "game_id": "115",
  "sign": "[SIGN]"
}
```

* deviceInfosRes
```json
{
  "error_code": 0,
  "error_msg": "",
  "data": {
    "conversion_value": -1
  }
}
```

---

### Login

Login works either with legacy (username & password) or SDK (game center, google, FB, etc), only covering legacy here as sdk uses another api channel but response is the same anyway

#### Overview

```mermaid
sequenceDiagram
    participant C as Client
    participant S as Server

    C->>S: POST [MAIN_API]/login
    Note right of C: Sends login form (loginForm)
    S-->>C: 200 OK
    Note left of S: Returns either acc info (accInfos) or failed login (loginFail)
```

#### Payloads

* loginForm (password is sent as clear text)
```json
{
  "password": "[PASSWORD]",
  "attribute_lang": "fr",
  "player_id": "1018341991",
  "rtime": "1746965496537336",
  "device_id": "64d3d66152258464",
  "login_email": "[LOGIN]",
  "os_type": "android",
  "sdk_version": "2.240304.1",
  "package_name": "com.carolgames.moemoegirls",
  "rkey": "[REKY]",
  "lang": "fr_FR",
  "game_id": "115",
  "sign": "[SIGN]"
}
```

* accInfos
```json
{
  "error_code": 0,
  "is_reg": 0,
  "device_id": "64d3d66152258464",
  "uid": "3354405055",
  "nickname": "Escartem",
  "login_email": "Escartem",
  "user_create_time": "1636213449",
  "tp_code": "email",
  "is_anonymous": 0,
  "login_token": "[TOKEN]",
  "session_id": "[SESID]"
}
```

* loginFail
```json
{
  "error_code": 403,
  "error_msg": "This account does not exist"
}
```

---

### Updates

For when the games updates itself

#### Overview

```mermaid
sequenceDiagram
    participant C as Client
    participant S as Server

    C->>S: POST [GAME_API]/v1
    Note right of C: Payload for update (updatePayload)
    S-->>C: 200 OK
    Note left of S: Update config (updateConfig)

    C->>S: GET [UPDATE_CDN]/Android/[version].json
    Note right of C: GET request
    S-->>C: 200 OK
    Note left of S: Assets data (versionFile)

    C->>S: GET [UPDATE_CDN]/[file.res].[file.md5]
    Note right of C: GET request
    S-->>C: 200 OK
    Note left of S: Download data
```

#### Payloads

* updatePayload
```json
{
    "payload":
    {
        "os": "android",
        "is_unity": 1,
        "mid": 1044,
        "app_v": 1,
        "device_id": "64d3d66152258464",
        "lang": "en_en"
    }
}
```

* updateConfig
```json
{
  "mid": 1044,
  "payload": {
    "host": "xuemeih5back.carolgames.com",
    "is_review": 0,
    "min_version": "1.5.248",
    "version": "1619629629",
    "port_s": 443,
    "port": 80,
    "unity_android_version": "{\"curr_version\":\"1.5.728\",\"min_version\":\"1.5.248\",\"min_hot_version\":\"1.5.728\"}",
    "is_maintenance": 0,
    "curr_version": "1.5.728",
    "unity_ios_version": "{\"curr_version\":\"71.3.808\",\"min_version\":\"71.3.310\",\"min_hot_version\":\"71.3.808\"}",
    "min_hot_version": "1.5.728"
  }
}
```

* versionFile (version file is a list of files, only giving example for one here)
```json
{
    "version": "1.5.728",
    "resources": [
        {
            "path": "Android",
            "res": "Android/Android",
            "type": 1,
            "md5": "5d21e15383855bc2404fa7bac8612e12",
            "size": 364664
        }
    ]
}
```

* Note when downloading, for URL make sure to use the `res` field and adding the md5 at the end, but when saving the data it must but stored in the `path` field within the game files instead

---

### Enter game

After all is done, enter game, switching to WSS, at this point you must look at the lua code directly to figure out the protos

#### Overview

```mermaid
sequenceDiagram
    participant C as Client
    participant S as Server

    C->>S: POST [UPDATE_API]/v1
    Note right of C: Payload for game enter (enterPayload)
    S-->>C: 200 OK
    Note left of S: WSS config (enterConfig)
```

#### Payloads

* enterPayload
```json
{
    "payload":
    {
        "is_anonymous": 0,
        "mid": 1,
        "server_id": 0,
        "os_id": 1,
        "platform_id": 29,
        "sid": "[SESSION ID]",
        "login_token": "[LOGIN TOKEN]",
        "app_v": "1.5.686",
        "res_v": "1.5.686",
        "time_zone": 1,
        "lang": "fr_fr"
    }
}
```

* enterConfig
```json
{
  "mid": 1,
  "payload": {
    "use_pvr": 1,
    "is_new": false,
    "gm_url": "nil",
    "gate_host": "xuemeih5gate.carolgames.com",
    "log_url": "http://xuemeih5back.carolgames.com:80/log",
    "gate_port": 20210,
    "player_id": "[PLAYER ID]",
    "uid": "3354405055",
    "wb_port": 20212,
    "last_time": 1746965679,
    "token": "[ENTER TOKEN]",
    "wbs_port": 20213,
    "server_time": 1746965679
  }
}
```
