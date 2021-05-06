DROP TABLE m_survey CASCADE
/
CREATE TABLE m_survey
(
    survey_cd                      CHAR(5) NOT NULL,
    survey_nm                      VARCHAR(50) NOT NULL,
    start_time                     DATE NOT NULL,
    end_time                       DATE NOT NULL,
    post_data_send_interval        SMALLINT DEFAULT 600 NOT NULL,
    transportation_upd_dt          TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    active_upd_dt                  TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    setting_upd_dt                 TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    stamp_category_upd_dt          TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    stamp_use_flag                 CHAR(1) DEFAULT '0',
    default_lat                    FLOAT8 DEFAULT 35,
    default_lon                    FLOAT8 DEFAULT 135,
    maps_api_key                   VARCHAR(200),
    webdav_path                    VARCHAR(1000),
    diary_url                      VARCHAR(300)
)
/
ALTER TABLE m_survey
    ADD CONSTRAINT pk_survey PRIMARY KEY  (survey_cd)
/
COMMENT ON TABLE m_survey IS '調査マスタ'
/
COMMENT ON COLUMN m_survey.survey_cd IS '調査コード'
/
COMMENT ON COLUMN m_survey.survey_nm IS '調査名'
/
COMMENT ON COLUMN m_survey.start_time IS '調査開始日時'
/
COMMENT ON COLUMN m_survey.end_time IS '調査終了日時'
/
COMMENT ON COLUMN m_survey.post_data_send_interval IS 'データ送信間隔／[秒]データ送信間隔'
/
COMMENT ON COLUMN m_survey.transportation_upd_dt IS '移動手段更新日時'
/
COMMENT ON COLUMN m_survey.active_upd_dt IS '移動目的更新日時'
/
COMMENT ON COLUMN m_survey.setting_upd_dt IS '設定更新日時'
/
COMMENT ON COLUMN m_survey.stamp_category_upd_dt IS 'スタンプカテゴリ更新日時'
/
COMMENT ON COLUMN m_survey.stamp_use_flag IS 'スタンプ利用フラグ／1：利用
0：利用無し'
/
COMMENT ON COLUMN m_survey.default_lat IS '基準緯度'
/
COMMENT ON COLUMN m_survey.default_lon IS '基準経度'
/
COMMENT ON COLUMN m_survey.maps_api_key IS 'maps_api_key'
/
COMMENT ON COLUMN m_survey.webdav_path IS 'WEBDAVアップロード先／カンマ区切りで複数設定'
/
COMMENT ON COLUMN m_survey.diary_url IS 'ダイアリーURL'
/
DROP TABLE m_setting_iphone CASCADE
/
CREATE TABLE m_setting_iphone
(
    survey_cd                      CHAR(5) NOT NULL,
    loc_activity_type              CHAR(1) NOT NULL,
    loc_distance_filter            SMALLINT DEFAULT 5 NOT NULL,
    loc_desire_accuracy            CHAR(1) DEFAULT '1' NOT NULL,
    acc_hz                         SMALLINT DEFAULT 50 NOT NULL,
    pressure_interval              SMALLINT DEFAULT 5000 NOT NULL,
    acc_f                          CHAR(1) DEFAULT '0' NOT NULL,
    pressure_f                     CHAR(1) DEFAULT '0' NOT NULL,
    crt_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    upd_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
)
/
ALTER TABLE m_setting_iphone
    ADD CONSTRAINT pk_setting_iphone PRIMARY KEY  (survey_cd)
