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
COMMENT ON TABLE m_survey IS '�����}�X�^'
/
COMMENT ON COLUMN m_survey.survey_cd IS '�����R�[�h'
/
COMMENT ON COLUMN m_survey.survey_nm IS '������'
/
COMMENT ON COLUMN m_survey.start_time IS '�����J�n����'
/
COMMENT ON COLUMN m_survey.end_time IS '�����I������'
/
COMMENT ON COLUMN m_survey.post_data_send_interval IS '�f�[�^���M�Ԋu�^[�b]�f�[�^���M�Ԋu'
/
COMMENT ON COLUMN m_survey.transportation_upd_dt IS '�ړ���i�X�V����'
/
COMMENT ON COLUMN m_survey.active_upd_dt IS '�ړ��ړI�X�V����'
/
COMMENT ON COLUMN m_survey.setting_upd_dt IS '�ݒ�X�V����'
/
COMMENT ON COLUMN m_survey.stamp_category_upd_dt IS '�X�^���v�J�e�S���X�V����'
/
COMMENT ON COLUMN m_survey.stamp_use_flag IS '�X�^���v���p�t���O�^1�F���p
0�F���p����'
/
COMMENT ON COLUMN m_survey.default_lat IS '��ܓx'
/
COMMENT ON COLUMN m_survey.default_lon IS '��o�x'
/
COMMENT ON COLUMN m_survey.maps_api_key IS 'maps_api_key'
/
COMMENT ON COLUMN m_survey.webdav_path IS 'WEBDAV�A�b�v���[�h��^�J���}��؂�ŕ����ݒ�'
/
COMMENT ON COLUMN m_survey.diary_url IS '�_�C�A���[URL'
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
COMMENT ON TABLE m_setting_iphone IS 'iphone�ݒ�'
/
COMMENT ON COLUMN m_setting_iphone.survey_cd IS '�����R�[�h'
/
COMMENT ON COLUMN m_setting_iphone.loc_activity_type IS '�ʒu����activity_type�^1:clactivitytypefitness
2:clactivitytypeautomotivenavigation
3:clactivitytypeothernavigation
4:clactivitytypeother'
/
COMMENT ON COLUMN m_setting_iphone.loc_distance_filter IS '�ʒu����distance_filter�^[m]'
/
COMMENT ON COLUMN m_setting_iphone.loc_desire_accuracy IS '�ʒu����desire_accuracy�^1:kcllocationaccuracybest�F�ō����x
2:kcllocationaccuracynearesttenmeters�F10��
3:kcllocationaccuracyhundredmeters�F100��
4:kcllocationaccuracykilometer�F1����
5:kcllocationaccuracythreekilometers�F3����'
/
COMMENT ON COLUMN m_setting_iphone.acc_hz IS '�����x���ʎ��g���^�����x�̑��ʎ��g��[hz]'
/
COMMENT ON COLUMN m_setting_iphone.pressure_interval IS '�C������interval�^[�~���b]
��iphone�̋C���Z���T�[�̓f�t�H���g�łP�b�ȏ�Ōv������Ă���l�q'
/
COMMENT ON COLUMN m_setting_iphone.acc_f IS '�����x�v���t���O�^0:�v�����Ȃ�
1:�v������'
/
COMMENT ON COLUMN m_setting_iphone.pressure_f IS '�C���v���t���O�^0:�v�����Ȃ�
1:�v������'
/
COMMENT ON COLUMN m_setting_iphone.crt_dt IS '�쐬����'
/
COMMENT ON COLUMN m_setting_iphone.upd_dt IS '�X�V����'
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
COMMENT ON TABLE m_setting_android IS 'android�ݒ�'
/
COMMENT ON COLUMN m_setting_android.survey_cd IS '�����R�[�h'
/
COMMENT ON COLUMN m_setting_android.loc_priority IS '�ʒu���ʐ��x�^1:priority_high_accuracy
2:priority_balanced_power_accuracy'
/
COMMENT ON COLUMN m_setting_android.loc_smallest_displacement IS '�ʒu���ʍŏ������ψʁ^[m]�ŏ��ړ�����'
/
COMMENT ON COLUMN m_setting_android.loc_fastest_interval IS '�ʒu����fasetestinterval�^[�~���b]setfastestinterval'
/
COMMENT ON COLUMN m_setting_android.loc_interval IS '�ʒu����interval�^[�~���b]setinterval'
/
COMMENT ON COLUMN m_setting_android.pressure_interval IS '�C������interval�^[�~���b]'
/
COMMENT ON COLUMN m_setting_android.wifi_interval IS 'wifi����interval�^[�~���b]'
/
COMMENT ON COLUMN m_setting_android.acc_f IS '�����x�v���t���O�^0:�v�����Ȃ�
1:�v������'
/
COMMENT ON COLUMN m_setting_android.pressure_f IS '�C���v���t���O�^0:�v�����Ȃ�
1:�v������'
/
COMMENT ON COLUMN m_setting_android.wifi_f IS 'wifi�v���t���O�^0:�v�����Ȃ�
1:�v������'
/
COMMENT ON COLUMN m_setting_android.crt_dt IS '�쐬����'
/
COMMENT ON COLUMN m_setting_android.upd_dt IS '�X�V����'
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
COMMENT ON TABLE m_user IS '���[�U�['
/
COMMENT ON COLUMN m_user.user_id IS '���[�U�[id'
/
COMMENT ON COLUMN m_user.survey_cd IS '�����R�[�h'
/
COMMENT ON COLUMN m_user.user_nm IS '���[�U�[��'
/
COMMENT ON COLUMN m_user.login_id IS '���O�C��id'
/
COMMENT ON COLUMN m_user.password IS '�p�X���[�h'
/
COMMENT ON COLUMN m_user.user_status IS '���[�U�[��ԁ^1�F���p��
9�F���p�s��'
/
COMMENT ON COLUMN m_user.registration_id IS '�o�^id'
/
COMMENT ON COLUMN m_user.device_type IS '�[���^�C�v�^a�Fandroid
i�Fiphone'
/
COMMENT ON COLUMN m_user.device_nm IS '�[�����́^�[���̖���'
/
COMMENT ON COLUMN m_user.auth_key IS '�F��key�^���O�C�����ɔ��s����key'
/
COMMENT ON COLUMN m_user.login_dt IS '�ŏI���O�C�������^���O�C�����ɋL�^���鎞��'
/
COMMENT ON COLUMN m_user.transportation_set_dt IS '�ړ���i�ݒ����'
/
COMMENT ON COLUMN m_user.active_set_dt IS '�ړ��ړI�ݒ����'
/
COMMENT ON COLUMN m_user.term_setting_set_dt IS '�[���ݒ����'
/
COMMENT ON COLUMN m_user.stamp_category_set_dt IS '�X�^���v�J�e�S���ݒ����'
/
COMMENT ON COLUMN m_user.delete_data_flag IS '�f�[�^�폜�t���O�^0�F�폜���Ȃ�
1�F�폜����'
/
COMMENT ON COLUMN m_user.last_operation_record_dt IS '�ŏI������L�^����'
/
COMMENT ON COLUMN m_user.last_loc_record_dt IS '�ŏI�ʒu���L�^����'
/
COMMENT ON COLUMN m_user.last_acc_record_dt IS '�ŏI�����x���L�^����'
/
COMMENT ON COLUMN m_user.last_pressure_record_dt IS '�ŏI�C�����L�^����'
/
COMMENT ON COLUMN m_user.last_wifi_record_dt IS '�ŏIwifi���L�^����'
/
COMMENT ON COLUMN m_user.last_stamp_record_dt IS '�ŏI�X�^���v���L�L�^����'
/
COMMENT ON COLUMN m_user.crt_dt IS '�쐬����'
/
COMMENT ON COLUMN m_user.upd_dt IS '�X�V����'
/
COMMENT ON COLUMN m_user.note IS '���l'
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
COMMENT ON TABLE m_active IS '�ړ��ړI�}�X�^'
/
COMMENT ON COLUMN m_active.survey_cd IS '�����R�[�h'
/
COMMENT ON COLUMN m_active.active_cd IS '�ړ��ړI�R�[�h'
/
COMMENT ON COLUMN m_active.lang_cd IS '����R�[�h'
/
COMMENT ON COLUMN m_active.active_nm IS '�ړ��ړI��'
/
COMMENT ON COLUMN m_active.icon IS '�A�C�R��'
/
COMMENT ON COLUMN m_active.priority IS '�\���v���C�I���e�B'
/
COMMENT ON COLUMN m_active.crt_dt IS '�쐬����'
/
COMMENT ON COLUMN m_active.upd_dt IS '�X�V����'
/
COMMENT ON COLUMN m_active.enabled IS '�L�����^''0''�F����, ''1''�F�L��'
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
COMMENT ON TABLE m_transportation IS '�ړ���i�}�X�^'
/
COMMENT ON COLUMN m_transportation.survey_cd IS '�����R�[�h'
/
COMMENT ON COLUMN m_transportation.transportation_cd IS '�ړ���i�R�[�h'
/
COMMENT ON COLUMN m_transportation.lang_cd IS '����R�[�h'
/
COMMENT ON COLUMN m_transportation.transportation_nm IS '�ړ���i��'
/
COMMENT ON COLUMN m_transportation.icon IS '�A�C�R��'
/
COMMENT ON COLUMN m_transportation.priority IS '�\���v���C�I���e�B'
/
COMMENT ON COLUMN m_transportation.crt_dt IS '�쐬����'
/
COMMENT ON COLUMN m_transportation.upd_dt IS '�X�V����'
/
COMMENT ON COLUMN m_transportation.enabled IS '�L�����^''0''�F����, ''1''�F�L��'
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
COMMENT ON TABLE t_acc_data IS '�����x�f�[�^'
/
COMMENT ON COLUMN t_acc_data.acc_id IS '�����xid'
/
COMMENT ON COLUMN t_acc_data.survey_cd IS '�����R�[�h'
/
COMMENT ON COLUMN t_acc_data.user_id IS '���[�U�[id'
/
COMMENT ON COLUMN t_acc_data.rec_dt IS '�L�^����'
/
COMMENT ON COLUMN t_acc_data.acc_x IS 'acc_x'
/
COMMENT ON COLUMN t_acc_data.acc_y IS 'acc_y'
/
COMMENT ON COLUMN t_acc_data.acc_z IS 'acc_z'
/
COMMENT ON COLUMN t_acc_data.crt_dt IS '�쐬����'
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
COMMENT ON TABLE t_loc_data IS '�ʒu�f�[�^'
/
COMMENT ON COLUMN t_loc_data.loc_id IS '�ʒu����id'
/
COMMENT ON COLUMN t_loc_data.survey_cd IS '�����R�[�h'
/
COMMENT ON COLUMN t_loc_data.user_id IS '���[�U�[id'
/
COMMENT ON COLUMN t_loc_data.rec_dt IS '�L�^����'
/
COMMENT ON COLUMN t_loc_data.lat IS '�ܓx'
/
COMMENT ON COLUMN t_loc_data.lon IS '�o�x'
/
COMMENT ON COLUMN t_loc_data.alt IS '���x'
/
COMMENT ON COLUMN t_loc_data.accuracy IS '���x'
/
COMMENT ON COLUMN t_loc_data.bearing IS '�x�A�����O'
/
COMMENT ON COLUMN t_loc_data.speed IS '���x'
/
COMMENT ON COLUMN t_loc_data.gps_mode IS '���ʃ��[�h�^1�Fhigh_accuracy
2�Fbattery_accuracy'
/
COMMENT ON COLUMN t_loc_data.crt_dt IS '�쐬����'
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
COMMENT ON TABLE t_pressure_data IS '�C���f�[�^'
/
COMMENT ON COLUMN t_pressure_data.pressure_id IS '�C��id'
/
COMMENT ON COLUMN t_pressure_data.survey_cd IS '�����R�[�h'
/
COMMENT ON COLUMN t_pressure_data.user_id IS '���[�U�[id'
/
COMMENT ON COLUMN t_pressure_data.rec_dt IS '�L�^����'
/
COMMENT ON COLUMN t_pressure_data.pressure IS '�C���^[hpa]'
/
COMMENT ON COLUMN t_pressure_data.crt_dt IS '�쐬����'
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
COMMENT ON TABLE t_operation_data IS '����f�[�^'
/
COMMENT ON COLUMN t_operation_data.operation_id IS '����id'
/
COMMENT ON COLUMN t_operation_data.survey_cd IS '�����R�[�h'
/
COMMENT ON COLUMN t_operation_data.user_id IS '���[�U�[id'
/
COMMENT ON COLUMN t_operation_data.rec_dt IS '�L�^����'
/
COMMENT ON COLUMN t_operation_data.operation_type IS '����^�C�v�^1�F�o������
5�F�ړ���i�ύX����
7�F��������'
/
COMMENT ON COLUMN t_operation_data.transportation_cd IS '�ړ���i�R�[�h'
/
COMMENT ON COLUMN t_operation_data.active_cd IS '�ړ��ړI�R�[�h'
/
COMMENT ON COLUMN t_operation_data.trip_id IS '�g���b�vid'
/
COMMENT ON COLUMN t_operation_data.crt_dt IS '�쐬����'
/
COMMENT ON COLUMN t_operation_data.upd_dt IS '�X�V����'
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
COMMENT ON TABLE t_trip IS '�g���b�v�f�[�^'
/
COMMENT ON COLUMN t_trip.trip_id IS '�g���b�vid'
/
COMMENT ON COLUMN t_trip.survey_cd IS '�����R�[�h'
/
COMMENT ON COLUMN t_trip.user_id IS '���[�U�[id'
/
COMMENT ON COLUMN t_trip.rec_dt_dep IS '�o������'
/
COMMENT ON COLUMN t_trip.rec_dt_arr IS '��������'
/
COMMENT ON COLUMN t_trip.operation_id_dep IS '�o������id'
/
COMMENT ON COLUMN t_trip.operation_id_arr IS '��������id'
/
COMMENT ON COLUMN t_trip.active_cd IS '�ړ��ړI�R�[�h'
/
COMMENT ON COLUMN t_trip.crt_f IS '�쐬�t���O�^1:�A�v������̃f�[�^����쐬
2:web�_�C�A���[����쐬
9:���̑�'
/
COMMENT ON COLUMN t_trip.loc_count IS '���ʓ_��'
/
COMMENT ON COLUMN t_trip.crt_dt IS '�쐬����'
/
COMMENT ON COLUMN t_trip.upd_dt IS '�X�V����'
/
COMMENT ON COLUMN t_trip.enabled IS '�L�����^''0''�F����, ''1''�F�L��'
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
COMMENT ON TABLE t_wifi_data IS 'wifi�f�[�^'
/
COMMENT ON COLUMN t_wifi_data.wifi_id IS 'wifiid'
/
COMMENT ON COLUMN t_wifi_data.survey_cd IS '�����R�[�h'
/
COMMENT ON COLUMN t_wifi_data.user_id IS '���[�U�[id'
/
COMMENT ON COLUMN t_wifi_data.rec_dt IS '�L�^����'
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
COMMENT ON COLUMN t_wifi_data.crt_dt IS '�쐬����'
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
COMMENT ON TABLE m_stamp_category IS '�X�^���v��ʃ}�X�^'
/
COMMENT ON COLUMN m_stamp_category.survey_cd IS '�����R�[�h'
/
COMMENT ON COLUMN m_stamp_category.stamp_category_cd IS '�X�^���v��ʃR�[�h'
/
COMMENT ON COLUMN m_stamp_category.lang_cd IS '����R�[�h'
/
COMMENT ON COLUMN m_stamp_category.stamp_category_nm IS '�X�^���v��ʖ�'
/
COMMENT ON COLUMN m_stamp_category.icon IS '�A�C�R��'
/
COMMENT ON COLUMN m_stamp_category.priority IS '�\���v���C�I���e�B'
/
COMMENT ON COLUMN m_stamp_category.crt_dt IS '�쐬����'
/
COMMENT ON COLUMN m_stamp_category.upd_dt IS '�X�V����'
/
COMMENT ON COLUMN m_stamp_category.enabled IS '�L�����^''0''�F����, ''1''�F�L��'
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
COMMENT ON TABLE t_stamp_data IS '�X�^���v�f�[�^'
/
COMMENT ON COLUMN t_stamp_data.stamp_id IS '�X�^���vid'
/
COMMENT ON COLUMN t_stamp_data.survey_cd IS '�����R�[�h'
/
COMMENT ON COLUMN t_stamp_data.user_id IS '���[�U�[id'
/
COMMENT ON COLUMN t_stamp_data.rec_dt IS '�L�^����'
/
COMMENT ON COLUMN t_stamp_data.stamp_category_cd IS '�X�^���v��ʃR�[�h'
/
COMMENT ON COLUMN t_stamp_data.stamp_comment IS '�X�^���v�R�����g'
/
COMMENT ON COLUMN t_stamp_data.lat IS '�ܓx'
/
COMMENT ON COLUMN t_stamp_data.lon IS '�o�x'
/
COMMENT ON COLUMN t_stamp_data.alt IS '���x'
/
COMMENT ON COLUMN t_stamp_data.accuracy IS '���x'
/
COMMENT ON COLUMN t_stamp_data.photo IS '�摜'
/
COMMENT ON COLUMN t_stamp_data.photo_key IS '�摜�L�['
/
COMMENT ON COLUMN t_stamp_data.crt_dt IS '�쐬����'
/
COMMENT ON COLUMN t_stamp_data.upd_dt IS '�X�V����'
/
COMMENT ON COLUMN t_stamp_data.enabled IS '�L�����^''0''�F����, ''1''�F�L��'
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
COMMENT ON TABLE t_locfeeder IS '�ړ���i�f�[�^'
/
COMMENT ON COLUMN t_locfeeder.locfeeder_id IS '��i�ύXid'
/
COMMENT ON COLUMN t_locfeeder.survey_cd IS '�����R�[�h'
/
COMMENT ON COLUMN t_locfeeder.user_id IS '���[�U�[id'
/
COMMENT ON COLUMN t_locfeeder.rec_dt IS '�L�^����'
/
COMMENT ON COLUMN t_locfeeder.transportation_cd IS '�ړ���i�R�[�h'
/
COMMENT ON COLUMN t_locfeeder.trip_id IS '�g���b�vid'
/
COMMENT ON COLUMN t_locfeeder.crt_f IS '�쐬�t���O�^''1''�F�A�v���A''2''�Fweb�_�C�A��'
/
COMMENT ON COLUMN t_locfeeder.operation_id IS '����id'
/
COMMENT ON COLUMN t_locfeeder.transportation_type IS '�ړ���i�^�C�v�^1�F�o������
5�F�ړ���i�ύX����'
/
COMMENT ON COLUMN t_locfeeder.crt_dt IS '�쐬����'
/
COMMENT ON COLUMN t_locfeeder.upd_dt IS '�X�V����'
/
COMMENT ON COLUMN t_locfeeder.enabled IS '�L�����^''0''�F����, ''1''�F�L��'
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
COMMENT ON TABLE m_admin IS '�Ǘ��҃}�X�^'
/
COMMENT ON COLUMN m_admin.admin_id IS '�Ǘ���id'
/
COMMENT ON COLUMN m_admin.survey_cd IS '�����R�[�h'
/
COMMENT ON COLUMN m_admin.password IS '�p�X���[�h'
/
COMMENT ON COLUMN m_admin.note IS '���l'
/
COMMENT ON COLUMN m_admin.crt_dt IS '�쐬����'
/
COMMENT ON COLUMN m_admin.upd_dt IS '�X�V����'
/
COMMENT ON COLUMN m_admin.enabled IS '�L�����^''0''�F����, ''1''�F�L��'
/