/
COMMENT ON TABLE m_setting_iphone IS 'iphone設定'
/
COMMENT ON COLUMN m_setting_iphone.survey_cd IS '調査コード'
/
COMMENT ON COLUMN m_setting_iphone.loc_activity_type IS '位置測位activity_type／1:clactivitytypefitness
2:clactivitytypeautomotivenavigation
3:clactivitytypeothernavigation
4:clactivitytypeother'
/
COMMENT ON COLUMN m_setting_iphone.loc_distance_filter IS '位置測位distance_filter／[m]'
/
COMMENT ON COLUMN m_setting_iphone.loc_desire_accuracy IS '位置測位desire_accuracy／1:kcllocationaccuracybest：最高精度
2:kcllocationaccuracynearesttenmeters：10ｍ
3:kcllocationaccuracyhundredmeters：100ｍ
4:kcllocationaccuracykilometer：1ｋｍ
5:kcllocationaccuracythreekilometers：3ｋｍ'
/
COMMENT ON COLUMN m_setting_iphone.acc_hz IS '加速度測位周波数／加速度の測位周波数[hz]'
/
COMMENT ON COLUMN m_setting_iphone.pressure_interval IS '気圧測位interval／[ミリ秒]
※iphoneの気圧センサーはデフォルトで１秒以上で計測されている様子'
/
COMMENT ON COLUMN m_setting_iphone.acc_f IS '加速度計測フラグ／0:計測しない
1:計測する'
/
COMMENT ON COLUMN m_setting_iphone.pressure_f IS '気圧計測フラグ／0:計測しない
1:計測する'
/
COMMENT ON COLUMN m_setting_iphone.crt_dt IS '作成日時'
/
COMMENT ON COLUMN m_setting_iphone.upd_dt IS '更新日時'
/
DROP TABLE m_setting_android CASCADE
/
CREATE TABLE m_setting_android
(
    survey_cd                      CHAR(5) NOT NULL,
    loc_priority                   CHAR(1) DEFAULT '1' NOT NULL,
    loc_smallest_displacement      SMALLINT DEFAULT 0 NOT NULL,
    loc_fastest_interval           INTEGER DEFAULT 1000 NOT NULL,
    loc_interval                   INTEGER DEFAULT 1000 NOT NULL,
    pressure_interval              SMALLINT DEFAULT 1000 NOT NULL,
    wifi_interval                  SMALLINT DEFAULT 5000 NOT NULL,
    acc_f                          CHAR(1) DEFAULT '0' NOT NULL,
    pressure_f                     CHAR(1) DEFAULT '0' NOT NULL,
    wifi_f                         CHAR(1) DEFAULT '0' NOT NULL,
    crt_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    upd_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
)
/
ALTER TABLE m_setting_android
    ADD CONSTRAINT pk_setting_android PRIMARY KEY  (survey_cd)
/
COMMENT ON TABLE m_setting_android IS 'android設定'
/
COMMENT ON COLUMN m_setting_android.survey_cd IS '調査コード'
/
COMMENT ON COLUMN m_setting_android.loc_priority IS '位置測位精度／1:priority_high_accuracy
2:priority_balanced_power_accuracy'
/
COMMENT ON COLUMN m_setting_android.loc_smallest_displacement IS '位置測位最小距離変位／[m]最小移動距離'
/
COMMENT ON COLUMN m_setting_android.loc_fastest_interval IS '位置測位fasetestinterval／[ミリ秒]setfastestinterval'
/
COMMENT ON COLUMN m_setting_android.loc_interval IS '位置測位interval／[ミリ秒]setinterval'
/
COMMENT ON COLUMN m_setting_android.pressure_interval IS '気圧測位interval／[ミリ秒]'
/
COMMENT ON COLUMN m_setting_android.wifi_interval IS 'wifi測位interval／[ミリ秒]'
/
COMMENT ON COLUMN m_setting_android.acc_f IS '加速度計測フラグ／0:計測しない
1:計測する'
/
COMMENT ON COLUMN m_setting_android.pressure_f IS '気圧計測フラグ／0:計測しない
1:計測する'
/
COMMENT ON COLUMN m_setting_android.wifi_f IS 'wifi計測フラグ／0:計測しない
1:計測する'
/
COMMENT ON COLUMN m_setting_android.crt_dt IS '作成日時'
/
COMMENT ON COLUMN m_setting_android.upd_dt IS '更新日時'
/
DROP TABLE m_user CASCADE
/
CREATE TABLE m_user
(
    user_id                        INTEGER NOT NULL,
    survey_cd                      CHAR(5) NOT NULL,
    user_nm                        VARCHAR(100) NOT NULL,
    login_id                       VARCHAR(100) NOT NULL,
    password                       VARCHAR(100) NOT NULL,
    user_status                    CHAR(1) DEFAULT 1 NOT NULL,
    registration_id                VARCHAR(1000),
    device_type                    CHAR(1),
    device_nm                      VARCHAR(50),
    auth_key                       VARCHAR(200),
    login_dt                       TIMESTAMP,
    transportation_set_dt          TIMESTAMP,
    active_set_dt                  TIMESTAMP,
    term_setting_set_dt            TIMESTAMP,
    stamp_category_set_dt          TIMESTAMP,
    delete_data_flag               CHAR(1) DEFAULT 0 NOT NULL,
    last_operation_record_dt       TIMESTAMP,
    last_loc_record_dt             TIMESTAMP,
    last_acc_record_dt             TIMESTAMP,
    last_pressure_record_dt        TIMESTAMP,
    last_wifi_record_dt            TIMESTAMP,
    last_stamp_record_dt           TIMESTAMP,
    crt_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    upd_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    note                           TEXT
)
/
ALTER TABLE m_user
    ADD CONSTRAINT pk_user PRIMARY KEY  (user_id)
/
CREATE UNIQUE INDEX unique_login_pass
    ON m_user (login_id, password)
/
COMMENT ON TABLE m_user IS 'ユーザー'
/
COMMENT ON COLUMN m_user.user_id IS 'ユーザーid'
/
COMMENT ON COLUMN m_user.survey_cd IS '調査コード'
/
COMMENT ON COLUMN m_user.user_nm IS 'ユーザー名'
/
COMMENT ON COLUMN m_user.login_id IS 'ログインid'
/
COMMENT ON COLUMN m_user.password IS 'パスワード'
/
COMMENT ON COLUMN m_user.user_status IS 'ユーザー状態／1：利用可
9：利用不可'
/
COMMENT ON COLUMN m_user.registration_id IS '登録id'
/
COMMENT ON COLUMN m_user.device_type IS '端末タイプ／a：android
i：iphone'
/
COMMENT ON COLUMN m_user.device_nm IS '端末名称／端末の名称'
/
COMMENT ON COLUMN m_user.auth_key IS '認証key／ログイン時に発行するkey'
/
COMMENT ON COLUMN m_user.login_dt IS '最終ログイン日時／ログイン時に記録する時間'
/
COMMENT ON COLUMN m_user.transportation_set_dt IS '移動手段設定日時'
/
COMMENT ON COLUMN m_user.active_set_dt IS '移動目的設定日時'
/
COMMENT ON COLUMN m_user.term_setting_set_dt IS '端末設定日時'
/
COMMENT ON COLUMN m_user.stamp_category_set_dt IS 'スタンプカテゴリ設定日時'
/
COMMENT ON COLUMN m_user.delete_data_flag IS 'データ削除フラグ／0：削除しない
1：削除する'
/
COMMENT ON COLUMN m_user.last_operation_record_dt IS '最終操作情報記録日時'
/
COMMENT ON COLUMN m_user.last_loc_record_dt IS '最終位置情報記録日時'
/
COMMENT ON COLUMN m_user.last_acc_record_dt IS '最終加速度情報記録日時'
/
COMMENT ON COLUMN m_user.last_pressure_record_dt IS '最終気圧情報記録日時'
/
COMMENT ON COLUMN m_user.last_wifi_record_dt IS '最終wifi情報記録日時'
/
COMMENT ON COLUMN m_user.last_stamp_record_dt IS '最終スタンプ情報記記録日時'
/
COMMENT ON COLUMN m_user.crt_dt IS '作成日時'
/
COMMENT ON COLUMN m_user.upd_dt IS '更新日時'
/
COMMENT ON COLUMN m_user.note IS '備考'
/
DROP TABLE m_active CASCADE
/
CREATE TABLE m_active
(
    survey_cd                      CHAR(5) NOT NULL,
    active_cd                      CHAR(3) NOT NULL,
    lang_cd                        CHAR(2) NOT NULL,
    active_nm                      VARCHAR(50) NOT NULL,
    icon                           VARCHAR(100),
    priority                       SMALLINT,
    crt_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    upd_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    enabled                        CHAR(1) DEFAULT '1' NOT NULL
)
/
ALTER TABLE m_active
    ADD CONSTRAINT pk_active PRIMARY KEY  (survey_cd, active_cd, lang_cd)
/
COMMENT ON TABLE m_active IS '移動目的マスタ'
/
COMMENT ON COLUMN m_active.survey_cd IS '調査コード'
/
COMMENT ON COLUMN m_active.active_cd IS '移動目的コード'
/
COMMENT ON COLUMN m_active.lang_cd IS '言語コード'
/
COMMENT ON COLUMN m_active.active_nm IS '移動目的名'
/
COMMENT ON COLUMN m_active.icon IS 'アイコン'
/
COMMENT ON COLUMN m_active.priority IS '表示プライオリティ'
/
COMMENT ON COLUMN m_active.crt_dt IS '作成日時'
/
COMMENT ON COLUMN m_active.upd_dt IS '更新日時'
/
COMMENT ON COLUMN m_active.enabled IS '有効性／''0''：無効, ''1''：有効'
/
DROP TABLE m_transportation CASCADE
/
CREATE TABLE m_transportation
(
    survey_cd                      CHAR(5) NOT NULL,
    transportation_cd              CHAR(3) NOT NULL,
    lang_cd                        CHAR(2) NOT NULL,
    transportation_nm              VARCHAR(50) NOT NULL,
    icon                           VARCHAR(100),
    priority                       SMALLINT,
    crt_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    upd_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    enabled                        CHAR(1) DEFAULT '1' NOT NULL
)
/
ALTER TABLE m_transportation
    ADD CONSTRAINT pk_transportation PRIMARY KEY  (survey_cd, transportation_cd, lang_cd)
/
COMMENT ON TABLE m_transportation IS '移動手段マスタ'
/
COMMENT ON COLUMN m_transportation.survey_cd IS '調査コード'
/
COMMENT ON COLUMN m_transportation.transportation_cd IS '移動手段コード'
/
COMMENT ON COLUMN m_transportation.lang_cd IS '言語コード'
/
COMMENT ON COLUMN m_transportation.transportation_nm IS '移動手段名'
/
COMMENT ON COLUMN m_transportation.icon IS 'アイコン'
/
COMMENT ON COLUMN m_transportation.priority IS '表示プライオリティ'
/
COMMENT ON COLUMN m_transportation.crt_dt IS '作成日時'
/
COMMENT ON COLUMN m_transportation.upd_dt IS '更新日時'
/
COMMENT ON COLUMN m_transportation.enabled IS '有効性／''0''：無効, ''1''：有効'
/
DROP TABLE t_acc_data CASCADE
/
CREATE TABLE t_acc_data
(
    acc_id                         BIGINT NOT NULL,
    survey_cd                      CHAR(5) NOT NULL,
    user_id                        INTEGER NOT NULL,
    rec_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    acc_x                          FLOAT8,
    acc_y                          FLOAT8,
    acc_z                          FLOAT8,
    crt_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
)
/
ALTER TABLE t_acc_data
    ADD CONSTRAINT pk_acc PRIMARY KEY  (acc_id)
/
CREATE INDEX idx_accdata
    ON t_acc_data (survey_cd, user_id, rec_dt)
/
COMMENT ON TABLE t_acc_data IS '加速度データ'
/
COMMENT ON COLUMN t_acc_data.acc_id IS '加速度id'
/
COMMENT ON COLUMN t_acc_data.survey_cd IS '調査コード'
/
COMMENT ON COLUMN t_acc_data.user_id IS 'ユーザーid'
/
COMMENT ON COLUMN t_acc_data.rec_dt IS '記録日時'
/
COMMENT ON COLUMN t_acc_data.acc_x IS 'acc_x'
/
COMMENT ON COLUMN t_acc_data.acc_y IS 'acc_y'
/
COMMENT ON COLUMN t_acc_data.acc_z IS 'acc_z'
/
COMMENT ON COLUMN t_acc_data.crt_dt IS '作成日時'
/
DROP TABLE t_loc_data CASCADE
/
CREATE TABLE t_loc_data
(
    loc_id                         BIGINT NOT NULL,
    survey_cd                      CHAR(5) NOT NULL,
    user_id                        INTEGER NOT NULL,
    rec_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lat                            FLOAT8,
    lon                            FLOAT8,
    alt                            SMALLINT,
    accuracy                       FLOAT8,
    bearing                        REAL,
    speed                          REAL,
    gps_mode                       CHAR(1),
    crt_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
)
/
ALTER TABLE t_loc_data
    ADD CONSTRAINT pk_locdata PRIMARY KEY  (loc_id)
/
CREATE INDEX idx_locdata
    ON t_loc_data (survey_cd, user_id, rec_dt)
/
COMMENT ON TABLE t_loc_data IS '位置データ'
/
COMMENT ON COLUMN t_loc_data.loc_id IS '位置測位id'
/
COMMENT ON COLUMN t_loc_data.survey_cd IS '調査コード'
/
COMMENT ON COLUMN t_loc_data.user_id IS 'ユーザーid'
/
COMMENT ON COLUMN t_loc_data.rec_dt IS '記録日時'
/
COMMENT ON COLUMN t_loc_data.lat IS '緯度'
/
COMMENT ON COLUMN t_loc_data.lon IS '経度'
/
COMMENT ON COLUMN t_loc_data.alt IS '高度'
/
COMMENT ON COLUMN t_loc_data.accuracy IS '精度'
/
COMMENT ON COLUMN t_loc_data.bearing IS 'ベアリング'
/
COMMENT ON COLUMN t_loc_data.speed IS '速度'
/
COMMENT ON COLUMN t_loc_data.gps_mode IS '測位モード／1：high_accuracy
2：battery_accuracy'
/
COMMENT ON COLUMN t_loc_data.crt_dt IS '作成日時'
/
DROP TABLE t_pressure_data CASCADE
/
CREATE TABLE t_pressure_data
(
    pressure_id                    BIGINT NOT NULL,
    survey_cd                      CHAR(5) NOT NULL,
    user_id                        INTEGER NOT NULL,
    rec_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    pressure                       FLOAT8,
    crt_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
)
/
ALTER TABLE t_pressure_data
    ADD CONSTRAINT pk_pressure PRIMARY KEY  (pressure_id)
/
CREATE INDEX idx_pressuredata
    ON t_pressure_data (survey_cd, user_id, rec_dt)
/
COMMENT ON TABLE t_pressure_data IS '気圧データ'
/
COMMENT ON COLUMN t_pressure_data.pressure_id IS '気圧id'
/
COMMENT ON COLUMN t_pressure_data.survey_cd IS '調査コード'
/
COMMENT ON COLUMN t_pressure_data.user_id IS 'ユーザーid'
/
COMMENT ON COLUMN t_pressure_data.rec_dt IS '記録日時'
/
COMMENT ON COLUMN t_pressure_data.pressure IS '気圧／[hpa]'
/
COMMENT ON COLUMN t_pressure_data.crt_dt IS '作成日時'
/
DROP TABLE t_operation_data CASCADE
/
CREATE TABLE t_operation_data
(
    operation_id                   INTEGER NOT NULL,
    survey_cd                      CHAR(5) NOT NULL,
    user_id                        INTEGER NOT NULL,
    rec_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    operation_type                 CHAR(1) NOT NULL,
    transportation_cd              CHAR(3),
    active_cd                      CHAR(3),
    trip_id                        INTEGER,
    crt_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    upd_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
)
/
ALTER TABLE t_operation_data
    ADD CONSTRAINT pk_operation PRIMARY KEY  (operation_id)
/
COMMENT ON TABLE t_operation_data IS '操作データ'
/
COMMENT ON COLUMN t_operation_data.operation_id IS '操作id'
/
COMMENT ON COLUMN t_operation_data.survey_cd IS '調査コード'
/
COMMENT ON COLUMN t_operation_data.user_id IS 'ユーザーid'
/
COMMENT ON COLUMN t_operation_data.rec_dt IS '記録日時'
/
COMMENT ON COLUMN t_operation_data.operation_type IS '操作タイプ／1：出発操作
5：移動手段変更操作
7：到着操作'
/
COMMENT ON COLUMN t_operation_data.transportation_cd IS '移動手段コード'
/
COMMENT ON COLUMN t_operation_data.active_cd IS '移動目的コード'
/
COMMENT ON COLUMN t_operation_data.trip_id IS 'トリップid'
/
COMMENT ON COLUMN t_operation_data.crt_dt IS '作成日時'
/
COMMENT ON COLUMN t_operation_data.upd_dt IS '更新日時'
/
DROP TABLE t_trip CASCADE
/
CREATE TABLE t_trip
(
    trip_id                        INTEGER NOT NULL,
    survey_cd                      CHAR(5) NOT NULL,
    user_id                        INTEGER NOT NULL,
    rec_dt_dep                     TIMESTAMP NOT NULL,
    rec_dt_arr                     TIMESTAMP NOT NULL,
    operation_id_dep               INTEGER,
    operation_id_arr               INTEGER,
    active_cd                      CHAR(3),
    crt_f                          CHAR(1),
    loc_count                      INTEGER,
    crt_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    upd_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    enabled                        CHAR(1) DEFAULT '1' NOT NULL
)
/
ALTER TABLE t_trip
    ADD CONSTRAINT pk_trip PRIMARY KEY  (trip_id)
/
CREATE INDEX idx_trip_survey_user_recdep_enabled
    ON t_trip (survey_cd, user_id, rec_dt_dep, enabled)
/
COMMENT ON TABLE t_trip IS 'トリップデータ'
/
COMMENT ON COLUMN t_trip.trip_id IS 'トリップid'
/
COMMENT ON COLUMN t_trip.survey_cd IS '調査コード'
/
COMMENT ON COLUMN t_trip.user_id IS 'ユーザーid'
/
COMMENT ON COLUMN t_trip.rec_dt_dep IS '出発時刻'
/
COMMENT ON COLUMN t_trip.rec_dt_arr IS '到着時刻'
/
COMMENT ON COLUMN t_trip.operation_id_dep IS '出発操作id'
/
COMMENT ON COLUMN t_trip.operation_id_arr IS '到着操作id'
/
COMMENT ON COLUMN t_trip.active_cd IS '移動目的コード'
/
COMMENT ON COLUMN t_trip.crt_f IS '作成フラグ／1:アプリ操作のデータから作成
2:webダイアリーから作成
9:その他'
/
COMMENT ON COLUMN t_trip.loc_count IS '測位点数'
/
COMMENT ON COLUMN t_trip.crt_dt IS '作成日時'
/
COMMENT ON COLUMN t_trip.upd_dt IS '更新日時'
/
COMMENT ON COLUMN t_trip.enabled IS '有効性／''0''：無効, ''1''：有効'
/
DROP TABLE t_wifi_data CASCADE
/
CREATE TABLE t_wifi_data
(
    wifi_id                        BIGINT NOT NULL,
    survey_cd                      CHAR(5) NOT NULL,
    user_id                        INTEGER NOT NULL,
    rec_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    bssid                          VARCHAR(200),
    ssid                           VARCHAR(200),
    capabilities                   VARCHAR(400),
    wifi_frequency                 SMALLINT,
    wifi_level                     SMALLINT,
    crt_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
)
/
ALTER TABLE t_wifi_data
    ADD CONSTRAINT pk_wifi PRIMARY KEY  (wifi_id)
/
CREATE INDEX idx_wifidata
    ON t_wifi_data (survey_cd, user_id, rec_dt)
/
COMMENT ON TABLE t_wifi_data IS 'wifiデータ'
/
COMMENT ON COLUMN t_wifi_data.wifi_id IS 'wifiid'
/
COMMENT ON COLUMN t_wifi_data.survey_cd IS '調査コード'
/
COMMENT ON COLUMN t_wifi_data.user_id IS 'ユーザーid'
/
COMMENT ON COLUMN t_wifi_data.rec_dt IS '記録日時'
/
COMMENT ON COLUMN t_wifi_data.bssid IS 'bssid'
/
COMMENT ON COLUMN t_wifi_data.ssid IS 'ssid'
/
COMMENT ON COLUMN t_wifi_data.capabilities IS 'capabilities'
/
COMMENT ON COLUMN t_wifi_data.wifi_frequency IS 'wifi_frequency'
/
COMMENT ON COLUMN t_wifi_data.wifi_level IS 'wifi_level'
/
COMMENT ON COLUMN t_wifi_data.crt_dt IS '作成日時'
/
DROP TABLE m_stamp_category CASCADE
/
CREATE TABLE m_stamp_category
(
    survey_cd                      CHAR(5) NOT NULL,
    stamp_category_cd              CHAR(3) NOT NULL,
    lang_cd                        CHAR(2) NOT NULL,
    stamp_category_nm              VARCHAR(50) NOT NULL,
    icon                           VARCHAR(100),
    priority                       SMALLINT,
    crt_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    upd_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    enabled                        CHAR(1) DEFAULT '1' NOT NULL
)
/
ALTER TABLE m_stamp_category
    ADD CONSTRAINT pk_stamp_category PRIMARY KEY  (survey_cd, stamp_category_cd, lang_cd)
/
COMMENT ON TABLE m_stamp_category IS 'スタンプ種別マスタ'
/
COMMENT ON COLUMN m_stamp_category.survey_cd IS '調査コード'
/
COMMENT ON COLUMN m_stamp_category.stamp_category_cd IS 'スタンプ種別コード'
/
COMMENT ON COLUMN m_stamp_category.lang_cd IS '言語コード'
/
COMMENT ON COLUMN m_stamp_category.stamp_category_nm IS 'スタンプ種別名'
/
COMMENT ON COLUMN m_stamp_category.icon IS 'アイコン'
/
COMMENT ON COLUMN m_stamp_category.priority IS '表示プライオリティ'
/
COMMENT ON COLUMN m_stamp_category.crt_dt IS '作成日時'
/
COMMENT ON COLUMN m_stamp_category.upd_dt IS '更新日時'
/
COMMENT ON COLUMN m_stamp_category.enabled IS '有効性／''0''：無効, ''1''：有効'
/
DROP TABLE t_stamp_data CASCADE
/
CREATE TABLE t_stamp_data
(
    stamp_id                       INTEGER NOT NULL,
    survey_cd                      CHAR(5) NOT NULL,
    user_id                        INTEGER NOT NULL,
    rec_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    stamp_category_cd              CHAR(3) NOT NULL,
    stamp_comment                  TEXT,
    lat                            FLOAT8,
    lon                            FLOAT8,
    alt                            SMALLINT,
    accuracy                       FLOAT8,
    photo                          VARCHAR(200),
    photo_key                      VARCHAR(100),
    crt_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    upd_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    enabled                        CHAR(1) DEFAULT '1' NOT NULL
)
/
ALTER TABLE t_stamp_data
    ADD CONSTRAINT pk_stamp PRIMARY KEY  (stamp_id)
/
COMMENT ON TABLE t_stamp_data IS 'スタンプデータ'
/
COMMENT ON COLUMN t_stamp_data.stamp_id IS 'スタンプid'
/
COMMENT ON COLUMN t_stamp_data.survey_cd IS '調査コード'
/
COMMENT ON COLUMN t_stamp_data.user_id IS 'ユーザーid'
/
COMMENT ON COLUMN t_stamp_data.rec_dt IS '記録日時'
/
COMMENT ON COLUMN t_stamp_data.stamp_category_cd IS 'スタンプ種別コード'
/
COMMENT ON COLUMN t_stamp_data.stamp_comment IS 'スタンプコメント'
/
COMMENT ON COLUMN t_stamp_data.lat IS '緯度'
/
COMMENT ON COLUMN t_stamp_data.lon IS '経度'
/
COMMENT ON COLUMN t_stamp_data.alt IS '高度'
/
COMMENT ON COLUMN t_stamp_data.accuracy IS '精度'
/
COMMENT ON COLUMN t_stamp_data.photo IS '画像'
/
COMMENT ON COLUMN t_stamp_data.photo_key IS '画像キー'
/
COMMENT ON COLUMN t_stamp_data.crt_dt IS '作成日時'
/
COMMENT ON COLUMN t_stamp_data.upd_dt IS '更新日時'
/
COMMENT ON COLUMN t_stamp_data.enabled IS '有効性／''0''：無効, ''1''：有効'
/
DROP TABLE t_locfeeder CASCADE
/
CREATE TABLE t_locfeeder
(
    locfeeder_id                   INTEGER NOT NULL,
    survey_cd                      CHAR(5) NOT NULL,
    user_id                        INTEGER NOT NULL,
    rec_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    transportation_cd              CHAR(3) NOT NULL,
    trip_id                        INTEGER NOT NULL,
    crt_f                          CHAR(1) DEFAULT '1' NOT NULL,
    operation_id                   INTEGER,
    transportation_type            CHAR(1) NOT NULL,
    crt_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    upd_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    enabled                        CHAR(1) DEFAULT '1' NOT NULL
)
/
ALTER TABLE t_locfeeder
    ADD CONSTRAINT pk_locfeeder PRIMARY KEY  (locfeeder_id)
/
COMMENT ON TABLE t_locfeeder IS '移動手段データ'
/
COMMENT ON COLUMN t_locfeeder.locfeeder_id IS '手段変更id'
/
COMMENT ON COLUMN t_locfeeder.survey_cd IS '調査コード'
/
COMMENT ON COLUMN t_locfeeder.user_id IS 'ユーザーid'
/
COMMENT ON COLUMN t_locfeeder.rec_dt IS '記録日時'
/
COMMENT ON COLUMN t_locfeeder.transportation_cd IS '移動手段コード'
/
COMMENT ON COLUMN t_locfeeder.trip_id IS 'トリップid'
/
COMMENT ON COLUMN t_locfeeder.crt_f IS '作成フラグ／''1''：アプリ、''2''：webダイアリ'
/
COMMENT ON COLUMN t_locfeeder.operation_id IS '操作id'
/
COMMENT ON COLUMN t_locfeeder.transportation_type IS '移動手段タイプ／1：出発操作
5：移動手段変更操作'
/
COMMENT ON COLUMN t_locfeeder.crt_dt IS '作成日時'
/
COMMENT ON COLUMN t_locfeeder.upd_dt IS '更新日時'
/
COMMENT ON COLUMN t_locfeeder.enabled IS '有効性／''0''：無効, ''1''：有効'
/
DROP TABLE m_admin CASCADE
/
CREATE TABLE m_admin
(
    admin_id                       VARCHAR NOT NULL,
    survey_cd                      CHAR(5) NOT NULL,
    password                       VARCHAR(60) NOT NULL,
    note                           TEXT,
    crt_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    upd_dt                         TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    enabled                        CHAR(1) DEFAULT '1' NOT NULL
)
/
ALTER TABLE m_admin
    ADD CONSTRAINT pk_admin PRIMARY KEY  (admin_id, survey_cd, password)
/
COMMENT ON TABLE m_admin IS '管理者マスタ'
/
COMMENT ON COLUMN m_admin.admin_id IS '管理者id'
/
COMMENT ON COLUMN m_admin.survey_cd IS '調査コード'
/
COMMENT ON COLUMN m_admin.password IS 'パスワード'
/
COMMENT ON COLUMN m_admin.note IS '備考'
/
COMMENT ON COLUMN m_admin.crt_dt IS '作成日時'
/
COMMENT ON COLUMN m_admin.upd_dt IS '更新日時'
/
COMMENT ON COLUMN m_admin.enabled IS '有効性／''0''：無効, ''1''：有効'
/
