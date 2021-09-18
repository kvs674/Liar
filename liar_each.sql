SET SESSION sql_mode = 'NO_ENGINE_SUBSTITUTION';

CREATE TABLE `ktvs_admin_system_log` (
    `event_level` tinyint(1) unsigned NOT NULL DEFAULT '0',
    `event_code` int(10) unsigned NOT NULL DEFAULT '0',
    `event_message` varchar(255) NOT NULL,
    `event_details` text,
    `event_trace` text,
    `process_id` bigint(20) unsigned NOT NULL DEFAULT '0',
    `process_name` varchar(255) NOT NULL DEFAULT '',
    `added_date` datetime NOT NULL,
    `added_microtime` int(10) NOT NULL,
    KEY `event_level` (`event_level`),
    KEY `process_id` (`process_id`),
    KEY `added_date` (`added_date`, `added_microtime`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_admin_audit_log` (
    `record_id` int(10) unsigned NOT NULL auto_increment,
    `user_id` int(10) unsigned NOT NULL,
    `username` varchar(255) NOT NULL,
    `action_id` tinyint(3) unsigned NOT NULL,
    `object_id` int(10) unsigned NOT NULL,
    `object_type_id` tinyint(3) unsigned NOT NULL,
    `action_details` text NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`record_id`),
    KEY `object_id` (`object_id`),
    KEY `object_type_id` (`object_type_id`),
    KEY `added_date` (`added_date`),
    KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_admin_conversion_servers` (
    `server_id` int(10) unsigned NOT NULL auto_increment,
    `title` varchar(255) NOT NULL default '',
    `status_id` tinyint(1) unsigned NOT NULL,
    `connection_type_id` tinyint(1) unsigned NOT NULL,
    `max_tasks` int(10) unsigned NOT NULL,
    `task_types` TEXT NOT NULL,
    `is_allow_any_tasks` tinyint(1) unsigned NOT NULL,
    `process_priority` tinyint(3) unsigned NOT NULL,
    `option_storage_servers` tinyint(1) unsigned NOT NULL,
    `option_pull_source_files` tinyint(1) unsigned NOT NULL,
    `path` varchar(150) NOT NULL default '',
    `ftp_host` varchar(150) NOT NULL default '',
    `ftp_port` varchar(150) NOT NULL default '',
    `ftp_user` varchar(150) NOT NULL default '',
    `ftp_pass` varchar(150) NOT NULL default '',
    `ftp_folder` varchar(150) NOT NULL default '',
    `ftp_timeout` varchar(150) NOT NULL default '',
    `ftp_force_ssl` tinyint(1) unsigned NOT NULL default 0,
    `error_id` tinyint(1) unsigned NOT NULL,
    `error_iteration` int(10) unsigned NOT NULL,
    `load` float NOT NULL,
    `total_space` bigint(20) NOT NULL,
    `free_space` bigint(20) NOT NULL,
    `heartbeat_date` datetime NOT NULL,
    `api_version` varchar(10) NOT NULL,
    `added_date` datetime NOT NULL,
    `is_debug_enabled` tinyint(1) unsigned NOT NULL,
    PRIMARY KEY (`server_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_admin_notifications` (
    `notification_id` VARCHAR(100) NOT NULL DEFAULT '',
    `objects` int(10) NOT NULL DEFAULT 0,
    PRIMARY KEY (`notification_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_admin_permissions` (
    `permission_id` int(10) unsigned NOT NULL auto_increment,
    `title` varchar(255) NOT NULL default '',
    `sort_id` int(10) unsigned NOT NULL,
    `group_sort_id` int(10) unsigned NOT NULL,
    PRIMARY KEY (`permission_id`),
    UNIQUE KEY `title` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_admin_processes` (
    `pid` VARCHAR(100) NOT NULL,
    `last_exec_date` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
    `last_exec_duration` INT(10) UNSIGNED NOT NULL DEFAULT '0',
    `exec_interval` INT(10) UNSIGNED NOT NULL,
    `exec_tod` TINYINT(2) UNSIGNED NOT NULL,
    `status_data` TEXT NOT NULL,
    PRIMARY KEY (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=UTF8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_admin_satellites` (
    `multi_prefix` varchar(255) NOT NULL default '',
    `project_url` varchar(255) NOT NULL default '',
    `website_ui_data` text NOT NULL,
    `state_id` tinyint(1) unsigned NOT NULL,
    PRIMARY KEY (`multi_prefix`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_admin_servers` (
    `server_id` int(10) unsigned NOT NULL auto_increment,
    `group_id` int(10) unsigned NOT NULL,
    `title` varchar(255) NOT NULL default '',
    `content_type_id` tinyint(1) unsigned NOT NULL,
    `status_id` tinyint(1) unsigned NOT NULL,
    `connection_type_id` tinyint(1) unsigned NOT NULL,
    `streaming_type_id` tinyint(1) unsigned NOT NULL,
    `streaming_script` varchar(255) NOT NULL default '',
    `streaming_key` varchar(255) NOT NULL default '',
    `streaming_param` varchar(255) NOT NULL default '',
    `streaming_check_disabled` tinyint(1) unsigned NOT NULL,
    `is_replace_domain_on_satellite` tinyint(1) unsigned NOT NULL,
    `path` varchar(150) NOT NULL default '',
    `remote_path` varchar(150) NOT NULL default '',
    `ftp_host` varchar(150) NOT NULL default '',
    `ftp_port` varchar(150) NOT NULL default '',
    `ftp_user` varchar(150) NOT NULL default '',
    `ftp_pass` varchar(150) NOT NULL default '',
    `ftp_folder` varchar(150) NOT NULL default '',
    `ftp_timeout` varchar(150) NOT NULL default '',
    `ftp_force_ssl` tinyint(1) unsigned NOT NULL default 0,
    `urls` text NOT NULL,
    `is_remote` tinyint(1) unsigned NOT NULL,
    `control_script_url` varchar(150) NOT NULL default '',
    `control_script_url_version` varchar(10) NOT NULL default '',
    `control_script_url_lock_ip` tinyint(1) NOT NULL default 0,
    `time_offset` float NOT NULL,
    `load` float NOT NULL,
    `total_space` bigint(20) NOT NULL,
    `free_space` bigint(20) NOT NULL,
    `added_date` datetime NOT NULL,
    `lb_weight` float NOT NULL,
    `lb_countries` varchar(1000) NOT NULL default '',
    `error_id` tinyint(1) unsigned NOT NULL,
    `error_iteration` int(10) unsigned NOT NULL,
    `last_check_video_id` int(10) unsigned NOT NULL,
    `is_debug_enabled` tinyint(1) unsigned NOT NULL,
    PRIMARY KEY (`server_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_admin_servers_groups` (
    `group_id` int(10) unsigned NOT NULL auto_increment,
    `title` varchar(255) NOT NULL default '',
    `content_type_id` tinyint(1) unsigned NOT NULL,
    `status_id` tinyint(1) unsigned NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_admin_system_extensions` (
    `file_path` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`file_path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_admin_users` (
    `user_id` int(10) unsigned NOT NULL auto_increment,
    `group_id` int(11) unsigned NOT NULL,
    `status_id` tinyint(1) unsigned NOT NULL,
    `is_ip_protection_disabled` tinyint(1) unsigned NOT NULL,
    `is_expert_mode` tinyint(1) unsigned NOT NULL,
    `is_hide_forum_hints` tinyint(1) unsigned NOT NULL,
    `is_popups_enabled` tinyint(1) unsigned NOT NULL,
    `is_old_list_navigation` tinyint(1) unsigned NOT NULL,
    `is_wysiwyg_enabled_videos` tinyint(1) unsigned NOT NULL,
    `is_wysiwyg_enabled_albums` tinyint(1) unsigned NOT NULL,
    `is_wysiwyg_enabled_posts` tinyint(1) unsigned NOT NULL,
    `is_wysiwyg_enabled_other` tinyint(1) unsigned NOT NULL,
    `is_superadmin` tinyint(1) unsigned NOT NULL,
    `is_access_to_own_content` tinyint(1) unsigned NOT NULL,
    `is_access_to_disabled_content` tinyint(1) unsigned NOT NULL,
    `is_access_to_content_flagged_with` varchar(255) DEFAULT '' NOT NULL,
    `is_debug_enabled` tinyint(1) unsigned NOT NULL,
    `login` varchar(100) NOT NULL,
    `pass` varchar(255) NOT NULL,
    `lang` varchar(50) NOT NULL,
    `skin` varchar(50) NOT NULL,
    `short_date_format` varchar(30) NOT NULL,
    `full_date_format` varchar(30) NOT NULL,
    `content_scheduler_days` int(10) unsigned NOT NULL default '14',
    `content_scheduler_days_option` tinyint(1) unsigned NOT NULL default '0',
    `description` text NOT NULL,
    `preference` text NOT NULL,
    `last_ip` bigint(20) unsigned NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_admin_users_groups` (
    `group_id` int(10) unsigned NOT NULL auto_increment,
    `is_access_to_own_content` tinyint(1) unsigned NOT NULL,
    `is_access_to_disabled_content` tinyint(1) unsigned NOT NULL,
    `is_access_to_content_flagged_with` varchar(255) DEFAULT '' NOT NULL,
    `title` varchar(255) NOT NULL default '',
    `description` text NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_admin_users_groups_permissions` (
    `group_id` int(10) unsigned NOT NULL,
    `permission_id` int(10) unsigned NOT NULL,
    PRIMARY KEY (`group_id`,`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_admin_users_permissions` (
    `user_id` int(10) unsigned NOT NULL,
    `permission_id` int(10) unsigned NOT NULL,
    PRIMARY KEY (`user_id`,`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_albums` (
    `album_id` int(10) unsigned NOT NULL auto_increment,
    `server_group_id` int(10) unsigned NOT NULL,
    `user_id` int(10) unsigned NOT NULL,
    `admin_user_id` int(10) unsigned NOT NULL,
    `main_photo_id` int(10) unsigned NOT NULL,
    `status_id` tinyint(1) unsigned NOT NULL,
    `content_source_id` int(10) unsigned NOT NULL,
    `admin_flag_id` int(10) unsigned NOT NULL,
    `connected_video_id` int(10) unsigned NOT NULL,
    `is_private` tinyint(1) unsigned NOT NULL,
    `access_level_id` tinyint(1) unsigned NOT NULL,
    `is_review_needed` tinyint(1) unsigned NOT NULL default '0',
    `is_locked` tinyint(1) unsigned NOT NULL,
    `tokens_required` int(10) unsigned NOT NULL,
    `title` varchar(255) NOT NULL,
    `dir` varchar(255) NOT NULL,
    `description` text NOT NULL,
    `has_preview` tinyint(1) unsigned NOT NULL default '0',
    `photos_amount` int(10) unsigned NOT NULL,
    `zip_files` varchar (1000) NOT NULL,
    `delete_reason` text NOT NULL,
    `gallery_url` varchar(255) NOT NULL,
    `rating` int(10) NOT NULL,
    `rating_amount` int(10) unsigned NOT NULL,
    `album_viewed` int(10) unsigned NOT NULL,
    `album_viewed_unique` int(10) unsigned NOT NULL,
    `album_viewed_paid` int(10) unsigned NOT NULL,
    `comments_count` int(10) unsigned NOT NULL,
    `favourites_count` int(10) unsigned NOT NULL,
    `purchases_count` int(10) unsigned NOT NULL,
    `relative_post_date` int(10) NOT NULL,
    `post_date` datetime NOT NULL,
    `last_time_view_date` datetime NOT NULL,
    `added_date` datetime NOT NULL,
    `ip` bigint(20) unsigned NOT NULL,
    `external_key` varchar(32) NOT NULL,
    `af_upload_zone` tinyint(1) unsigned NOT NULL default 0,
    `af_custom1` int(10) unsigned NOT NULL,
    `af_custom2` int(10) unsigned NOT NULL,
    `af_custom3` int(10) unsigned NOT NULL,
    `custom1` text NOT NULL,
    `custom2` text NOT NULL,
    `custom3` text NOT NULL,
    `random1` int(10) unsigned NOT NULL,
    `has_errors` BIT(8) NOT NULL DEFAULT 0,
    PRIMARY KEY (`album_id`),
    KEY `status_id` (`status_id`,`relative_post_date`,`post_date`),
    KEY `user_id` (`user_id`),
    KEY `content_source_id` (`content_source_id`),
    KEY `external_key` (`external_key`),
    KEY `gallery_url` (`gallery_url`),
    KEY `random1` (`random1`),
    KEY `is_private` (`is_private`),
    KEY `is_review_needed` (`is_review_needed`),
    KEY `dir` (`dir`),
    KEY `post_date` (`post_date`,`album_id`),
    KEY `last_time_view_date` (`last_time_view_date`),
    KEY `rating` (`rating`,`rating_amount`),
    KEY `album_viewed` (`album_viewed`),
    KEY `comments_count` (`comments_count`),
    KEY `favourites_count` (`favourites_count`),
    FULLTEXT KEY `title` (`title`,`description`),
    FULLTEXT KEY `title_related` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_albums_images` (
    `image_id` int(10) unsigned NOT NULL auto_increment,
    `album_id` int(10) unsigned NOT NULL default '0',
    `title` text NOT NULL,
    `format` varchar(4) NOT NULL,
    `rating` int(10) NOT NULL,
    `rating_amount` int(10) unsigned NOT NULL,
    `comments_count` int(10) unsigned NOT NULL,
    `image_viewed` int(10) unsigned NOT NULL,
    `image_formats` varchar(1000) NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`image_id`),
    KEY `album_id` (`album_id`),
    KEY `format` (`format`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_albums_visits` (
    `ip` bigint(20) unsigned NOT NULL,
    `album_id` int(10) unsigned NOT NULL,
    `flag` tinyint(1) unsigned NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`ip`,`album_id`,`flag`),
    KEY `ip` (`ip`),
    KEY `added_date` (`added_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_background_imports` (
    `import_id` int(10) unsigned NOT NULL,
    `task_id` int(10) unsigned NOT NULL DEFAULT '0',
    `admin_id` int(10) unsigned NOT NULL,
    `status_id` tinyint(1) NOT NULL,
    `type_id` tinyint(1) NOT NULL,
    `threads` int(10) unsigned NOT NULL DEFAULT '1',
    `options` text NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`import_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_background_imports_data` (
    `import_id` int(10) unsigned NOT NULL,
    `line_id` int(10) unsigned NOT NULL,
    `status_id` tinyint(1) NOT NULL,
    `thread_id` int(10) unsigned NOT NULL,
    `object_id` int(10) unsigned NOT NULL DEFAULT '0',
    `data` text NOT NULL,
    PRIMARY KEY (`import_id`, `line_id`),
    KEY `import_id` (`import_id`),
    KEY `status_id` (`status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_background_tasks` (
    `task_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `status_id` tinyint(1) NOT NULL,
    `type_id` tinyint(1) NOT NULL,
    `priority` int(10) unsigned NOT NULL DEFAULT '10',
    `server_id` int(10) unsigned NOT NULL DEFAULT '0',
    `last_server_id` int(10) unsigned NOT NULL DEFAULT '0',
    `video_id` int(10) unsigned NOT NULL DEFAULT '0',
    `album_id` int(10) unsigned NOT NULL DEFAULT '0',
    `last_processed_id` int(10) unsigned NOT NULL DEFAULT '0',
    `last_error_id` int(10) unsigned NOT NULL DEFAULT '0',
    `data` text,
    `message` varchar(255) NOT NULL DEFAULT '',
    `error_code` int(10) unsigned NOT NULL DEFAULT '0',
    `times_restarted` tinyint(2) unsigned NOT NULL DEFAULT '0',
    `added_date` datetime NOT NULL,
    `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
    `progress` int(10) unsigned NOT NULL DEFAULT '0',
    `effective_duration` int(10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`task_id`),
    KEY `status_id` (`status_id`),
    KEY `server_id` (`server_id`),
    KEY `video_id` (`video_id`),
    KEY `album_id` (`album_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_background_tasks_history` (
    `task_id` int (10) unsigned NOT NULL,
    `status_id` tinyint(1) NOT NULL,
    `type_id` tinyint(1) NOT NULL,
    `video_id` int (10) unsigned NOT NULL DEFAULT '0',
    `album_id` int (10) unsigned NOT NULL DEFAULT '0',
    `server_id` int (10) unsigned NOT NULL DEFAULT '0',
    `data` text,
    `message` varchar(255) NOT NULL DEFAULT '',
    `error_code` int (10) unsigned NOT NULL DEFAULT '0',
    `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
    `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
    `effective_duration` int(10) NOT NULL DEFAULT '0',
    PRIMARY KEY (`task_id`),
    KEY `status_id` (`status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_background_tasks_postponed` (
    `task_id` int (10) unsigned NOT NULL AUTO_INCREMENT,
    `type_id` tinyint(1) NOT NULL,
    `video_id` int (10) unsigned NOT NULL DEFAULT '0',
    `album_id` int (10) unsigned NOT NULL DEFAULT '0',
    `data` text NOT NULL,
    `added_date` datetime NOT NULL,
    `due_date` datetime NOT NULL,
    PRIMARY KEY (`task_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_bill_log` (
    `record_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `internal_provider_id` varchar(50) NOT NULL,
    `message_type` tinyint(1) unsigned NOT NULL,
    `message_text` varchar(255) NOT NULL,
    `message_details` text NOT NULL,
    `is_postback` tinyint(1) unsigned NOT NULL,
    `is_alert` tinyint(1) unsigned NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`record_id`),
    KEY `added_date` (`added_date`),
    KEY `message_type` (`message_type`),
    KEY `is_alert` (`is_alert`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_bill_outs` (
    `outs_amount` int(10) unsigned NOT NULL,
    `declines_amount` int(10) unsigned NOT NULL,
    `added_date` date NOT NULL,
    KEY `added_date` (`added_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_bill_transactions` (
    `transaction_id` int(10) unsigned NOT NULL auto_increment,
    `external_id` varchar(100) NOT NULL,
    `external_guid` varchar(255) NOT NULL,
    `external_purchase_id` varchar(100) NOT NULL,
    `external_package_id` varchar(100) NOT NULL,
    `internal_provider_id` varchar(100) NOT NULL,
    `status_id` int(10) unsigned NOT NULL,
    `bill_type_id` int(10) unsigned NOT NULL,
    `type_id` int(10) unsigned NOT NULL,
    `user_id` int(10) unsigned NOT NULL,
    `is_trial` tinyint(1) unsigned NOT NULL,
    `duration_rebill` int(10) unsigned NOT NULL,
    `access_code` varchar(50) NOT NULL,
    `access_code_referral_award` int(10) unsigned NOT NULL,
    `transaction_log` text NOT NULL,
    `access_start_date` datetime,
    `access_end_date` datetime,
    `is_unlimited_access` tinyint(1) NOT NULL,
    `tokens_granted` int(10) unsigned NOT NULL,
    `ip` bigint(20) unsigned NOT NULL,
    `country_code` varchar(3) NOT NULL,
    `price` float NOT NULL,
    `currency_code` varchar(3) NOT NULL,
    `is_auto_expire` tinyint(1) NOT NULL,
    PRIMARY KEY (`transaction_id`),
    KEY `purchase_id` (`external_purchase_id`, `internal_provider_id`),
    KEY `external_id` (`external_id`, `internal_provider_id`),
    KEY `access_code` (`access_code`),
    KEY `status_id` (`status_id`),
    KEY `bill_type_id` (`bill_type_id`),
    KEY `type_id` (`type_id`),
    KEY `user_id` (`user_id`),
    KEY `cron` (`access_end_date`,`status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_card_bill_packages` (
    `package_id` int(10) unsigned NOT NULL auto_increment,
    `provider_id` int(10) unsigned NOT NULL,
    `status_id` int(10) unsigned NOT NULL,
    `scope_id` tinyint(1) unsigned NOT NULL,
    `is_default` tinyint(1) unsigned NOT NULL,
    `sort_id` int(10) unsigned NOT NULL,
    `duration_initial` int(10) unsigned NOT NULL,
    `duration_rebill` int(10) unsigned NOT NULL,
    `price_initial` varchar(20) NOT NULL,
    `price_initial_currency` varchar(3) NOT NULL,
    `price_rebill` varchar(20) NOT NULL,
    `price_rebill_currency` varchar(3) NOT NULL,
    `tokens` int(10) unsigned NOT NULL,
    `title` varchar(255) NOT NULL,
    `payment_page_url` varchar(400) NOT NULL,
    `oneclick_page_url` varchar(400) NOT NULL,
    `include_countries` varchar(1000) NOT NULL,
    `exclude_countries` varchar(1000) NOT NULL,
    `satellite_prefix` varchar(255) NOT NULL,
    `external_id` varchar(100) NOT NULL,
    PRIMARY KEY (`package_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_card_bill_providers` (
    `provider_id` int(10) unsigned NOT NULL auto_increment,
    `account_id` varchar(50) NOT NULL,
    `sub_account_id` varchar(50) NOT NULL,
    `status_id` int(10) unsigned NOT NULL,
    `is_default` tinyint(1) unsigned NOT NULL,
    `internal_id` varchar(50) NOT NULL,
    `title` varchar(255) NOT NULL,
    `url` varchar(255) NOT NULL,
    `signature` varchar(255) NOT NULL,
    `cf_pkg_trials` tinyint(1) unsigned NOT NULL,
    `cf_pkg_rebills` tinyint(1) unsigned NOT NULL,
    `cf_pkg_tokens` tinyint(1) unsigned NOT NULL,
    `cf_pkg_oneclick` tinyint(1) unsigned NOT NULL,
    `cf_pkg_setprice` tinyint(1) unsigned NOT NULL,
    `postback_reseller_param` varchar(255) NOT NULL,
    `postback_ip_protection` varchar(255) NOT NULL,
    `postback_username` varchar (255) NOT NULL,
    `postback_password` varchar (255) NOT NULL,
    `postback_repost_url` varchar(255) NOT NULL,
    `datalink_url` varchar (255) NOT NULL,
    `datalink_username` varchar (255) NOT NULL,
    `datalink_password` varchar (255) NOT NULL,
    `datalink_last_exec_date` datetime NOT NULL,
    `datalink_last_check_date` datetime NOT NULL,
    `datalink_use_ip` varchar (25) NOT NULL,
    `options` text NOT NULL,
    PRIMARY KEY (`provider_id`),
    UNIQUE KEY `internal_id` (`internal_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_categories` (
    `category_id` int(10) unsigned NOT NULL auto_increment,
    `category_group_id` int(11) NOT NULL,
    `sort_id` int(10) unsigned NOT NULL,
    `status_id` tinyint(1) unsigned NOT NULL default '1',
    `title` varchar(255) NOT NULL default '',
    `dir` varchar(255) NOT NULL default '',
    `description` text NOT NULL,
    `synonyms` text NOT NULL,
    `screenshot1` varchar(100) NOT NULL default '',
    `screenshot2` varchar(100) NOT NULL default '',
    `added_date` datetime NOT NULL,
    `custom1` text NOT NULL,
    `custom2` text NOT NULL,
    `custom3` text NOT NULL,
    `custom4` text NOT NULL,
    `custom5` text NOT NULL,
    `custom6` text NOT NULL,
    `custom7` text NOT NULL,
    `custom8` text NOT NULL,
    `custom9` text NOT NULL,
    `custom10` text NOT NULL,
    `custom_file1` varchar(100) NOT NULL default '',
    `custom_file2` varchar(100) NOT NULL default '',
    `custom_file3` varchar(100) NOT NULL default '',
    `custom_file4` varchar(100) NOT NULL default '',
    `custom_file5` varchar(100) NOT NULL default '',
    `total_videos` int(10) unsigned NOT NULL,
    `today_videos` int(10) unsigned NOT NULL,
    `total_albums` int(10) unsigned NOT NULL,
    `today_albums` int(10) unsigned NOT NULL,
    `total_photos` int(10) unsigned NOT NULL,
    `total_posts` int(10) unsigned NOT NULL,
    `today_posts` int(10) unsigned NOT NULL,
    `total_playlists` int(10) unsigned NOT NULL,
    `total_dvds` int(10) unsigned NOT NULL,
    `total_dvd_groups` int(10) unsigned NOT NULL,
    `total_cs` int(10) unsigned NOT NULL,
    `total_models` int(10) unsigned NOT NULL,
    `avg_videos_rating` float NOT NULL,
    `avg_videos_popularity` float NOT NULL,
    `max_videos_ctr` decimal(20,4) NOT NULL,
    `avg_albums_rating` float NOT NULL,
    `avg_albums_popularity` float NOT NULL,
    `avg_posts_rating` float NOT NULL,
    `avg_posts_popularity` float NOT NULL,
    `subscribers_count` int(10) unsigned NOT NULL,
    PRIMARY KEY (`category_id`),
    KEY `status_id` (`status_id`),
    KEY `category_group_id` (`category_group_id`),
    KEY `dir` (`dir`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_categories_albums` (
    `id` int(10) unsigned NOT NULL auto_increment,
    `category_id` int(10) unsigned NOT NULL,
    `album_id` int(10) unsigned NOT NULL,
    PRIMARY KEY (`category_id`,`album_id`),
    UNIQUE KEY `id` (`id`),
    KEY `album_id` (`album_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_categories_content_sources` (
    `id` int(10) unsigned NOT NULL auto_increment,
    `category_id` int(10) unsigned NOT NULL,
    `content_source_id` int(10) unsigned NOT NULL,
    PRIMARY KEY (`category_id`,`content_source_id`),
    UNIQUE KEY `id` (`id`),
    KEY `content_source_id` (`content_source_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_categories_dvds` (
    `id` int(10) unsigned NOT NULL auto_increment,
    `category_id` int(10) unsigned NOT NULL,
    `dvd_id` int(10) unsigned NOT NULL,
    PRIMARY KEY (`category_id`,`dvd_id`),
    UNIQUE KEY `id` (`id`),
    KEY `dvd_id` (`dvd_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_categories_dvds_groups` (
    `id` int(10) unsigned NOT NULL auto_increment,
    `category_id` int(10) unsigned NOT NULL,
    `dvd_group_id` int(10) unsigned NOT NULL,
    PRIMARY KEY (`category_id`,`dvd_group_id`),
    UNIQUE KEY `id` (`id`),
    KEY `dvd_group_id` (`dvd_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_categories_videos` (
    `id` int(10) unsigned NOT NULL auto_increment,
    `category_id` int(10) unsigned NOT NULL,
    `video_id` int(10) unsigned NOT NULL,
    `cr_dlist` bigint(20) unsigned NOT NULL DEFAULT 0,
    `cr_ccount` bigint(20) unsigned NOT NULL DEFAULT 0,
    `cr_cweight` decimal(20,4) unsigned NOT NULL DEFAULT 0,
    `cr_ctr` decimal(20,4) unsigned NOT NULL DEFAULT 0,
    PRIMARY KEY (`category_id`,`video_id`),
    UNIQUE KEY `id` (`id`),
    KEY `video_id` (`video_id`),
    KEY `cr_ctr` (`cr_ctr`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_categories_models` (
    `id` int(10) unsigned NOT NULL auto_increment,
    `category_id` int(10) unsigned NOT NULL,
    `model_id` int(10) unsigned NOT NULL,
    PRIMARY KEY (`category_id`,`model_id`),
    UNIQUE KEY `id` (`id`),
    KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_categories_playlists` (
    `id` int(10) unsigned NOT NULL auto_increment,
    `category_id` int(10) unsigned NOT NULL,
    `playlist_id` int(10) unsigned NOT NULL,
    PRIMARY KEY (`category_id`,`playlist_id`),
    UNIQUE KEY `id` (`id`),
    KEY `playlist_id` (`playlist_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_categories_posts` (
    `id` int(10) unsigned NOT NULL auto_increment,
    `category_id` int(10) unsigned NOT NULL,
    `post_id` int(10) unsigned NOT NULL,
    PRIMARY KEY (`category_id`,`post_id`),
    UNIQUE KEY `id` (`id`),
    KEY `post_id` (`post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_categories_groups` (
    `category_group_id` int(10) unsigned NOT NULL auto_increment,
    `sort_id` int(11) NOT NULL,
    `status_id` tinyint(1) unsigned NOT NULL default '1',
    `external_id` varchar(100) NOT NULL,
    `title` varchar(255) NOT NULL default '',
    `dir` varchar(255) NOT NULL default '',
    `description` text NOT NULL,
    `screenshot1` varchar(100) NOT NULL default '',
    `screenshot2` varchar(100) NOT NULL default '',
    `added_date` datetime NOT NULL,
    `custom1` text NOT NULL,
    `custom2` text NOT NULL,
    `custom3` text NOT NULL,
    PRIMARY KEY (`category_group_id`),
    KEY `status_id` (`status_id`),
    KEY `dir` (`dir`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_comments` (
    `comment_id` int(10) unsigned NOT NULL auto_increment,
    `object_id` int(10) unsigned NOT NULL,
    `object_sub_id` int(10) unsigned NOT NULL,
    `object_type_id` tinyint(2) unsigned NOT NULL,
    `user_id` int(10) unsigned NOT NULL,
    `anonymous_username` varchar(255) NOT NULL default '',
    `is_approved` tinyint(1) NOT NULL,
    `is_review_needed` tinyint(1) NOT NULL,
    `comment` text NOT NULL,
    `comment_md5` varchar(32) NOT NULL default '',
    `ip` bigint(20) unsigned NOT NULL,
    `country_code` varchar(3) NOT NULL,
    `language_code` varchar(2) NOT NULL,
    `likes` int(10) unsigned NOT NULL,
    `dislikes` int(10) unsigned NOT NULL,
    `rating` int(10) NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`comment_id`),
    KEY `object_id` (`object_id`,`object_type_id`,`is_approved`),
    KEY `object_sub_id` (`object_sub_id`,`object_type_id`,`is_approved`),
    KEY `object_type_id` (`object_type_id`),
    KEY `user_id` (`user_id`,`is_approved`),
    KEY `is_review_needed` (`is_review_needed`),
    KEY `added_date` (`added_date`),
    KEY `rating` (`rating`),
    KEY `ip` (`ip`),
    KEY `comment_md5` (`comment_md5`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_comments_vote_history` (
    `comment_id` int(10) unsigned NOT NULL default '0',
    `ip` bigint(20) unsigned NOT NULL default '0',
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`comment_id`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `ktvs_content_sources` (
    `content_source_id` int(11) unsigned NOT NULL auto_increment,
    `content_source_group_id` int(11) NOT NULL,
    `sort_id` int(10) unsigned NOT NULL,
    `status_id` tinyint(1) unsigned NOT NULL default '1',
    `title` varchar(255) NOT NULL default '',
    `dir` varchar(255) NOT NULL,
    `description` text NOT NULL,
    `synonyms` text NOT NULL,
    `screenshot1` varchar(100) NOT NULL default '',
    `screenshot2` varchar(100) NOT NULL default '',
    `url` varchar(255) NOT NULL default '',
    `rating` int(10) NOT NULL,
    `rating_amount` int(10) unsigned NOT NULL,
    `cs_viewed` int(10) unsigned NOT NULL,
    `comments_count` int(10) unsigned NOT NULL,
    `subscribers_count` int(10) unsigned NOT NULL,
    `custom1` text NOT NULL,
    `custom2` text NOT NULL,
    `custom3` text NOT NULL,
    `custom4` text NOT NULL,
    `custom5` text NOT NULL,
    `custom6` text NOT NULL,
    `custom7` text NOT NULL,
    `custom8` text NOT NULL,
    `custom9` text NOT NULL,
    `custom10` text NOT NULL,
    `custom_file1` varchar(100) NOT NULL default '',
    `custom_file2` varchar(100) NOT NULL default '',
    `custom_file3` varchar(100) NOT NULL default '',
    `custom_file4` varchar(100) NOT NULL default '',
    `custom_file5` varchar(100) NOT NULL default '',
    `custom_file6` varchar(100) NOT NULL default '',
    `custom_file7` varchar(100) NOT NULL default '',
    `custom_file8` varchar(100) NOT NULL default '',
    `custom_file9` varchar(100) NOT NULL default '',
    `custom_file10` varchar(100) NOT NULL default '',
    `total_videos` int(10) unsigned NOT NULL,
    `today_videos` int(10) unsigned NOT NULL,
    `total_albums` int(10) unsigned NOT NULL,
    `today_albums` int(10) unsigned NOT NULL,
    `total_photos` int(10) unsigned NOT NULL,
    `avg_videos_rating` float NOT NULL,
    `avg_videos_popularity` float NOT NULL,
    `avg_albums_rating` float NOT NULL,
    `avg_albums_popularity` float NOT NULL,
    `last_content_date` datetime NOT NULL,
    `rank` int(10) unsigned NOT NULL,
    `last_rank` int(10) unsigned NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`content_source_id`),
    KEY `content_source_group_id` (`content_source_group_id`),
    KEY `dir` (`dir`),
    KEY `status_id` (`status_id`),
    KEY `rank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_content_sources_groups` (
    `content_source_group_id` int(10) unsigned NOT NULL auto_increment,
    `sort_id` int(11) NOT NULL,
    `status_id` tinyint(1) unsigned NOT NULL default '1',
    `external_id` varchar(100) NOT NULL,
    `title` varchar(255) NOT NULL default '',
    `dir` varchar(255) NOT NULL default '',
    `description` text NOT NULL,
    `custom1` text NOT NULL,
    `custom2` text NOT NULL,
    `custom3` text NOT NULL,
    `custom4` text NOT NULL,
    `custom5` text NOT NULL,
    `added_date` datetime NOT NULL default '0000-00-00 00:00:00',
    PRIMARY KEY (`content_source_group_id`),
    KEY `dir` (`dir`),
    KEY `status_id` (`status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_deleted_content` (
    `object_id` int(10) unsigned NOT NULL,
    `object_type_id` tinyint(2) unsigned NOT NULL,
    `dir` varchar(255) NOT NULL default '',
    `url` varchar(255) NOT NULL default '',
    `file_key` varchar(32) NOT NULL,
    `external_key` varchar(32) NOT NULL,
    `deleted_date` datetime NOT NULL,
    PRIMARY KEY (`object_id`,`object_type_id`),
    KEY `url` (`url`),
    KEY `file_key` (`file_key`),
    KEY `external_key` (`external_key`),
    KEY `deleted_date` (`object_type_id`, `deleted_date`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_dvds` (
    `dvd_id` int(10) unsigned NOT NULL auto_increment,
    `title` varchar(255) NOT NULL default '',
    `dir` varchar(255) NOT NULL,
    `description` text NOT NULL,
    `cover1_front` varchar(100) NOT NULL default '',
    `cover1_back` varchar(100) NOT NULL default '',
    `cover2_front` varchar(100) NOT NULL default '',
    `cover2_back` varchar(100) NOT NULL default '',
    `user_id` int(10) unsigned not null,
    `dvd_group_id` int(10) unsigned not null,
    `sort_id` int(10) unsigned NOT NULL,
    `status_id` tinyint(1) unsigned NOT NULL default '1',
    `release_year` int(10) unsigned NOT NULL,
    `is_video_upload_allowed` tinyint(1) unsigned not null,
    `is_review_needed` tinyint(1) unsigned NOT NULL,
    `rating` int(10) NOT NULL,
    `rating_amount` int(10) unsigned NOT NULL,
    `dvd_viewed` int(10) unsigned NOT NULL,
    `comments_count` int(10) unsigned NOT NULL,
    `subscribers_count` int(10) unsigned NOT NULL,
    `custom1` text NOT NULL,
    `custom2` text NOT NULL,
    `custom3` text NOT NULL,
    `custom4` text NOT NULL,
    `custom5` text NOT NULL,
    `custom6` text NOT NULL,
    `custom7` text NOT NULL,
    `custom8` text NOT NULL,
    `custom9` text NOT NULL,
    `custom10` text NOT NULL,
    `custom_file1` varchar(100) NOT NULL default '',
    `custom_file2` varchar(100) NOT NULL default '',
    `custom_file3` varchar(100) NOT NULL default '',
    `custom_file4` varchar(100) NOT NULL default '',
    `custom_file5` varchar(100) NOT NULL default '',
    `total_videos` int(10) unsigned NOT NULL,
    `today_videos` int(10) unsigned NOT NULL,
    `total_videos_duration` int(10) unsigned NOT NULL,
    `avg_videos_rating` float NOT NULL,
    `avg_videos_popularity` float NOT NULL,
    `tokens_required` int(10) unsigned NOT NULL,
    `last_content_date` datetime NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`dvd_id`),
    KEY `dir` (`dir`),
    KEY `user_id` (`user_id`),
    KEY `status_id` (`status_id`),
    KEY `dvd_group_id` (`dvd_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_dvds_groups` (
    `dvd_group_id` int(10) unsigned NOT NULL auto_increment,
    `sort_id` int(10) unsigned NOT NULL,
    `status_id` tinyint(1) unsigned NOT NULL default '1',
    `external_id` varchar(100) NOT NULL,
    `title` varchar(255) NOT NULL default '',
    `dir` varchar(255) NOT NULL,
    `description` text NOT NULL,
    `cover1` varchar(100) NOT NULL default '',
    `cover2` varchar(100) NOT NULL default '',
    `custom1` text NOT NULL,
    `custom2` text NOT NULL,
    `custom3` text NOT NULL,
    `custom4` text NOT NULL,
    `custom5` text NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`dvd_group_id`),
    KEY `dir` (`dir`),
    KEY `status_id` (`status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_fav_albums` (
    `user_id` int(10) unsigned NOT NULL,
    `album_id` int(10) unsigned NOT NULL,
    `added_date` datetime NOT NULL,
    `fav_type` tinyint(2) unsigned NOT NULL,
    PRIMARY KEY (`user_id`,`album_id`,`fav_type`),
    KEY `user_id` (`user_id`,`fav_type`),
    KEY `album_id` (`album_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `ktvs_fav_videos` (
    `user_id` int(10) unsigned NOT NULL,
    `video_id` int(10) unsigned NOT NULL,
    `added_date` datetime NOT NULL,
    `fav_type` tinyint(2) unsigned NOT NULL,
    `playlist_id` int(10) unsigned NOT NULL,
    `playlist_sort_id` int(10) unsigned NOT NULL,
    PRIMARY KEY (`user_id`,`video_id`,`fav_type`,`playlist_id`),
    KEY `user_id` (`user_id`,`fav_type`,`playlist_id`),
    KEY `playlist_id` (`playlist_id`),
    KEY `video_id` (`video_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `ktvs_feedbacks` (
    `feedback_id` int(10) unsigned NOT NULL auto_increment,
    `status_id` tinyint(1) unsigned NOT NULL default '0',
    `email` varchar(100) NOT NULL default '',
    `subject` varchar(255) NOT NULL default '',
    `message` text NOT NULL,
    `ip` bigint(20) unsigned NOT NULL default '0',
    `country_code` varchar(3) NOT NULL,
    `user_agent` text NOT NULL,
    `referer` text NOT NULL,
    `user_id` int(10) unsigned NOT NULL,
    `response` text NOT NULL,
    `custom1` text NOT NULL,
    `custom2` text NOT NULL,
    `custom3` text NOT NULL,
    `custom4` text NOT NULL,
    `custom5` text NOT NULL,
    `added_date` datetime NOT NULL,
    `closed_date` datetime NOT NULL,
    PRIMARY KEY (`feedback_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_feeds_log` (
    `record_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `feed_id` int(10) NOT NULL,
    `message_type` tinyint(1) unsigned NOT NULL,
    `message_text` varchar(255) NOT NULL,
    `message_details` text NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`record_id`),
    KEY `feed_id` (`feed_id`),
    KEY `message_type` (`message_type`),
    KEY `added_date` (`added_date`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_file_history` (
    `change_id` int(10) unsigned NOT NULL auto_increment,
    `path` VARCHAR(255) NOT NULL,
    `hash` VARCHAR(32) NOT NULL,
    `version` int(10) NOT NULL,
    `file_content` MEDIUMTEXT NOT NULL,
    `is_modified` TINYINT(1) UNSIGNED NOT NULL,
    `user_id` int(10) unsigned NOT NULL,
    `username` varchar(255) NOT NULL,
    `added_date` DATETIME NOT NULL,
    PRIMARY KEY (`change_id`),
    UNIQUE KEY `path` (`path`, `version`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_flags` (
    `flag_id` int(10) unsigned NOT NULL auto_increment,
    `group_id` tinyint(1) NOT NULL,
    `title` varchar(255) NOT NULL,
    `external_id` varchar(100) NOT NULL,
    `is_admin_flag` tinyint(1) NOT NULL,
    `is_alert` tinyint(1) NOT NULL,
    `is_event` tinyint(1) NOT NULL,
    `is_rating` tinyint(1) NOT NULL,
    `is_tokens` tinyint(1) NOT NULL,
    `alert_min_count` int(10) unsigned NOT NULL,
    `rating_weight` int(10) NOT NULL,
    `tokens_required` int(10) unsigned NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`flag_id`),
    UNIQUE KEY `external_id` (`external_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_flags_albums` (
    `id` int(10) unsigned NOT NULL auto_increment,
    `flag_id` int(10) unsigned NOT NULL,
    `album_id` int(10) unsigned NOT NULL,
    `image_id` int(10) unsigned NOT NULL,
    `votes` int(10) unsigned NOT NULL,
    PRIMARY KEY (`flag_id`,`album_id`,`image_id`),
    UNIQUE KEY `id` (`id`),
    KEY `album_id` (`album_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_flags_dvds` (
    `id` int(10) unsigned NOT NULL auto_increment,
    `flag_id` int(10) unsigned NOT NULL,
    `dvd_id` int(10) unsigned NOT NULL,
    `votes` int(10) unsigned NOT NULL,
    PRIMARY KEY (`flag_id`,`dvd_id`),
    UNIQUE KEY `id` (`id`),
    KEY `dvd_id` (`dvd_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_flags_history` (
    `flag_id` int(10) unsigned NOT NULL default '0',
    `video_id` int(10) unsigned NOT NULL default '0',
    `album_id` int(10) unsigned NOT NULL default '0',
    `image_id` int(10) unsigned NOT NULL default '0',
    `dvd_id` int(10) unsigned NOT NULL default '0',
    `post_id` int(10) unsigned NOT NULL default '0',
    `playlist_id` int(10) unsigned NOT NULL default '0',
    `ip` bigint(20) unsigned NOT NULL default '0',
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`flag_id`,`video_id`,`album_id`,`image_id`,`dvd_id`,`post_id`,`playlist_id`,`ip`),
    KEY `video_id` (`flag_id`,`video_id`,`ip`),
    KEY `album_id` (`flag_id`,`album_id`,`image_id`,`ip`),
    KEY `dvd_id` (`flag_id`,`dvd_id`,`ip`),
    KEY `post_id` (`flag_id`,`post_id`,`ip`),
    KEY `playlist_id` (`flag_id`,`playlist_id`,`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_flags_messages` (
    `flag_message_id` int(10) unsigned NOT NULL auto_increment,
    `flag_id` int(10) unsigned NOT NULL,
    `video_id` int(10) unsigned NOT NULL,
    `album_id` int(10) unsigned NOT NULL,
    `image_id` int(10) unsigned NOT NULL,
    `dvd_id` int(10) unsigned NOT NULL,
    `post_id` int(10) unsigned NOT NULL,
    `playlist_id` int(10) unsigned NOT NULL,
    `message` text NOT NULL,
    `ip` bigint(20) unsigned NOT NULL default '0',
    `country_code` varchar(3) NOT NULL,
    `user_agent` text NOT NULL,
    `referer` text NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`flag_message_id`),
    KEY `flag_id` (`flag_id`),
    KEY `added_date` (`added_date`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_flags_playlists` (
    `id` int(10) unsigned NOT NULL auto_increment,
    `flag_id` int(10) unsigned NOT NULL,
    `playlist_id` int(10) unsigned NOT NULL,
    `votes` int(10) unsigned NOT NULL,
    PRIMARY KEY (`flag_id`,`playlist_id`),
    UNIQUE KEY `id` (`id`),
    KEY `playlist_id` (`playlist_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_flags_posts` (
    `id` int(10) unsigned NOT NULL auto_increment,
    `flag_id` int(10) unsigned NOT NULL,
    `post_id` int(10) unsigned NOT NULL,
    `votes` int(10) unsigned NOT NULL,
    PRIMARY KEY (`flag_id`,`post_id`),
    UNIQUE KEY `id` (`id`),
    KEY `post_id` (`post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_flags_videos` (
    `id` int(10) unsigned NOT NULL auto_increment,
    `flag_id` int(10) unsigned NOT NULL,
    `video_id` int(10) unsigned NOT NULL,
    `votes` int(10) unsigned NOT NULL,
    PRIMARY KEY (`flag_id`,`video_id`),
    UNIQUE KEY `id` (`id`),
    KEY `video_id` (`video_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_formats_albums` (
    `format_album_id` int(10) unsigned NOT NULL auto_increment,
    `title` varchar(100) NOT NULL,
    `status_id` tinyint(1) NOT NULL,
    `group_id` tinyint(1) NOT NULL,
    `size` varchar(9) NOT NULL,
    `im_options` text NOT NULL,
    `interlace_id` tinyint(1) NOT NULL,
    `comment` varchar(255) NOT NULL,
    `aspect_ratio_id` tinyint(1) NOT NULL,
    `aspect_ratio_gravity` varchar(10) NOT NULL,
    `vertical_aspect_ratio_id` tinyint(1) NOT NULL,
    `vertical_aspect_ratio_gravity` varchar(10) NOT NULL,
    `watermark_position_id` tinyint(1) NOT NULL,
    `watermark_max_width` int(10) NOT NULL,
    `watermark_max_width_vertical` int(10) NOT NULL,
    `customize_watermark_id` int(10) NOT NULL,
    `access_level_id` tinyint(1) NOT NULL,
    `is_create_zip` tinyint(1) NOT NULL,
    `is_skip_crop` tinyint(1) NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`format_album_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_formats_screenshots` (
    `format_screenshot_id` int(10) unsigned NOT NULL auto_increment,
    `title` varchar(100) NOT NULL,
    `status_id` tinyint(1) NOT NULL,
    `group_id` tinyint(1) NOT NULL,
    `size` varchar(9) NOT NULL,
    `image_type` tinyint(1) NOT NULL default '0',
    `im_options` text NOT NULL,
    `im_options_manual` text NOT NULL,
    `interlace_id` tinyint(1) NOT NULL,
    `comment` varchar(255) NOT NULL,
    `aspect_ratio_id` tinyint(1) NOT NULL,
    `aspect_ratio_gravity` varchar(10) NOT NULL,
    `vertical_aspect_ratio_id` tinyint(1) NOT NULL,
    `vertical_aspect_ratio_gravity` varchar(10) NOT NULL,
    `watermark_position_id` tinyint(1) NOT NULL,
    `is_create_zip` tinyint(1) NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`format_screenshot_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_formats_videos` (
    `format_video_id` int(10) unsigned NOT NULL auto_increment,
    `title` varchar(100) NOT NULL,
    `postfix` varchar(32) NOT NULL,
    `status_id` tinyint(1) NOT NULL,
    `is_conditional` tinyint(1) NOT NULL,
    `is_use_as_source` tinyint(1) NOT NULL,
    `video_type_id` tinyint(1) NOT NULL,
    `size` varchar(9) NOT NULL,
    `resize_option` tinyint(1) NOT NULL,
    `resize_option2` tinyint(1) NOT NULL,
    `ffmpeg_options` text NOT NULL,
    `watermark_position_id` tinyint(1) NOT NULL,
    `watermark_max_width` int(10) NOT NULL,
    `watermark_max_width_vertical` int(10) NOT NULL,
    `watermark_scrolling_duration` int(10) NOT NULL,
    `watermark_scrolling_direction` tinyint(1) NOT NULL,
    `watermark_scrolling_times` varchar(100) NOT NULL,
    `customize_watermark_id` int(10) NOT NULL,
    `watermark2_position_id` tinyint(1) NOT NULL,
    `watermark2_max_height` int(10) NOT NULL,
    `watermark2_max_height_vertical` int(10) NOT NULL,
    `watermark2_scrolling_duration` int(10) NOT NULL,
    `watermark2_scrolling_direction` tinyint(1) NOT NULL,
    `watermark2_scrolling_times` varchar(100) NOT NULL,
    `customize_watermark2_id` int(10) NOT NULL,
    `access_level_id` tinyint(1) NOT NULL,
    `is_hotlink_protection_disabled` tinyint(1) NOT NULL,
    `is_download_enabled` tinyint(1) NOT NULL,
    `download_order` int(10) NOT NULL,
    `limit_total_duration` int(10) NOT NULL,
    `limit_total_duration_unit_id` tinyint(1) NOT NULL,
    `limit_total_min_duration_sec` int(10) NOT NULL,
    `limit_total_max_duration_sec` int(10) NOT NULL,
    `limit_number_parts` int(10) NOT NULL,
    `limit_number_parts_crossfade` tinyint(1) NOT NULL,
    `limit_offset_start` int(10) NOT NULL,
    `limit_offset_start_unit_id` tinyint(1) NOT NULL,
    `limit_offset_end` int(10) NOT NULL,
    `limit_offset_end_unit_id` tinyint(1) NOT NULL,
    `limit_is_last_part_from_end` tinyint(1) NOT NULL,
    `customize_duration_id` int(10) NOT NULL,
    `customize_offset_start_id` int(10) NOT NULL,
    `customize_offset_end_id` int(10) NOT NULL,
    `preroll_video_uploaded` tinyint(1) NOT NULL,
    `customize_preroll_video_id` tinyint(2) NOT NULL,
    `postroll_video_uploaded` tinyint(1) NOT NULL,
    `customize_postroll_video_id` tinyint(2) NOT NULL,
    `limit_speed_option` tinyint(1) NOT NULL,
    `limit_speed_value` float NOT NULL,
    `limit_speed_guests_option` tinyint(1) NOT NULL,
    `limit_speed_guests_value` float NOT NULL,
    `limit_speed_standard_option` tinyint(1) NOT NULL,
    `limit_speed_standard_value` float NOT NULL,
    `limit_speed_premium_option` tinyint(1) NOT NULL,
    `limit_speed_premium_value` float NOT NULL,
    `limit_speed_embed_option` tinyint(1) NOT NULL,
    `limit_speed_embed_value` float NOT NULL,
    `limit_speed_countries` varchar(200) NOT NULL default '',
    `is_timeline_enabled` tinyint(1) NOT NULL,
    `timeline_option` tinyint(1) NOT NULL,
    `timeline_amount` int(10) NOT NULL,
    `timeline_interval` int(10) NOT NULL,
    `timeline_directory` varchar(32) NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`format_video_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_friends` (
    `user_id` int(10) unsigned NOT NULL,
    `friend_id` int(10) unsigned NOT NULL,
    `is_approved` int(1) unsigned NOT NULL,
    `added_date` datetime NOT NULL,
    `approved_date` datetime NOT NULL,
    PRIMARY KEY (`user_id`,`friend_id`),
    KEY `user_id` (`user_id`,`is_approved`),
    KEY `friend_id` (`friend_id`,`is_approved`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_languages` (
    `language_id` int(10) unsigned NOT NULL auto_increment,
    `title` varchar(100) NOT NULL,
    `code` varchar(2) NOT NULL,
    `translation_scope_videos` tinyint(1) unsigned NOT NULL,
    `translation_scope_albums` tinyint(1) unsigned NOT NULL,
    `translation_scope_content_sources` tinyint(1) unsigned NOT NULL,
    `translation_scope_content_sources_groups` tinyint(1) unsigned NOT NULL,
    `translation_scope_models` tinyint(1) unsigned NOT NULL,
    `translation_scope_models_groups` tinyint(1) unsigned NOT NULL,
    `translation_scope_dvds` tinyint(1) unsigned NOT NULL,
    `translation_scope_dvds_groups` tinyint(1) unsigned NOT NULL,
    `translation_scope_categories` tinyint(1) unsigned NOT NULL,
    `translation_scope_categories_groups` tinyint(1) unsigned NOT NULL,
    `is_directories_localize` int(1) unsigned NOT NULL,
    `is_directories_translit` int(1) unsigned NOT NULL,
    `directories_translit_rules` text NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_list_countries` (
    `country_id` int(10) unsigned NOT NULL,
    `country_code` varchar(3) NOT NULL,
    `language_code` varchar(2) NOT NULL,
    `continent_code` varchar(2) NOT NULL,
    `title` varchar(100) NOT NULL,
    `is_system` tinyint(1) unsigned NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`country_id`, `country_code`, `language_code`),
    KEY `country_id` (`country_id`, `language_code`),
    KEY `country_code` (`country_code`, `language_code`),
    KEY `language_code` (`language_code`, `is_system`, `title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_log_awards_users` (
    `award_id` int(10) unsigned NOT NULL auto_increment,
    `award_type` tinyint(2) unsigned NOT NULL,
    `video_id` int(10) unsigned NOT NULL,
    `album_id` int(10) unsigned NOT NULL,
    `post_id` int(10) unsigned NOT NULL,
    `profile_id` int(10) unsigned NOT NULL,
    `dvd_id` int(10) unsigned NOT NULL,
    `comment_id` int(10) unsigned NOT NULL,
    `ref_id` int(10) unsigned NOT NULL,
    `donation_id` int(10) unsigned NOT NULL,
    `amount` int(10) unsigned NOT NULL,
    `user_id` int(10) unsigned NOT NULL,
    `added_date` datetime NOT NULL,
    `tokens_granted` int(10) unsigned NOT NULL,
    `payout_id` int(10) unsigned NOT NULL,
    PRIMARY KEY (`award_id`),
    KEY `user_id` (`user_id`),
    KEY `video_id` (`video_id`,`user_id`),
    KEY `album_id` (`album_id`,`user_id`),
    KEY `post_id` (`post_id`,`user_id`),
    KEY `profile_id` (`profile_id`,`user_id`),
    KEY `dvd_id` (`dvd_id`,`user_id`),
    KEY `comment_id` (`comment_id`,`user_id`),
    KEY `added_date` (`added_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `ktvs_log_content_users` (
    `video_id` int(10) unsigned NOT NULL,
    `album_id` int(10) unsigned NOT NULL,
    `user_id` int(10) unsigned NOT NULL,
    `added_date` datetime NOT NULL,
    `is_old` tinyint(1) unsigned NOT NULL,
    `is_file` tinyint(1) unsigned NOT NULL,
    `stream_to` int(10) unsigned NOT NULL,
    KEY `user_id` (`user_id`,`is_old`),
    KEY `video_id` (`video_id`),
    KEY `album_id` (`album_id`),
    KEY `added_date` (`added_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `ktvs_log_donations_users` (
    `donation_id` int(10) unsigned NOT NULL auto_increment,
    `donator_id` int(10) unsigned NOT NULL,
    `user_id` int(10) unsigned NOT NULL,
    `added_date` datetime NOT NULL,
    `tokens` int(10) unsigned NOT NULL,
    `tokens_revenue` int(10) unsigned NOT NULL,
    `comment` text NOT NULL,
    PRIMARY KEY (`donation_id`),
    KEY `added_date` (`added_date`),
    KEY `donator_id` (`donator_id`),
    KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_log_logins` (
    `session_id` varchar(32) NOT NULL default '',
    `user_id` int(11) unsigned NOT NULL,
    `is_failed` tinyint(1) unsigned NOT NULL,
    `login_date` datetime NOT NULL,
    `last_request_date` datetime default NULL,
    `duration` int(11) default NULL,
    `ip` bigint(20) unsigned NOT NULL,
    KEY `login_date` (`login_date`),
    KEY `user_id` (`user_id`),
    KEY `ip` (`ip`),
    KEY `session_id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_log_logins_users` (
    `ip` bigint(20) unsigned NOT NULL,
    `country_code` varchar(3) NOT NULL,
    `user_agent` varchar(50) NOT NULL,
    `login_date` datetime NOT NULL,
    `username` varchar(255) NOT NULL,
    `user_id` int(10) unsigned NOT NULL,
    `is_failed` tinyint(1) unsigned NOT NULL,
    KEY `ip` (`ip`),
    KEY `user_id` (`user_id`),
    KEY `login_date` (`login_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_messages` (
    `message_id` int(10) unsigned NOT NULL auto_increment,
    `user_id` int(10) unsigned NOT NULL,
    `user_from_id` int(10) unsigned NOT NULL,
    `type_id` tinyint(3) unsigned NOT NULL,
    `is_read` tinyint(1) unsigned NOT NULL,
    `is_spam` tinyint(1) unsigned NOT NULL,
    `is_hidden_from_user_id` tinyint(1) unsigned NOT NULL,
    `is_hidden_from_user_from_id` tinyint(1) unsigned NOT NULL,
    `message` text NOT NULL,
    `message_md5` varchar(32) NOT NULL default '',
    `ip` bigint(20) unsigned NOT NULL,
    `added_date` datetime NOT NULL,
    `read_date` datetime default NULL,
    PRIMARY KEY (`message_id`),
    KEY `user_id` (`user_id`),
    KEY `user_from_id` (`user_from_id`),
    KEY `is_spam` (`is_spam`),
    KEY `ip` (`ip`),
    KEY `message_md5` (`message_md5`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_models` (
    `model_id` int(10) unsigned NOT NULL auto_increment,
    `model_group_id` int(10) NOT NULL,
    `sort_id` int(10) unsigned NOT NULL,
    `status_id` tinyint(1) unsigned NOT NULL default '1',
    `title` varchar(255) NOT NULL default '',
    `alias` varchar(500) NOT NULL default '',
    `dir` varchar(255) NOT NULL,
    `description` text NOT NULL,
    `screenshot1` varchar(100) NOT NULL default '',
    `screenshot2` varchar(100) NOT NULL default '',
    `country_id` int(10) unsigned NOT NULL,
    `state` varchar(100) NOT NULL default '',
    `city` varchar(100) NOT NULL default '',
    `height` varchar(100) NOT NULL default '',
    `weight` varchar(100) NOT NULL default '',
    `hair_id` tinyint(1) unsigned NOT NULL,
    `eye_color_id` tinyint(1) unsigned NOT NULL,
    `measurements` varchar(100) NOT NULL default '',
    `gender_id` tinyint(1) unsigned NOT NULL,
    `birth_date` date NOT NULL,
    `death_date` date NOT NULL,
    `age` int(10) unsigned NOT NULL,
    `rating` int(10) NOT NULL,
    `rating_amount` int(10) unsigned NOT NULL,
    `model_viewed` int(10) unsigned NOT NULL,
    `comments_count` int(10) unsigned NOT NULL,
    `subscribers_count` int(10) unsigned NOT NULL,
    `access_level_id` tinyint(1) NOT NULL,
    `gallery_url` varchar(255) NOT NULL,
    `custom1` text NOT NULL,
    `custom2` text NOT NULL,
    `custom3` text NOT NULL,
    `custom4` text NOT NULL,
    `custom5` text NOT NULL,
    `custom6` text NOT NULL,
    `custom7` text NOT NULL,
    `custom8` text NOT NULL,
    `custom9` text NOT NULL,
    `custom10` text NOT NULL,
    `custom_file1` varchar(100) NOT NULL default '',
    `custom_file2` varchar(100) NOT NULL default '',
    `custom_file3` varchar(100) NOT NULL default '',
    `custom_file4` varchar(100) NOT NULL default '',
    `custom_file5` varchar(100) NOT NULL default '',
    `total_videos` int(10) unsigned NOT NULL,
    `today_videos` int(10) unsigned NOT NULL,
    `total_albums` int(10) unsigned NOT NULL,
    `today_albums` int(10) unsigned NOT NULL,
    `total_photos` int(10) unsigned NOT NULL,
    `total_posts` int(10) unsigned NOT NULL,
    `today_posts` int(10) unsigned NOT NULL,
    `total_dvds` int(10) unsigned NOT NULL,
    `total_dvd_groups` int(10) unsigned NOT NULL,
    `avg_videos_rating` float NOT NULL,
    `avg_videos_popularity` float NOT NULL,
    `avg_albums_rating` float NOT NULL,
    `avg_albums_popularity` float NOT NULL,
    `avg_posts_rating` float NOT NULL,
    `avg_posts_popularity` float NOT NULL,
    `last_content_date` datetime NOT NULL,
    `rank` int(10) unsigned NOT NULL,
    `last_rank` int(10) unsigned NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`model_id`),
    KEY `title` (`title`),
    KEY `dir` (`dir`),
    KEY `status_id` (`status_id`),
    KEY `access_level_id` (`access_level_id`),
    KEY `rank` (`rank`),
    KEY `gallery_url` (`gallery_url`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_models_groups` (
    `model_group_id` int(10) unsigned NOT NULL auto_increment,
    `sort_id` int(11) NOT NULL,
    `status_id` tinyint(1) unsigned NOT NULL default '1',
    `external_id` varchar(100) NOT NULL,
    `title` varchar(255) NOT NULL default '',
    `dir` varchar(255) NOT NULL default '',
    `description` text NOT NULL,
    `screenshot1` varchar(100) NOT NULL default '',
    `screenshot2` varchar(100) NOT NULL default '',
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`model_group_id`),
    KEY `status_id` (`status_id`),
    KEY `dir` (`dir`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_models_albums` (
    `id` int(10) unsigned NOT NULL auto_increment,
    `model_id` int(10) unsigned NOT NULL,
    `album_id` int(10) unsigned NOT NULL,
    PRIMARY KEY (`model_id`,`album_id`),
    UNIQUE KEY `id` (`id`),
    KEY `album_id` (`album_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_models_videos` (
    `id` int(10) unsigned NOT NULL auto_increment,
    `model_id` int(10) unsigned NOT NULL,
    `video_id` int(10) unsigned NOT NULL,
    PRIMARY KEY (`model_id`,`video_id`),
    UNIQUE KEY `id` (`id`),
    KEY `video_id` (`video_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_models_posts` (
    `id` int(10) unsigned NOT NULL auto_increment,
    `model_id` int(10) unsigned NOT NULL,
    `post_id` int(10) unsigned NOT NULL,
    PRIMARY KEY (`model_id`,`post_id`),
    UNIQUE KEY `id` (`id`),
    KEY `post_id` (`post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_models_dvds` (
    `id` int(10) unsigned NOT NULL auto_increment,
    `model_id` int(10) unsigned NOT NULL,
    `dvd_id` int(10) unsigned NOT NULL,
    PRIMARY KEY (`model_id`,`dvd_id`),
    UNIQUE KEY `id` (`id`),
    KEY `dvd_id` (`dvd_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_models_dvds_groups` (
    `id` int(10) unsigned NOT NULL auto_increment,
    `model_id` int(10) unsigned NOT NULL,
    `dvd_group_id` int(10) unsigned NOT NULL,
    PRIMARY KEY (`model_id`,`dvd_group_id`),
    UNIQUE KEY `id` (`id`),
    KEY `dvd_group_id` (`dvd_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_options` (
    `variable` varchar(255) NOT NULL default '',
    `value` text NOT NULL,
    PRIMARY KEY (`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_playlists` (
    `playlist_id` int(10) unsigned NOT NULL auto_increment,
    `user_id` int(10) unsigned NOT NULL,
    `title` varchar(255) NOT NULL default '',
    `dir` varchar(255) NOT NULL,
    `description` text NOT NULL,
    `status_id` tinyint(1) unsigned NOT NULL,
    `is_private` tinyint(1) unsigned NOT NULL,
    `is_review_needed` tinyint(1) unsigned NOT NULL,
    `is_locked` tinyint(1) unsigned NOT NULL,
    `rating` int(10) NOT NULL,
    `rating_amount` int(10) unsigned NOT NULL,
    `playlist_viewed` int(10) unsigned NOT NULL,
    `comments_count` int(10) unsigned NOT NULL,
    `subscribers_count` int(10) unsigned NOT NULL,
    `total_videos` int(10) unsigned NOT NULL,
    `last_content_date` datetime NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`playlist_id`),
    KEY `dir` (`dir`),
    KEY `user_id` (`user_id`),
    KEY `status_id` (`status_id`, `is_private`),
    KEY `is_review_needed` (`is_review_needed`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_posts_types` (
    `post_type_id` int(10) unsigned NOT NULL auto_increment,
    `title` varchar(255) NOT NULL default '',
    `external_id` varchar(100) NOT NULL default '',
    `url_pattern` varchar(255) NOT NULL default '',
    `description` text NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`post_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_posts` (
    `post_id` int(10) unsigned NOT NULL auto_increment,
    `post_type_id` int(10) unsigned NOT NULL default 0,
    `user_id` int(10) unsigned NOT NULL default 0,
    `admin_user_id` int(10) unsigned NOT NULL default 0,
    `status_id` tinyint(3) unsigned NOT NULL default 0,
    `is_review_needed` tinyint(1) unsigned NOT NULL default 0,
    `is_locked` tinyint(1) unsigned NOT NULL default 0,
    `connected_video_id` int(10) unsigned NOT NULL default 0,
    `title` varchar(255) NOT NULL default '',
    `dir` varchar(255) NOT NULL default '',
    `description` text NOT NULL,
    `content` MEDIUMTEXT NOT NULL,
    `rating` int(10) NOT NULL default 0,
    `rating_amount` int(10) unsigned NOT NULL default 0,
    `post_viewed` int(10) unsigned NOT NULL default 0,
    `comments_count` int(10) unsigned NOT NULL,
    `last_time_view_date` datetime NOT NULL default '0000-00-00 00:00:00',
    `relative_post_date` int(10) NOT NULL default 0,
    `post_date` datetime NOT NULL default '0000-00-00 00:00:00',
    `added_date` datetime NOT NULL default '0000-00-00 00:00:00',
    `ip` bigint(20) unsigned NOT NULL default 0,
    `custom1` text NOT NULL,
    `custom2` text NOT NULL,
    `custom3` text NOT NULL,
    `custom4` text NOT NULL,
    `custom5` text NOT NULL,
    `custom6` text NOT NULL,
    `custom7` text NOT NULL,
    `custom8` text NOT NULL,
    `custom9` text NOT NULL,
    `custom10` text NOT NULL,
    `custom_file1` varchar(100) NOT NULL default '',
    `custom_file2` varchar(100) NOT NULL default '',
    `custom_file3` varchar(100) NOT NULL default '',
    `custom_file4` varchar(100) NOT NULL default '',
    `custom_file5` varchar(100) NOT NULL default '',
    `custom_file6` varchar(100) NOT NULL default '',
    `custom_file7` varchar(100) NOT NULL default '',
    `custom_file8` varchar(100) NOT NULL default '',
    `custom_file9` varchar(100) NOT NULL default '',
    `custom_file10` varchar(100) NOT NULL default '',
    `af_upload_zone` tinyint(1) unsigned NOT NULL default 0,
    `af_custom1` int(10) unsigned NOT NULL default 0,
    `af_custom2` int(10) unsigned NOT NULL default 0,
    `af_custom3` int(10) unsigned NOT NULL default 0,
    PRIMARY KEY (`post_id`),
    KEY `post_type_id` (`post_type_id`,`status_id`,`relative_post_date`,`post_date`),
    KEY `user_id` (`user_id`),
    KEY `post_date` (`post_date`,`post_id`),
    KEY `last_time_view_date` (`last_time_view_date`),
    KEY `rating` (`rating`,`rating_amount`),
    KEY `post_viewed` (`post_viewed`),
    KEY `dir` (`dir`),
    FULLTEXT KEY `title` (`title`,`description`,`content`),
    FULLTEXT KEY `title_related` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_rating_history` (
    `video_id` int(10) unsigned NOT NULL default '0',
    `album_id` int(10) unsigned NOT NULL default '0',
    `image_id` int(10) unsigned NOT NULL default '0',
    `model_id` int(10) unsigned NOT NULL default '0',
    `content_source_id` int(10) unsigned NOT NULL default '0',
    `dvd_id` int(10) unsigned NOT NULL default '0',
    `post_id` int(10) unsigned NOT NULL default '0',
    `playlist_id` int(10) unsigned NOT NULL default '0',
    `ip` bigint(20) unsigned NOT NULL default '0',
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`video_id`,`album_id`,`image_id`,`model_id`,`content_source_id`,`dvd_id`,`post_id`,`playlist_id`,`ip`),
    KEY `video_id` (`video_id`,`ip`),
    KEY `album_id` (`album_id`,`ip`),
    KEY `image_id` (`image_id`,`ip`),
    KEY `model_id` (`model_id`,`ip`),
    KEY `content_source_id` (`content_source_id`,`ip`),
    KEY `dvd_id` (`dvd_id`,`ip`),
    KEY `post_id` (`post_id`,`ip`),
    KEY `playlist_id` (`playlist_id`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `ktvs_stats_adv_out` (
    `advertisement_id` int(10) unsigned NOT NULL default '0',
    `referer_id` int(10) unsigned NOT NULL default '0',
    `country_code` char(3) NOT NULL default '',
    `device` tinyint(3) NOT NULL,
    `amount` int(10) unsigned NOT NULL default '0',
    `added_date` date NOT NULL default '0000-00-00',
    KEY `advertisement_id` (`advertisement_id`),
    KEY `country_code` (`country_code`),
    KEY `device` (`device`),
    KEY `added_date` (`added_date`),
    KEY `referer_id` (`referer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_stats_albums` (
    `album_id` int(10) unsigned NOT NULL,
    `added_date` date NOT NULL,
    `rating` int(10) NOT NULL,
    `rating_amount` int(10) unsigned NOT NULL,
    `viewed` int(10) unsigned NOT NULL,
    `unique_viewed` int(10) unsigned NOT NULL,
    `files_requested` int(10) unsigned NOT NULL,
    PRIMARY KEY (`album_id`,`added_date`),
    KEY `added_date` (`added_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `ktvs_stats_cs_out` (
    `content_source_id` int(10) unsigned NOT NULL,
    `referer_id` int(10) unsigned NOT NULL,
    `country_code` varchar(3) NOT NULL default '',
    `device` tinyint(3) NOT NULL,
    `amount` int(10) unsigned NOT NULL,
    `added_date` date NOT NULL,
    KEY `countent_source_id` (`content_source_id`),
    KEY `country_code` (`country_code`),
    KEY `device` (`device`),
    KEY `added_date` (`added_date`),
    KEY `referer_id` (`referer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_stats_embed` (
    `domain` varchar(100) NOT NULL default '',
    `amount` int(10) unsigned NOT NULL,
    `added_date` date NOT NULL,
    KEY `domain` (`domain`),
    KEY `added_date` (`added_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_stats_in` (
    `referer_id` int(10) unsigned NOT NULL,
    `country_code` varchar(3) NOT NULL default '',
    `device` tinyint(3) NOT NULL,
    `uniq_amount` int(10) unsigned NOT NULL,
    `raw_amount` int(10) unsigned NOT NULL,
    `summary_amount` int(10) unsigned NOT NULL,
    `view_video_amount` int(10) unsigned NOT NULL,
    `view_player_amount` int(10) unsigned NOT NULL,
    `view_album_amount` int(10) unsigned NOT NULL,
    `view_embed_amount` int(10) unsigned NOT NULL,
    `cs_out_amount` int(10) unsigned NOT NULL,
    `adv_out_amount` int(10) unsigned NOT NULL,
    `added_date` date NOT NULL,
    KEY `referer_id` (`referer_id`),
    KEY `country_code` (`country_code`),
    KEY `device` (`device`),
    KEY `added_date` (`added_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_stats_overload_protection` (
    `amount_max_la_pages` int(10) unsigned NOT NULL,
    `amount_max_sleep_processes` int(10) unsigned NOT NULL,
    `amount_max_la_blocks` int(10) unsigned NOT NULL,
    `amount_max_mysql_processes` int(10) unsigned NOT NULL,
    `amount_max_la_cron` int(10) unsigned NOT NULL,
    `amount_max_timeout_blocks` int(10) unsigned NOT NULL,
    `last_amount_max_la_pages` int(10) unsigned NOT NULL,
    `last_amount_max_sleep_processes` int(10) unsigned NOT NULL,
    `last_amount_max_la_blocks` int(10) unsigned NOT NULL,
    `last_amount_max_mysql_processes` int(10) unsigned NOT NULL,
    `last_amount_max_la_cron` int(10) unsigned NOT NULL,
    `last_amount_max_timeout_blocks` int(10) unsigned NOT NULL,
    `is_warning` tinyint(1) unsigned NOT NULL,
    `added_date` date NOT NULL,
    KEY `added_date` (`added_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_stats_player` (
    `referer_id` int(10) unsigned NOT NULL,
    `country_code` varchar(3) NOT NULL default '',
    `device` tinyint(3) NOT NULL,
    `is_embed` tinyint(1) unsigned NOT NULL,
    `embed_profile_id` varchar(32) NOT NULL default '',
    `player_loads` int(10) unsigned NOT NULL,
    `player_fullscreens` int(10) unsigned NOT NULL,
    `player_mutes` int(10) unsigned NOT NULL,
    `player_unmutes` int(10) unsigned NOT NULL,
    `video_starts` int(10) unsigned NOT NULL,
    `video_pauses` int(10) unsigned NOT NULL,
    `video_skips` int(10) unsigned NOT NULL,
    `video_ends` int(10) unsigned NOT NULL,
    `video_errors` int(10) unsigned NOT NULL,
    `start_ad_views` int(10) unsigned NOT NULL,
    `start_ad_clicks` int(10) unsigned NOT NULL,
    `start_ad_errors` int(10) unsigned NOT NULL,
    `pre_ad_views` int(10) unsigned NOT NULL,
    `pre_ad_clicks` int(10) unsigned NOT NULL,
    `pre_ad_skips` int(10) unsigned NOT NULL,
    `pre_ad_errors` int(10) unsigned NOT NULL,
    `post_ad_views` int(10) unsigned NOT NULL,
    `post_ad_clicks` int(10) unsigned NOT NULL,
    `post_ad_skips` int(10) unsigned NOT NULL,
    `post_ad_errors` int(10) unsigned NOT NULL,
    `pause_ad_views` int(10) unsigned NOT NULL,
    `pause_ad_clicks` int(10) unsigned NOT NULL,
    `pause_ad_errors` int(10) unsigned NOT NULL,
    `added_date` date NOT NULL,
    KEY `country_code` (`country_code`),
    KEY `device` (`device`),
    KEY `added_date` (`added_date`),
    KEY `referer_id` (`referer_id`),
    KEY `is_embed` (`is_embed`),
    KEY `embed_profile_id` (`embed_profile_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_stats_referers_list` (
    `referer_id` int(10) unsigned NOT NULL auto_increment,
    `category_id` int(10) unsigned NOT NULL,
    `title` varchar(255) NOT NULL,
    `description` text NOT NULL,
    `url` varchar(255) NOT NULL,
    `referer` varchar(255) NOT NULL default '',
    `added_date` datetime NOT NULL,
    `custom1` text NOT NULL,
    `custom2` text NOT NULL,
    `custom3` text NOT NULL,
    `custom_file1` varchar(100) NOT NULL default '',
    `custom_file2` varchar(100) NOT NULL default '',
    `custom_file3` varchar(100) NOT NULL default '',
    PRIMARY KEY (`referer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_stats_search` (
    `query` varchar(255) NOT NULL default '',
    `query_md5` varchar(32) NOT NULL default '',
    `query_length` int(10) unsigned NOT NULL,
    `query_results_videos` int(10) unsigned NOT NULL,
    `query_results_albums` int(10) unsigned NOT NULL,
    `query_results_total` int(10) unsigned NOT NULL,
    `is_manual` tinyint(1) unsigned NOT NULL,
    `amount` int(10) unsigned NOT NULL,
    `added_date` date NOT NULL,
    PRIMARY KEY (`query_md5`),
    KEY `added_date` (`added_date`),
    KEY `query_length` (`query_length`),
    KEY `query_results_total` (`query_results_total`),
    KEY `is_manual` (`is_manual`),
    FULLTEXT KEY `query` (`query`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_stats_videos` (
    `video_id` int(10) unsigned NOT NULL,
    `added_date` date NOT NULL,
    `rating` int(10) NOT NULL,
    `rating_amount` int(10) unsigned NOT NULL,
    `viewed` int(10) unsigned NOT NULL,
    `player_viewed` int(10) unsigned NOT NULL,
    `unique_viewed` int(10) unsigned NOT NULL,
    `files_requested` int(10) unsigned NOT NULL,
    `embed_requested` int(10) unsigned NOT NULL,
    `unique_embed_requested` int(10) unsigned NOT NULL,
    PRIMARY KEY (`video_id`,`added_date`),
    KEY `added_date` (`added_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `ktvs_tags` (
    `tag_id` int(10) unsigned NOT NULL auto_increment,
    `tag` varchar(150) NOT NULL default '',
    `tag_dir` varchar(150) NOT NULL default '',
    `synonyms` text NOT NULL,
    `status_id` tinyint(1) unsigned NOT NULL default '1',
    `total_videos` int(10) unsigned NOT NULL,
    `today_videos` int(10) unsigned NOT NULL,
    `total_albums` int(10) unsigned NOT NULL,
    `today_albums` int(10) unsigned NOT NULL,
    `total_photos` int(10) unsigned NOT NULL,
    `total_posts` int(10) unsigned NOT NULL,
    `today_posts` int(10) unsigned NOT NULL,
    `total_playlists` int(10) unsigned NOT NULL,
    `total_dvds` int(10) unsigned NOT NULL,
    `total_dvd_groups` int(10) unsigned NOT NULL,
    `total_cs` int(10) unsigned NOT NULL,
    `total_models` int(10) unsigned NOT NULL,
    `avg_videos_rating` float NOT NULL,
    `avg_videos_popularity` float NOT NULL,
    `avg_albums_rating` float NOT NULL,
    `avg_albums_popularity` float NOT NULL,
    `avg_posts_rating` float NOT NULL,
    `avg_posts_popularity` float NOT NULL,
    `added_date` datetime NOT NULL,
    `custom1` text NOT NULL,
    `custom2` text NOT NULL,
    `custom3` text NOT NULL,
    `custom4` text NOT NULL,
    `custom5` text NOT NULL,
    PRIMARY KEY (`tag_id`),
    UNIQUE KEY `tag` (`tag`),
    UNIQUE KEY `tag_dir` (`tag_dir`),
    KEY `status_id` (`status_id`),
    KEY `added_date` (`added_date`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_tags_albums` (
    `id` int(10) unsigned NOT NULL auto_increment,
    `tag_id` int(10) unsigned NOT NULL,
    `album_id` int(10) unsigned NOT NULL,
    PRIMARY KEY (`tag_id`,`album_id`),
    UNIQUE KEY `id` (`id`),
    KEY `album_id` (`album_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_tags_content_sources` (
    `id` int(10) unsigned NOT NULL auto_increment,
    `tag_id` int(10) unsigned NOT NULL,
    `content_source_id` int(10) unsigned NOT NULL,
    PRIMARY KEY (`tag_id`,`content_source_id`),
    UNIQUE KEY `id` (`id`),
    KEY `content_source_id` (`content_source_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_tags_videos` (
    `id` int(10) unsigned NOT NULL auto_increment,
    `tag_id` int(10) unsigned NOT NULL,
    `video_id` int(10) unsigned NOT NULL,
    `cr_dlist` bigint(20) unsigned NOT NULL DEFAULT 0,
    `cr_ccount` bigint(20) unsigned NOT NULL DEFAULT 0,
    `cr_cweight` decimal(20,4) unsigned NOT NULL DEFAULT 0,
    `cr_ctr` decimal(20,4) unsigned NOT NULL DEFAULT 0,
    PRIMARY KEY (`tag_id`,`video_id`),
    UNIQUE KEY `id` (`id`),
    KEY `video_id` (`video_id`),
    KEY `cr_ctr` (`cr_ctr`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_tags_dvds` (
    `id` int(10) unsigned NOT NULL auto_increment,
    `tag_id` int(10) unsigned NOT NULL,
    `dvd_id` int(10) unsigned NOT NULL,
    PRIMARY KEY (`tag_id`,`dvd_id`),
    UNIQUE KEY `id` (`id`),
    KEY `dvd_id` (`dvd_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_tags_dvds_groups` (
    `id` int(10) unsigned NOT NULL auto_increment,
    `tag_id` int(10) unsigned NOT NULL,
    `dvd_group_id` int(10) unsigned NOT NULL,
    PRIMARY KEY (`tag_id`,`dvd_group_id`),
    UNIQUE KEY `id` (`id`),
    KEY `dvd_group_id` (`dvd_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_tags_models` (
    `id` int(10) unsigned NOT NULL auto_increment,
    `tag_id` int(10) unsigned NOT NULL,
    `model_id` int(10) unsigned NOT NULL,
    PRIMARY KEY (`tag_id`,`model_id`),
    UNIQUE KEY `id` (`id`),
    KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_tags_playlists` (
    `id` int(10) unsigned NOT NULL auto_increment,
    `tag_id` int(10) unsigned NOT NULL,
    `playlist_id` int(10) unsigned NOT NULL,
    PRIMARY KEY (`tag_id`,`playlist_id`),
    UNIQUE KEY `id` (`id`),
    KEY `playlist_id` (`playlist_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_tags_posts` (
    `id` int(10) unsigned NOT NULL auto_increment,
    `tag_id` int(10) unsigned NOT NULL,
    `post_id` int(10) unsigned NOT NULL,
    PRIMARY KEY (`tag_id`,`post_id`),
    UNIQUE KEY `id` (`id`),
    KEY `post_id` (`post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_users` (
    `user_id` int(10) unsigned NOT NULL auto_increment,
    `ip` bigint(20) unsigned NOT NULL default '0',
    `country_id` int(10) unsigned NOT NULL,
    `favourite_category_id` int(10) unsigned NOT NULL,
    `content_source_group_id` int(10) unsigned NOT NULL,
    `gender_id` tinyint(1) unsigned NOT NULL,
    `relationship_status_id` tinyint(1) unsigned NOT NULL,
    `orientation_id` tinyint(1) unsigned NOT NULL,
    `status_id` tinyint(1) unsigned NOT NULL,
    `is_trial` tinyint(1) unsigned NOT NULL,
    `username` varchar(100) NOT NULL default '',
    `pass` varchar(255) NOT NULL default '',
    `pass_bill` varchar(255) NOT NULL default '',
    `email` varchar(100) NOT NULL default '',
    `display_name` varchar(100) NOT NULL default '',
    `status_message` varchar(255) NOT NULL default '',
    `avatar` varchar(100) NOT NULL default '',
    `cover` varchar(100) NOT NULL default '',
    `birth_date` date NOT NULL,
    `website` varchar(255) NOT NULL default '',
    `city` varchar(100) NOT NULL default '',
    `education` varchar(255) NOT NULL default '',
    `occupation` varchar(255) NOT NULL default '',
    `about_me` text NOT NULL,
    `interests` text NOT NULL,
    `favourite_movies` text NOT NULL,
    `favourite_music` text NOT NULL,
    `favourite_books` text NOT NULL,
    `custom1` text NOT NULL,
    `custom2` text NOT NULL,
    `custom3` text NOT NULL,
    `custom4` text NOT NULL,
    `custom5` text NOT NULL,
    `custom6` text NOT NULL,
    `custom7` text NOT NULL,
    `custom8` text NOT NULL,
    `custom9` text NOT NULL,
    `custom10` text NOT NULL,
    `description` text NOT NULL,
    `account_paypal` varchar(100) NOT NULL default '',
    `video_viewed` int(10) unsigned NOT NULL,
    `album_viewed` int(10) unsigned NOT NULL,
    `profile_viewed` int(10) unsigned NOT NULL,
    `video_watched` int(10) unsigned NOT NULL,
    `video_watched_unique` int(10) unsigned NOT NULL,
    `album_watched` int(10) unsigned NOT NULL,
    `album_watched_unique` int(10) unsigned NOT NULL,
    `comments_videos_count` int(10) unsigned NOT NULL,
    `comments_albums_count` int(10) unsigned NOT NULL,
    `comments_cs_count` int(10) unsigned NOT NULL,
    `comments_models_count` int(10) unsigned NOT NULL,
    `comments_dvds_count` int(10) unsigned NOT NULL,
    `comments_posts_count` int(10) unsigned NOT NULL,
    `comments_playlists_count` int(10) unsigned NOT NULL,
    `comments_total_count` int(10) unsigned NOT NULL,
    `ratings_videos_count` int(10) unsigned NOT NULL,
    `ratings_albums_count` int(10) unsigned NOT NULL,
    `ratings_cs_count` int(10) unsigned NOT NULL,
    `ratings_models_count` int(10) unsigned NOT NULL,
    `ratings_dvds_count` int(10) unsigned NOT NULL,
    `ratings_posts_count` int(10) unsigned NOT NULL,
    `ratings_playlists_count` int(10) unsigned NOT NULL,
    `ratings_total_count` int(10) unsigned NOT NULL,
    `logins_count` int(10) unsigned NOT NULL,
    `public_videos_count` int(10) unsigned NOT NULL,
    `private_videos_count` int(10) unsigned NOT NULL,
    `premium_videos_count` int(10) unsigned NOT NULL,
    `total_videos_count` int(10) unsigned NOT NULL,
    `favourite_videos_count` int(10) unsigned NOT NULL,
    `public_albums_count` int(10) unsigned NOT NULL,
    `private_albums_count` int(10) unsigned NOT NULL,
    `premium_albums_count` int(10) unsigned NOT NULL,
    `total_albums_count` int(10) unsigned NOT NULL,
    `favourite_albums_count` int(10) unsigned NOT NULL,
    `total_posts_count` int(10) unsigned NOT NULL,
    `total_posts_count_by_type` varchar(255) NOT NULL,
    `subscribers_count` int(10) unsigned NOT NULL,
    `friends_count` int(10) unsigned NOT NULL,
    `added_date` datetime NOT NULL,
    `last_login_date` datetime NOT NULL,
    `last_online_date` datetime NOT NULL,
    `avg_sess_duration` int(10) unsigned NOT NULL,
    `avg_sess_duration_count` int(10) unsigned NOT NULL,
    `activity` int(10) unsigned NOT NULL,
    `activity_rank` int(10) unsigned NOT NULL,
    `activity_last_rank` int(10) unsigned NOT NULL,
    `temp_pass` varchar(255) NOT NULL,
    `temp_email` varchar(100) NOT NULL,
    `remember_me_key` varchar(32) NOT NULL,
    `remember_me_valid_for` datetime NOT NULL,
    `login_protection_is_banned` tinyint(1) unsigned NOT NULL,
    `login_protection_date_from` datetime NOT NULL,
    `login_protection_restore_code` int(10) unsigned NOT NULL,
    `login_protection_bans_count` int(10) unsigned NOT NULL,
    `login_protection_is_skipped` tinyint(1) unsigned NOT NULL,
    `is_trusted` tinyint(1) unsigned NOT NULL,
    `is_removal_requested` tinyint(1) unsigned NOT NULL,
    `removal_reason` text NOT NULL,
    `reseller_code` varchar(100) NOT NULL,
    `language_code` varchar(2) NOT NULL,
    `tokens_available` int(10) unsigned NOT NULL,
    `tokens_required` int(10) unsigned NOT NULL,
    PRIMARY KEY (`user_id`),
    UNIQUE KEY `username` (`username`),
    KEY `ip` (`ip`),
    KEY `status_id` (`status_id`),
    KEY `email` (`email`),
    KEY `country_id` (`country_id`),
    KEY `gender_id` (`gender_id`),
    KEY `relationship_status_id` (`relationship_status_id`),
    KEY `orientation_id` (`orientation_id`),
    KEY `is_removal_requested` (`is_removal_requested`),
    KEY `remember_me` (`status_id`, `remember_me_key`, `remember_me_valid_for`),
    KEY `birth_date` (`birth_date`),
    KEY `video_viewed` (`video_viewed`),
    KEY `album_viewed` (`album_viewed`),
    KEY `profile_viewed` (`profile_viewed`),
    KEY `comments_total_count` (`comments_total_count`),
    KEY `logins_count` (`logins_count`),
    KEY `total_videos_count` (`total_videos_count`),
    KEY `total_albums_count` (`total_albums_count`),
    KEY `added_date` (`added_date`),
    KEY `last_login_date` (`last_login_date`),
    KEY `activity` (`activity`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_users_blocked_passwords` (
    `user_id` int(10) unsigned NOT NULL,
    `pass` varchar(255) NOT NULL default '',
    KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_users_blocked_domains` (
    `domain` varchar(100) NOT NULL,
    `sort_id` int(10) unsigned NOT NULL default 0,
    PRIMARY KEY (`domain`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_users_blocked_ips` (
    `ip` varchar(30) NOT NULL,
    `sort_id` int(10) unsigned NOT NULL default 0,
    PRIMARY KEY (`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_users_blogs` (
    `entry_id` int(10) unsigned NOT NULL auto_increment,
    `user_id` int(10) unsigned NOT NULL,
    `user_from_id` int(11) NOT NULL,
    `is_approved` tinyint(3) unsigned NOT NULL,
    `entry` text NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`entry_id`),
    KEY `user_id` (`user_id`,`is_approved`),
    KEY `user_from_id` (`user_from_id`,`is_approved`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_users_confirm_codes` (
    `confirm_code` varchar(32) NOT NULL default '',
    `user_id` int(10) unsigned NOT NULL,
    `type_id` tinyint(1) unsigned NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY `confirm_code` (`confirm_code`),
    KEY `added_date` (`added_date`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_users_events` (
    `event_id` int(10) unsigned NOT NULL auto_increment,
    `event_type_id` int(10) unsigned NOT NULL,
    `user_id` int(10) unsigned NOT NULL,
    `user_target_id` int(10) unsigned NOT NULL,
    `video_id` int(10) unsigned NOT NULL,
    `album_id` int(10) unsigned NOT NULL,
    `entry_id` int(10) unsigned NOT NULL,
    `content_source_id` int(10) unsigned NOT NULL,
    `model_id` int(10) unsigned NOT NULL,
    `dvd_id` int(10) unsigned NOT NULL,
    `post_id` int(10) unsigned NOT NULL,
    `playlist_id` int(10) unsigned NOT NULL,
    `comment_id` int(10) unsigned NOT NULL,
    `flag_external_id` varchar(100) NOT NULL default '',
    `status_message` varchar(255) NOT NULL default '',
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`event_id`),
    KEY `user_id` (`user_id`),
    KEY `event_type_id` (`event_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `ktvs_users_ignores` (
    `user_id` int(10) unsigned NOT NULL,
    `ignored_user_id` int(10) unsigned NOT NULL,
    KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_users_payouts` (
    `payout_id` int(10) not null auto_increment,
    `status_id` tinyint(3) unsigned NOT NULL,
    `description` text NOT NULL,
    `award_types` varchar(255) NOT NULL,
    `conversion` float NOT NULL,
    `conversion_currency` varchar(3) NOT NULL,
    `min_tokens_limit` int(10) unsigned NOT NULL,
    `gateway` varchar(50) NOT NULL,
    `tokens` int(10) unsigned NOT NULL,
    `amount` float NOT NULL,
    `comment` varchar(255) NOT NULL,
    `excluded_users` text NOT NULL,
    `included_users` text NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`payout_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_users_payouts_users` (
    `payout_id` int(10) not null,
    `user_id` int(10) unsigned NOT NULL,
    `tokens` int(10) unsigned NOT NULL,
    `amount` float NOT NULL,
    `amount_currency` varchar(3) NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`payout_id`,`user_id`),
    KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_users_purchases` (
    `purchase_id` int(10) not null auto_increment,
    `user_id` int(10) unsigned NOT NULL,
    `owner_user_id` int(10) unsigned NOT NULL,
    `video_id` int(10) unsigned NOT NULL,
    `album_id` int(10) unsigned NOT NULL,
    `profile_id` int(10) unsigned NOT NULL,
    `dvd_id` int(10) unsigned NOT NULL,
    `subscription_id` int(10) unsigned NOT NULL,
    `tokens` int(10) unsigned NOT NULL,
    `tokens_revenue` int(10) unsigned NOT NULL,
    `is_recurring` tinyint(1) unsigned NOT NULL,
    `added_date` datetime NOT NULL,
    `expiry_date` datetime NOT NULL,
    PRIMARY KEY (`purchase_id`),
    KEY `user_id` (`user_id`,`expiry_date`),
    KEY `video_id` (`user_id`,`video_id`,`expiry_date`),
    KEY `album_id` (`user_id`,`album_id`,`expiry_date`),
    KEY `profile_id` (`user_id`,`profile_id`,`expiry_date`),
    KEY `dvd_id` (`user_id`,`dvd_id`,`expiry_date`),
    KEY `is_recurring` (`is_recurring`,`expiry_date`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_users_subscriptions` (
    `subscription_id` int(10) not null auto_increment,
    `user_id` int(10) unsigned NOT NULL,
    `subscribed_object_id` int(10) unsigned NOT NULL,
    `subscribed_type_id` tinyint(1) unsigned NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`subscription_id`),
    KEY `user_id` (`user_id`),
    KEY `subscribed_object_id` (`subscribed_object_id`,`subscribed_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

CREATE TABLE `ktvs_videos` (
    `video_id` int(10) unsigned NOT NULL auto_increment,
    `server_group_id` int(10) unsigned NOT NULL,
    `load_type_id` int(10) unsigned NOT NULL,
    `user_id` int(10) unsigned NOT NULL,
    `admin_user_id` int(10) unsigned NOT NULL,
    `content_source_id` int(10) unsigned NOT NULL,
    `dvd_id` int(10) unsigned NOT NULL,
    `dvd_sort_id` int(10) unsigned NOT NULL,
    `admin_flag_id` int(10) unsigned NOT NULL,
    `status_id` tinyint(3) unsigned NOT NULL,
    `is_hd` tinyint(1) unsigned NOT NULL,
    `is_private` tinyint(1) unsigned NOT NULL,
    `access_level_id` tinyint(1) unsigned NOT NULL,
    `is_review_needed` tinyint(1) unsigned NOT NULL,
    `is_locked` tinyint(1) unsigned NOT NULL,
    `tokens_required` int(10) unsigned NOT NULL,
    `release_year` int(10) unsigned NOT NULL,
    `title` varchar(255) NOT NULL,
    `dir` varchar(255) NOT NULL,
    `description` text NOT NULL,
    `duration` int(10) unsigned NOT NULL,
    `file_formats` varchar (1000) NOT NULL,
    `file_size` bigint(20) unsigned NOT NULL,
    `file_dimensions` varchar(10) NOT NULL,
    `file_url` varchar(255) NOT NULL default '',
    `file_key` varchar(32) NOT NULL,
    `gallery_url` varchar(255) NOT NULL,
    `pseudo_url` varchar(255) NOT NULL,
    `screen_amount` int(10) unsigned NOT NULL,
    `screen_main` int(10) NOT NULL,
    `screen_main_temp` int(10) NOT NULL,
    `poster_amount` int(10) unsigned NOT NULL,
    `poster_main` int(10) NOT NULL,
    `embed` text NOT NULL,
    `delete_reason` text NOT NULL,
    `rating` int(10) NOT NULL,
    `rating_amount` int(10) unsigned NOT NULL,
    `video_viewed` int(10) unsigned NOT NULL,
    `video_viewed_player` int(10) unsigned NOT NULL,
    `video_viewed_unique` int(10) unsigned NOT NULL,
    `video_viewed_paid` int(10) unsigned NOT NULL,
    `embed_viewed` int(10) unsigned NOT NULL,
    `embed_viewed_unique` int(10) unsigned NOT NULL,
    `embed_viewed_paid` int(10) unsigned NOT NULL,
    `comments_count` int(10) unsigned NOT NULL,
    `favourites_count` int(10) unsigned NOT NULL,
    `purchases_count` int(10) unsigned NOT NULL,
    `last_time_view_date` datetime NOT NULL,
    `relative_post_date` int(10) NOT NULL,
    `post_date` datetime NOT NULL,
    `added_date` datetime NOT NULL,
    `ip` bigint(20) unsigned NOT NULL,
    `feed_id` int(10) unsigned NOT NULL,
    `external_key` varchar(32) NOT NULL,
    `r_dlist` bigint(20) unsigned NOT NULL,
    `r_ccount` bigint(20) unsigned NOT NULL,
    `r_cweight` decimal(20,4) unsigned NOT NULL,
    `r_ctr` decimal(20,4) unsigned NOT NULL default 0,
    `rs_dlist` bigint(20) unsigned NOT NULL,
    `rs_ccount` bigint(20) unsigned NOT NULL,
    `rs_completed` tinyint(1) unsigned NOT NULL,
    `af_upload_zone` tinyint(1) unsigned NOT NULL default 0,
    `af_custom1` int(10) unsigned NOT NULL,
    `af_custom2` int(10) unsigned NOT NULL,
    `af_custom3` int(10) unsigned NOT NULL,
    `custom1` text NOT NULL,
    `custom2` text NOT NULL,
    `custom3` text NOT NULL,
    `random1` int(10) unsigned NOT NULL,
    `has_errors` BIT(8) NOT NULL DEFAULT 0,
    PRIMARY KEY (`video_id`),
    KEY `status_id` (`status_id`,`relative_post_date`,`post_date`),
    KEY `is_private` (`is_private`),
    KEY `user_id` (`user_id`),
    KEY `post_date` (`post_date`,`video_id`),
    KEY `last_time_view_date` (`last_time_view_date`),
    KEY `duration` (`duration`),
    KEY `rating` (`rating`,`rating_amount`),
    KEY `video_viewed` (`video_viewed`),
    KEY `release_year` (`release_year`),
    KEY `dir` (`dir`),
    KEY `content_source_id` (`content_source_id`),
    KEY `dvd_id` (`dvd_id`),
    KEY `feed_id` (`feed_id`),
    KEY `external_key` (`external_key`),
    KEY `gallery_url` (`gallery_url`),
    KEY `file_key` (`file_key`),
    KEY `random1` (`random1`),
    KEY `rs_completed` (`rs_completed`),
    KEY `comments_count` (`comments_count`),
    KEY `favourites_count` (`favourites_count`),
    KEY `r_ctr` (`r_ctr`),
    KEY `is_hd` (`is_hd`),
    FULLTEXT KEY `title` (`title`,`description`),
    FULLTEXT KEY `title_related` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_videos_feeds_export` (
    `feed_id` int(10) unsigned NOT NULL auto_increment,
    `title` varchar(255) NOT NULL,
    `status_id` tinyint(1) unsigned NOT NULL,
    `external_id` varchar(100) NOT NULL,
    `password` varchar(100) NOT NULL,
    `affiliate_param_name` varchar(100) NOT NULL,
    `max_limit` int(10) unsigned NOT NULL,
    `cache` int(10) unsigned NOT NULL,
    `last_exec_date` datetime NOT NULL,
    `last_exec_duration` float NOT NULL,
    `options` text NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`feed_id`),
    UNIQUE KEY `external_id` (`external_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_videos_feeds_import` (
    `feed_id` int(10) unsigned NOT NULL auto_increment,
    `title` varchar(255) NOT NULL,
    `status_id` tinyint(1) unsigned NOT NULL,
    `url` text NOT NULL,
    `feed_type_id` varchar(50) NOT NULL,
    `direction_id` tinyint(1) unsigned NOT NULL,
    `key_prefix` varchar(255) NOT NULL,
    `is_skip_duplicate_titles` tinyint(1) unsigned NOT NULL,
    `is_skip_deleted_videos` tinyint(1) unsigned NOT NULL,
    `feed_charset` varchar(50) NOT NULL,
    `data_configuration` text NOT NULL,
    `limit_duration_from` int(10) unsigned NOT NULL,
    `limit_duration_to` int(10) unsigned NOT NULL,
    `limit_rating_from` int(10) unsigned NOT NULL,
    `limit_rating_to` int(10) unsigned NOT NULL,
    `limit_views_from` int(10) unsigned NOT NULL,
    `limit_views_to` int(10) unsigned NOT NULL,
    `limit_terminology` text NOT NULL,
    `videos_status_id` tinyint(1) unsigned NOT NULL,
    `videos_is_private` tinyint(1) unsigned NOT NULL,
    `videos_is_review_needed` tinyint(1) unsigned NOT NULL,
    `videos_content_source_id` int(10) unsigned NOT NULL,
    `videos_dvd_id` int(10) unsigned NOT NULL,
    `videos_admin_flag_id` int(10) unsigned NOT NULL,
    `videos_adding_mode_id` tinyint(1) unsigned NOT NULL,
    `screenshots_mode_id` tinyint(1) unsigned NOT NULL,
    `post_date_mode_id` tinyint(1) unsigned NOT NULL,
    `format_video_id` int(10) unsigned NOT NULL,
    `start_date_interval` datetime NOT NULL,
    `end_date_interval` datetime NOT NULL,
    `end_date_offset` int(10) unsigned NOT NULL,
    `max_videos_per_day` int(10) unsigned NOT NULL,
    `max_videos_per_exec` int(10) unsigned NOT NULL,
    `title_limit` int(10) NOT NULL,
    `title_limit_type_id` tinyint(1) NOT NULL,
    `exec_interval_hours` int(10) unsigned NOT NULL,
    `exec_interval_minutes` int(10) unsigned NOT NULL,
    `options` text NOT NULL,
    `last_exec_date` datetime NOT NULL,
    `last_exec_duration` int(10) unsigned NOT NULL,
    `last_exec_videos_added` int(10) unsigned NOT NULL,
    `last_exec_videos_skipped` int(10) unsigned NOT NULL,
    `last_exec_videos_errored` int(10) unsigned NOT NULL,
    `is_autodelete` tinyint(1) unsigned NOT NULL,
    `autodelete_mode` tinyint(1) unsigned NOT NULL,
    `autodelete_reason` text NOT NULL,
    `autodelete_url` text NOT NULL,
    `autodelete_exec_interval` int(10) NOT NULL,
    `autodelete_last_exec_date` datetime NOT NULL,
    `autodelete_last_exec_duration` int(10) NOT NULL,
    `autodelete_last_exec_videos` int(10) NOT NULL,
    `added_date` datetime NOT NULL,
    `is_debug_enabled` tinyint(1) unsigned NOT NULL,
    `keep_log_days` int(10) unsigned NOT NULL,
    PRIMARY KEY (`feed_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_videos_feeds_import_history` (
    `video_key` varchar(32) NOT NULL,
    `feed_id` int(10) unsigned not null,
    `added_date` datetime not null,
    PRIMARY KEY (`video_key`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_videos_advanced_operations` (
    `video_id` INT(10) UNSIGNED NOT NULL,
    `operation_type_id` TINYINT(2) UNSIGNED NOT NULL,
    `operation_status_id` TINYINT(2) UNSIGNED NOT NULL,
    `operation_task_id` VARCHAR(100) NOT NULL DEFAULT '',
    `operation_data` TEXT NOT NULL,
    `added_date` DATETIME NOT NULL,
    `finished_date` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
    KEY `video_id` (`video_id`),
    PRIMARY KEY (`video_id`, `operation_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `ktvs_videos_visits` (
    `ip` bigint(20) unsigned NOT NULL,
    `video_id` int(10) unsigned NOT NULL,
    `flag` tinyint(1) unsigned NOT NULL,
    `added_date` datetime NOT NULL,
    PRIMARY KEY (`ip`,`video_id`,`flag`),
    KEY `ip` (`ip`),
    KEY `added_date` (`added_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=FIXED;

/* ========================================================================== */
/* Permissions                                                                */
/* ========================================================================== */

insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('start|view',                       '1', '100');

insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|view',                      '1', '200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|add',                       '2', '200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|edit_all',                  '3', '200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|edit_title',                '4', '200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|edit_dir',                  '5', '200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|edit_description',          '6', '200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|edit_post_date',            '7', '200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|edit_user',                 '8', '200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|edit_status',               '9', '200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|edit_type',                 '10','200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|edit_access_level',         '11','200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|edit_tokens',               '12','200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|edit_release_year',         '13','200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|edit_embed',                '14','200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|edit_url',                  '15','200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|edit_pseudo_url',           '16','200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|edit_duration',             '17','200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|edit_dvd',                  '18','200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|edit_content_source',       '19','200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|edit_categories',           '20','200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|edit_tags',                 '21','200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|edit_models',               '22','200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|edit_flags',                '23','200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|edit_custom',               '24','200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|edit_admin_flag',           '25','200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|edit_is_locked',            '26','200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|edit_storage',              '27','200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|edit_connected_data',       '28','200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|edit_video_files',          '29','200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|manage_screenshots',        '40','200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|import',                    '50','200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|export',                    '60','200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|delete',                    '70','200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('videos|feeds_import',              '80','200');

insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('categories|view',                  '1', '600');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('categories|add',                   '2', '600');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('categories|edit_all',              '3', '600');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('categories|delete',                '4', '600');

insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('category_groups|view',             '1', '700');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('category_groups|add',              '2', '700');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('category_groups|edit_all',         '3', '700');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('category_groups|delete',           '4', '700');

insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('tags|view',                        '1', '900');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('tags|add',                         '2', '900');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('tags|edit_all',                    '3', '900');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('tags|delete',                      '4', '900');

insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('content_sources|view',             '1', '1000');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('content_sources|add',              '2', '1000');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('content_sources|edit_all',         '3', '1000');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('content_sources|delete',           '4', '1000');

insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('content_sources_groups|view',      '1', '1050');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('content_sources_groups|add',       '2', '1050');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('content_sources_groups|edit_all',  '3', '1050');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('content_sources_groups|delete',    '4', '1050');

insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('flags|view',                       '1', '1100');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('flags|add',                        '2', '1100');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('flags|edit_all',                   '3', '1100');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('flags|delete',                     '4', '1100');

insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('users|view',                       '1', '1400');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('users|edit_all',                   '3', '1400');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('users|delete',                     '4', '1400');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('users|manage_comments',            '5', '1400');

insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('feedbacks|view',                   '1', '1700');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('feedbacks|edit_all',               '2', '1700');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('feedbacks|delete',                 '3', '1700');

insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('website_ui|view',                  '1', '1800');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('website_ui|add',                   '2', '1800');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('website_ui|edit_all',              '3', '1800');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('website_ui|delete',                '4', '1800');

insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('advertising|view',                 '1', '1900');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('advertising|add',                  '2', '1900');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('advertising|edit_all',             '3', '1900');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('advertising|delete',               '4', '1900');

insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('stats|view_traffic_stats',         '1', '2000');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('stats|view_content_stats',         '3', '2000');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('stats|manage_referers',            '5', '2000');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('stats|manage_search_queries',      '6', '2000');

insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('plugins|view',                     '1', '2100');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('plugins|audit',                    '2', '2100');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('plugins|avatars_generation',       '4', '2100');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('plugins|kvs_news',                 '5', '2100');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('plugins|external_search',          '6', '2100');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('plugins|template_cache_cleanup',   '7', '2100');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('plugins|rotator_clicks_matrix',    '8', '2100');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('plugins|rotator_reset',            '9', '2100');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('plugins|backup',                   '10','2100');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('plugins|movie_from_image',         '11','2100');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('plugins|database_repair',          '12','2100');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('plugins|categories_autogeneration','13','2100');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('plugins|tags_autogeneration',      '14','2100');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('plugins|autoreplace_words',        '15','2100');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('plugins|kvs_update',               '16','2100');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('plugins|upload_folder',            '17','2100');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('plugins|audit_log_analyzer',       '18','2100');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('plugins|models_autogeneration',    '19','2100');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('plugins|content_stats',            '20','2100');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('plugins|migrator',                 '21','2100');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('plugins|grabbers',                 '22','2100');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('plugins|custom_post_processing',   '24','2100');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('plugins|recaptcha',                '25','2100');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('plugins|push_notifications',       '26','2100');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('plugins|neuroscore',               '28','2100');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('plugins|digiregs',                 '29','2100');

insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('system|system_settings',           '1', '2200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('system|website_settings',          '2', '2200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('system|antispam_settings',         '4', '2200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('system|customization',             '5', '2200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('system|formats',                   '6', '2200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('system|administration',            '7', '2200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('system|servers',                   '8', '2200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('system|background_tasks',          '9', '2200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('system|stats_settings',            '10','2200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('system|player_settings',           '11','2200');
insert into `ktvs_admin_permissions`(`title`,`sort_id`,`group_sort_id`) values ('system|vast_profiles',             '12','2200');

/* ========================================================================== */
/* Administrator                                                              */
/* ========================================================================== */

insert into `ktvs_admin_users`(`group_id`,`is_ip_protection_disabled`,`is_expert_mode`,`is_popups_enabled`,`is_superadmin`,`login`,`pass`,`lang`,`skin`,`short_date_format`,`full_date_format`,`description`,`preference`,`added_date`) values ('0','0','0','0','1','admin',md5(concat('pass:',md5('123'))),'english','default','%d %b, %y','%d %b, %y %H:%M','','',NOW());
insert into `ktvs_admin_users`(`group_id`,`is_ip_protection_disabled`,`is_expert_mode`,`is_popups_enabled`,`is_superadmin`,`login`,`pass`,`lang`,`skin`,`short_date_format`,`full_date_format`,`description`,`preference`,`added_date`) values ('0','0','0','0','2','kvs_support',md5(concat('pass:',md5('2547497eb66be3284294391ad41a812b'))),'english','default','%d %b, %y','%d %b, %y %H:%M','','',NOW());

/* ========================================================================== */
/* System settings                                                            */
/* ========================================================================== */

insert into `ktvs_options`(`variable`,`value`) values ('FILE_UPLOAD_DISK_OPTION','members');
insert into `ktvs_options`(`variable`,`value`) values ('FILE_UPLOAD_URL_OPTION','members');
insert into `ktvs_options`(`variable`,`value`) values ('FILE_UPLOAD_SIZE_LIMIT','0');
insert into `ktvs_options`(`variable`,`value`) values ('FILE_DOWNLOAD_SPEED_LIMIT','0');

insert into `ktvs_options`(`variable`,`value`) values ('CATEGORY_AVATAR_SIZE','135x180');
insert into `ktvs_options`(`variable`,`value`) values ('CATEGORY_AVATAR_TYPE','need_size');
insert into `ktvs_options`(`variable`,`value`) values ('CATEGORY_AVATAR_2_SIZE','');
insert into `ktvs_options`(`variable`,`value`) values ('CATEGORY_AVATAR_2_TYPE','need_size');
insert into `ktvs_options`(`variable`,`value`) values ('CATEGORY_AVATAR_OPTION','');
insert into `ktvs_options`(`variable`,`value`) values ('USER_AVATAR_SIZE','150x120');
insert into `ktvs_options`(`variable`,`value`) values ('USER_AVATAR_TYPE','need_size');
insert into `ktvs_options`(`variable`,`value`) values ('USER_COVER_SIZE','');
insert into `ktvs_options`(`variable`,`value`) values ('USER_COVER_TYPE','need_size');
insert into `ktvs_options`(`variable`,`value`) values ('USER_COVER_OPTION','0');
insert into `ktvs_options`(`variable`,`value`) values ('MODELS_SCREENSHOT_1_SIZE','180x240');
insert into `ktvs_options`(`variable`,`value`) values ('MODELS_SCREENSHOT_1_TYPE','need_size');
insert into `ktvs_options`(`variable`,`value`) values ('MODELS_SCREENSHOT_2_SIZE','');
insert into `ktvs_options`(`variable`,`value`) values ('MODELS_SCREENSHOT_2_TYPE','need_size');
insert into `ktvs_options`(`variable`,`value`) values ('MODELS_SCREENSHOT_OPTION','0');
insert into `ktvs_options`(`variable`,`value`) values ('CS_SCREENSHOT_1_SIZE','180x240');
insert into `ktvs_options`(`variable`,`value`) values ('CS_SCREENSHOT_1_TYPE','need_size');
insert into `ktvs_options`(`variable`,`value`) values ('CS_SCREENSHOT_2_SIZE','');
insert into `ktvs_options`(`variable`,`value`) values ('CS_SCREENSHOT_2_TYPE','need_size');
insert into `ktvs_options`(`variable`,`value`) values ('CS_SCREENSHOT_OPTION','0');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_COVER_1_SIZE','200x290');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_COVER_1_TYPE','need_size');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_COVER_2_SIZE','');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_COVER_2_TYPE','need_size');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_COVER_OPTION','0');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_GROUP_COVER_1_SIZE','200x290');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_GROUP_COVER_1_TYPE','need_size');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_GROUP_COVER_2_SIZE','');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_GROUP_COVER_2_TYPE','need_size');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_GROUP_COVER_OPTION','0');

insert into `ktvs_options`(`variable`,`value`) values ('TAGS_DISABLE_ALL','0');
insert into `ktvs_options`(`variable`,`value`) values ('TAGS_DISABLE_COMPOUND','0');
insert into `ktvs_options`(`variable`,`value`) values ('TAGS_DISABLE_LENGTH_MIN','0');
insert into `ktvs_options`(`variable`,`value`) values ('TAGS_DISABLE_LENGTH_MAX','0');
insert into `ktvs_options`(`variable`,`value`) values ('TAGS_DISABLE_CHARACTERS','');
insert into `ktvs_options`(`variable`,`value`) values ('TAGS_DISABLE_LIST_ENABLED','0');
insert into `ktvs_options`(`variable`,`value`) values ('TAGS_DISABLE_LIST','');
insert into `ktvs_options`(`variable`,`value`) values ('TAGS_FORCE_LOWERCASE','1');
insert into `ktvs_options`(`variable`,`value`) values ('TAGS_FORCE_DISABLED','0');
insert into `ktvs_options`(`variable`,`value`) values ('TAGS_ADD_SYNONYMS_ON_RENAME','1');

insert into `ktvs_options`(`variable`,`value`) values ('MODELS_RANK_BY','avg_videos_rating');
insert into `ktvs_options`(`variable`,`value`) values ('CS_RANK_BY','avg_videos_rating');

insert into `ktvs_options`(`variable`,`value`) values ('DIRECTORIES_MAX_LENGTH','255');
insert into `ktvs_options`(`variable`,`value`) values ('DIRECTORIES_TRANSLIT','1');
insert into `ktvs_options`(`variable`,`value`) values ('DIRECTORIES_TRANSLIT_RULES','');

insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_BACKGROUND_TASKS_PAUSE','0');
insert into `ktvs_options`(`variable`,`value`) values ('LIMIT_CONVERSION_LA','');
insert into `ktvs_options`(`variable`,`value`) values ('LIMIT_CONVERSION_TIME_FROM','');
insert into `ktvs_options`(`variable`,`value`) values ('LIMIT_CONVERSION_TIME_TO','');
insert into `ktvs_options`(`variable`,`value`) values ('GLOBAL_CONVERTATION_PRIORITY','0');
insert into `ktvs_options`(`variable`,`value`) values ('USER_TASKS_VIDEOS_PRIORITY_STANDARD','10');
insert into `ktvs_options`(`variable`,`value`) values ('USER_TASKS_VIDEOS_PRIORITY_TRUSTED','10');
insert into `ktvs_options`(`variable`,`value`) values ('USER_TASKS_VIDEOS_PRIORITY_WEBMASTER','10');
insert into `ktvs_options`(`variable`,`value`) values ('USER_TASKS_VIDEOS_PRIORITY_PREMIUM','10');
insert into `ktvs_options`(`variable`,`value`) values ('USER_TASKS_ALBUMS_PRIORITY_STANDARD','10');
insert into `ktvs_options`(`variable`,`value`) values ('USER_TASKS_ALBUMS_PRIORITY_TRUSTED','10');
insert into `ktvs_options`(`variable`,`value`) values ('USER_TASKS_ALBUMS_PRIORITY_WEBMASTER','10');
insert into `ktvs_options`(`variable`,`value`) values ('USER_TASKS_ALBUMS_PRIORITY_PREMIUM','10');
insert into `ktvs_options`(`variable`,`value`) values ('FAILED_TASKS_AUTO_RESTART','0');
insert into `ktvs_options`(`variable`,`value`) values ('MAIN_SERVER_MIN_FREE_SPACE_MB','10000');
insert into `ktvs_options`(`variable`,`value`) values ('SERVER_GROUP_MIN_FREE_SPACE_MB','10000');
insert into `ktvs_options`(`variable`,`value`) values ('LIMIT_MEMORY','1024');

insert into `ktvs_options`(`variable`,`value`) values ('VIDEOS_HALF_PROCESSING','0');
insert into `ktvs_options`(`variable`,`value`) values ('VIDEO_INITIAL_RATING','0');
insert into `ktvs_options`(`variable`,`value`) values ('DEFAULT_SERVER_GROUP_IN_ADMIN_ADD_VIDEO','auto');
insert into `ktvs_options`(`variable`,`value`) values ('VIDEOS_DUPLICATE_TITLE_OPTION','0');
insert into `ktvs_options`(`variable`,`value`) values ('VIDEOS_DUPLICATE_TITLE_POSTFIX','');
insert into `ktvs_options`(`variable`,`value`) values ('VIDEOS_DUPLICATE_FILE_OPTION','1');
insert into `ktvs_options`(`variable`,`value`) values ('KEEP_VIDEO_SOURCE_FILES','0');
insert into `ktvs_options`(`variable`,`value`) values ('TAKE_VIDEO_DURATION_FROM_FORMAT_STD','');
insert into `ktvs_options`(`variable`,`value`) values ('TAKE_VIDEO_DURATION_FROM_FORMAT_PREMIUM','');
insert into `ktvs_options`(`variable`,`value`) values ('SCREENSHOTS_COUNT','5');
insert into `ktvs_options`(`variable`,`value`) values ('SCREENSHOTS_COUNT_UNIT','1');
insert into `ktvs_options`(`variable`,`value`) values ('SCREENSHOTS_CROP_LEFT','0');
insert into `ktvs_options`(`variable`,`value`) values ('SCREENSHOTS_CROP_LEFT_UNIT','1');
insert into `ktvs_options`(`variable`,`value`) values ('SCREENSHOTS_CROP_TOP','0');
insert into `ktvs_options`(`variable`,`value`) values ('SCREENSHOTS_CROP_TOP_UNIT','1');
insert into `ktvs_options`(`variable`,`value`) values ('SCREENSHOTS_CROP_RIGHT','0');
insert into `ktvs_options`(`variable`,`value`) values ('SCREENSHOTS_CROP_RIGHT_UNIT','1');
insert into `ktvs_options`(`variable`,`value`) values ('SCREENSHOTS_CROP_BOTTOM','0');
insert into `ktvs_options`(`variable`,`value`) values ('SCREENSHOTS_CROP_BOTTOM_UNIT','1');
insert into `ktvs_options`(`variable`,`value`) values ('SCREENSHOTS_CROP_TRIM_SIDES','1');
insert into `ktvs_options`(`variable`,`value`) values ('SCREENSHOTS_CROP_CUSTOMIZE','0');
insert into `ktvs_options`(`variable`,`value`) values ('SCREENSHOTS_UPLOADED_CROP','0');
insert into `ktvs_options`(`variable`,`value`) values ('SCREENSHOTS_UPLOADED_WATERMARK','0');
insert into `ktvs_options`(`variable`,`value`) values ('SCREENSHOTS_SECONDS_OFFSET','1');
insert into `ktvs_options`(`variable`,`value`) values ('SCREENSHOTS_SECONDS_OFFSET_END','1');
insert into `ktvs_options`(`variable`,`value`) values ('SCREENSHOTS_MAIN_NUMBER','1');

insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_ANTI_HOTLINK','1');
insert into `ktvs_options`(`variable`,`value`) values ('ANTI_HOTLINK_ENABLE_IP_LIMIT','0');
insert into `ktvs_options`(`variable`,`value`) values ('ANTI_HOTLINK_TYPE','1');
insert into `ktvs_options`(`variable`,`value`) values ('ANTI_HOTLINK_WHITE_DOMAINS','');
insert into `ktvs_options`(`variable`,`value`) values ('ANTI_HOTLINK_ENCODE_LINKS','1');
insert into `ktvs_options`(`variable`,`value`) values ('ANTI_HOTLINK_N_VIDEOS','100');
insert into `ktvs_options`(`variable`,`value`) values ('ANTI_HOTLINK_N_HOURS','10');
insert into `ktvs_options`(`variable`,`value`) values ('ANTI_HOTLINK_FILE','');
insert into `ktvs_options`(`variable`,`value`) values ('ANTI_HOTLINK_OWN_IP','');
insert into `ktvs_options`(`variable`,`value`) values ('ANTI_HOTLINK_WHITE_IPS','');

insert into `ktvs_options`(`variable`,`value`) values ('ROTATOR_VIDEOS_ENABLE','0');
insert into `ktvs_options`(`variable`,`value`) values ('ROTATOR_VIDEOS_CATEGORIES_ENABLE','0');
insert into `ktvs_options`(`variable`,`value`) values ('ROTATOR_VIDEOS_TAGS_ENABLE','0');
insert into `ktvs_options`(`variable`,`value`) values ('ROTATOR_SCREENSHOTS_ENABLE','0');
insert into `ktvs_options`(`variable`,`value`) values ('ROTATOR_SCREENSHOTS_ONLY_ONE_ENABLE','0');
insert into `ktvs_options`(`variable`,`value`) values ('ROTATOR_SCREENSHOTS_MIN_SHOWS','10000');
insert into `ktvs_options`(`variable`,`value`) values ('ROTATOR_SCREENSHOTS_MIN_CLICKS','50');
insert into `ktvs_options`(`variable`,`value`) values ('ROTATOR_SCREENSHOTS_SCREENSHOTS_LEFT','0');
insert into `ktvs_options`(`variable`,`value`) values ('ROTATOR_SCHEDULE_INTERVAL','15');
insert into `ktvs_options`(`variable`,`value`) values ('ROTATOR_SCHEDULE_PAUSE_FROM','');
insert into `ktvs_options`(`variable`,`value`) values ('ROTATOR_SCHEDULE_PAUSE_TO','');

insert into `ktvs_options`(`variable`,`value`) values ('ALBUM_INITIAL_RATING','0');
insert into `ktvs_options`(`variable`,`value`) values ('DEFAULT_SERVER_GROUP_IN_ADMIN_ADD_ALBUM','auto');
insert into `ktvs_options`(`variable`,`value`) values ('ALBUMS_DUPLICATE_TITLE_OPTION','0');
insert into `ktvs_options`(`variable`,`value`) values ('ALBUMS_DUPLICATE_TITLE_POSTFIX','');
insert into `ktvs_options`(`variable`,`value`) values ('ALBUMS_CROP_LEFT','0');
insert into `ktvs_options`(`variable`,`value`) values ('ALBUMS_CROP_LEFT_UNIT','1');
insert into `ktvs_options`(`variable`,`value`) values ('ALBUMS_CROP_TOP','0');
insert into `ktvs_options`(`variable`,`value`) values ('ALBUMS_CROP_TOP_UNIT','1');
insert into `ktvs_options`(`variable`,`value`) values ('ALBUMS_CROP_RIGHT','0');
insert into `ktvs_options`(`variable`,`value`) values ('ALBUMS_CROP_RIGHT_UNIT','1');
insert into `ktvs_options`(`variable`,`value`) values ('ALBUMS_CROP_BOTTOM','0');
insert into `ktvs_options`(`variable`,`value`) values ('ALBUMS_CROP_BOTTOM_UNIT','1');
insert into `ktvs_options`(`variable`,`value`) values ('ALBUMS_CROP_CUSTOMIZE','0');
insert into `ktvs_options`(`variable`,`value`) values ('ALBUMS_SOURCE_FILES_CREATE_ZIP','0');
insert into `ktvs_options`(`variable`,`value`) values ('ALBUMS_SOURCE_FILES_ACCESS_LEVEL','0');

insert into `ktvs_options`(`variable`,`value`) values ('DEFAULT_USER_IN_ADMIN_ADD_VIDEO','Admin');
insert into `ktvs_options`(`variable`,`value`) values ('DEFAULT_STATUS_IN_ADMIN_ADD_VIDEO','1');
insert into `ktvs_options`(`variable`,`value`) values ('USE_POST_DATE_RANDOMIZATION','2');
insert into `ktvs_options`(`variable`,`value`) values ('VIDEO_REGENERATE_DIRECTORIES','0');
insert into `ktvs_options`(`variable`,`value`) values ('VIDEO_CHECK_DUPLICATE_TITLES','1');
insert into `ktvs_options`(`variable`,`value`) values ('VIDEO_VALIDATE_SCREENSHOT_SIZES','1');

insert into `ktvs_options`(`variable`,`value`) values ('DEFAULT_USER_IN_ADMIN_ADD_ALBUM','Admin');
insert into `ktvs_options`(`variable`,`value`) values ('DEFAULT_STATUS_IN_ADMIN_ADD_ALBUM','1');
insert into `ktvs_options`(`variable`,`value`) values ('USE_POST_DATE_RANDOMIZATION_ALBUM','2');
insert into `ktvs_options`(`variable`,`value`) values ('ALBUM_REGENERATE_DIRECTORIES','0');
insert into `ktvs_options`(`variable`,`value`) values ('ALBUM_CHECK_DUPLICATE_TITLES','1');
insert into `ktvs_options`(`variable`,`value`) values ('ALBUM_VALIDATE_IMAGE_SIZES','1');

insert into `ktvs_options`(`variable`,`value`) values ('POST_INITIAL_RATING','0');
insert into `ktvs_options`(`variable`,`value`) values ('DEFAULT_USER_IN_ADMIN_ADD_POST','Admin');
insert into `ktvs_options`(`variable`,`value`) values ('DEFAULT_STATUS_IN_ADMIN_ADD_POST','1');
insert into `ktvs_options`(`variable`,`value`) values ('USE_POST_DATE_RANDOMIZATION_POST','2');
insert into `ktvs_options`(`variable`,`value`) values ('POST_REGENERATE_DIRECTORIES','0');
insert into `ktvs_options`(`variable`,`value`) values ('POST_CHECK_DUPLICATE_TITLES','1');

insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_KVS_SUPPORT_ACCESS','1');

insert into `ktvs_options`(`variable`,`value`) values ('STATUS_AFTER_PREMIUM','0');
insert into `ktvs_options`(`variable`,`value`) values ('PUBLIC_VIDEOS_ACCESS','0');
insert into `ktvs_options`(`variable`,`value`) values ('PRIVATE_VIDEOS_ACCESS','1');
insert into `ktvs_options`(`variable`,`value`) values ('PREMIUM_VIDEOS_ACCESS','0');
insert into `ktvs_options`(`variable`,`value`) values ('PUBLIC_ALBUMS_ACCESS','0');
insert into `ktvs_options`(`variable`,`value`) values ('PRIVATE_ALBUMS_ACCESS','1');
insert into `ktvs_options`(`variable`,`value`) values ('PREMIUM_ALBUMS_ACCESS','0');
insert into `ktvs_options`(`variable`,`value`) values ('AFFILIATE_PARAM_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_TOKENS_STANDARD_VIDEO','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_TOKENS_PREMIUM_VIDEO','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_TOKENS_STANDARD_ALBUM','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_TOKENS_PREMIUM_ALBUM','0');
insert into `ktvs_options`(`variable`,`value`) values ('DEFAULT_TOKENS_STANDARD_VIDEO','0');
insert into `ktvs_options`(`variable`,`value`) values ('DEFAULT_TOKENS_PREMIUM_VIDEO','0');
insert into `ktvs_options`(`variable`,`value`) values ('DEFAULT_TOKENS_STANDARD_ALBUM','0');
insert into `ktvs_options`(`variable`,`value`) values ('DEFAULT_TOKENS_PREMIUM_ALBUM','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_TOKENS_SALE_VIDEOS','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_TOKENS_SALE_ALBUMS','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_TOKENS_SALE_MEMBERS','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_TOKENS_SALE_DVDS','0');
insert into `ktvs_options`(`variable`,`value`) values ('TOKENS_SALE_INTEREST','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_TOKENS_TRAFFIC_VIDEOS','0');
insert into `ktvs_options`(`variable`,`value`) values ('TOKENS_TRAFFIC_VIDEOS_TOKENS','0');
insert into `ktvs_options`(`variable`,`value`) values ('TOKENS_TRAFFIC_VIDEOS_UNIQUE','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_TOKENS_TRAFFIC_ALBUMS','0');
insert into `ktvs_options`(`variable`,`value`) values ('TOKENS_TRAFFIC_ALBUMS_TOKENS','0');
insert into `ktvs_options`(`variable`,`value`) values ('TOKENS_TRAFFIC_ALBUMS_UNIQUE','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_TOKENS_TRAFFIC_EMBEDS','0');
insert into `ktvs_options`(`variable`,`value`) values ('TOKENS_TRAFFIC_EMBEDS_TOKENS','0');
insert into `ktvs_options`(`variable`,`value`) values ('TOKENS_TRAFFIC_EMBEDS_UNIQUE','0');
insert into `ktvs_options`(`variable`,`value`) values ('TOKENS_SALE_EXCLUDES','');
insert into `ktvs_options`(`variable`,`value`) values ('TOKENS_PURCHASE_EXPIRY','');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_TOKENS_SUBSCRIBE_MEMBERS','0');
insert into `ktvs_options`(`variable`,`value`) values ('TOKENS_SUBSCRIBE_MEMBERS_DEFAULT_PRICE','0');
insert into `ktvs_options`(`variable`,`value`) values ('TOKENS_SUBSCRIBE_MEMBERS_DEFAULT_PERIOD','');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_TOKENS_SUBSCRIBE_DVDS','0');
insert into `ktvs_options`(`variable`,`value`) values ('TOKENS_SUBSCRIBE_DVDS_DEFAULT_PRICE','0');
insert into `ktvs_options`(`variable`,`value`) values ('TOKENS_SUBSCRIBE_DVDS_DEFAULT_PERIOD','');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_TOKENS_INTERNAL_MESSAGES','0');
insert into `ktvs_options`(`variable`,`value`) values ('TOKENS_INTERNAL_MESSAGES','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_TOKENS_DONATIONS','0');
insert into `ktvs_options`(`variable`,`value`) values ('TOKENS_DONATION_MIN','0');
insert into `ktvs_options`(`variable`,`value`) values ('TOKENS_DONATION_INTEREST','0');
insert into `ktvs_options`(`variable`,`value`) values ('ACTIVITY_INDEX_FORMULA','%total_videos%*20 + %total_albums%*20 + %total_comments%*10 + %logins%');
insert into `ktvs_options`(`variable`,`value`) values ('ACTIVITY_INDEX_INCLUDES','');
insert into `ktvs_options`(`variable`,`value`) values ('AWARDS_SIGNUP','');
insert into `ktvs_options`(`variable`,`value`) values ('AWARDS_AVATAR','');
insert into `ktvs_options`(`variable`,`value`) values ('AWARDS_COVER','');
insert into `ktvs_options`(`variable`,`value`) values ('AWARDS_LOGIN_CONDITION','');
insert into `ktvs_options`(`variable`,`value`) values ('AWARDS_LOGIN','');
insert into `ktvs_options`(`variable`,`value`) values ('AWARDS_COMMENT_VIDEO_CONDITION','');
insert into `ktvs_options`(`variable`,`value`) values ('AWARDS_COMMENT_VIDEO','');
insert into `ktvs_options`(`variable`,`value`) values ('AWARDS_COMMENT_ALBUM_CONDITION','');
insert into `ktvs_options`(`variable`,`value`) values ('AWARDS_COMMENT_ALBUM','');
insert into `ktvs_options`(`variable`,`value`) values ('AWARDS_COMMENT_CS_CONDITION','');
insert into `ktvs_options`(`variable`,`value`) values ('AWARDS_COMMENT_CS','');
insert into `ktvs_options`(`variable`,`value`) values ('AWARDS_COMMENT_MODEL_CONDITION','');
insert into `ktvs_options`(`variable`,`value`) values ('AWARDS_COMMENT_MODEL','');
insert into `ktvs_options`(`variable`,`value`) values ('AWARDS_COMMENT_DVD_CONDITION','');
insert into `ktvs_options`(`variable`,`value`) values ('AWARDS_COMMENT_DVD','');
insert into `ktvs_options`(`variable`,`value`) values ('AWARDS_COMMENT_POST_CONDITION','');
insert into `ktvs_options`(`variable`,`value`) values ('AWARDS_COMMENT_POST','');
insert into `ktvs_options`(`variable`,`value`) values ('AWARDS_COMMENT_PLAYLIST_CONDITION','');
insert into `ktvs_options`(`variable`,`value`) values ('AWARDS_COMMENT_PLAYLIST','');
insert into `ktvs_options`(`variable`,`value`) values ('AWARDS_VIDEO_UPLOAD_CONDITION','');
insert into `ktvs_options`(`variable`,`value`) values ('AWARDS_VIDEO_UPLOAD','');
insert into `ktvs_options`(`variable`,`value`) values ('AWARDS_ALBUM_UPLOAD_CONDITION','');
insert into `ktvs_options`(`variable`,`value`) values ('AWARDS_ALBUM_UPLOAD','');
insert into `ktvs_options`(`variable`,`value`) values ('AWARDS_POST_UPLOAD_CONDITION','');
insert into `ktvs_options`(`variable`,`value`) values ('AWARDS_POST_UPLOAD','');
insert into `ktvs_options`(`variable`,`value`) values ('AWARDS_REFERRAL_SIGNUP_CONDITION','');
insert into `ktvs_options`(`variable`,`value`) values ('AWARDS_REFERRAL_SIGNUP','');

INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_BLACKLIST_WORDS','');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_BLACKLIST_ACTION','0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_VIDEOS_ANALYZE_HISTORY','0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_VIDEOS_FORCE_CAPTCHA','0/0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_VIDEOS_FORCE_DISABLED','0/0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_VIDEOS_AUTODELETE','0/0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_VIDEOS_ERROR','0/0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_ALBUMS_ANALYZE_HISTORY','0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_ALBUMS_FORCE_CAPTCHA','0/0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_ALBUMS_FORCE_DISABLED','0/0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_ALBUMS_AUTODELETE','0/0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_ALBUMS_ERROR','0/0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_POSTS_ANALYZE_HISTORY','0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_POSTS_FORCE_CAPTCHA','0/0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_POSTS_FORCE_DISABLED','0/0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_POSTS_AUTODELETE','0/0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_POSTS_ERROR','0/0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_PLAYLISTS_ANALYZE_HISTORY','0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_PLAYLISTS_FORCE_CAPTCHA','0/0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_PLAYLISTS_FORCE_DISABLED','0/0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_PLAYLISTS_AUTODELETE','0/0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_PLAYLISTS_ERROR','0/0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_DVDS_ANALYZE_HISTORY','0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_DVDS_FORCE_CAPTCHA','0/0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_DVDS_FORCE_DISABLED','0/0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_DVDS_AUTODELETE','0/0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_DVDS_ERROR','0/0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_COMMENTS_ANALYZE_HISTORY','0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_COMMENTS_FORCE_CAPTCHA','0/0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_COMMENTS_FORCE_DISABLED','0/0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_COMMENTS_AUTODELETE','0/0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_COMMENTS_ERROR','0/0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_COMMENTS_DUPLICATES','0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_MESSAGES_ANALYZE_HISTORY','0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_MESSAGES_AUTODELETE','0/0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_MESSAGES_ERROR','0/0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_MESSAGES_DUPLICATES','0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_FEEDBACKS_ANALYZE_HISTORY','0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_FEEDBACKS_AUTODELETE','0/0');
INSERT INTO `ktvs_options`(`variable`,`value`) VALUES ('ANTISPAM_FEEDBACKS_ERROR','0/0');

insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_VIDEO_FIELD_1','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_VIDEO_FIELD_2','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_VIDEO_FIELD_3','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_VIDEO_FLAG_1','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_VIDEO_FLAG_2','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_VIDEO_FLAG_3','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_ALBUM_FIELD_1','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_ALBUM_FIELD_2','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_ALBUM_FIELD_3','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_ALBUM_FLAG_1','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_ALBUM_FLAG_2','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_ALBUM_FLAG_3','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CATEGORY_FIELD_1','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CATEGORY_FIELD_2','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CATEGORY_FIELD_3','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CATEGORY_FIELD_4','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CATEGORY_FIELD_5','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CATEGORY_FIELD_6','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CATEGORY_FIELD_7','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CATEGORY_FIELD_8','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CATEGORY_FIELD_9','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CATEGORY_FIELD_10','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CATEGORY_FILE_FIELD_1','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CATEGORY_FILE_FIELD_2','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CATEGORY_FILE_FIELD_3','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CATEGORY_FILE_FIELD_4','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CATEGORY_FILE_FIELD_5','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CATEGORY_GROUP_FIELD_1','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CATEGORY_GROUP_FIELD_2','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CATEGORY_GROUP_FIELD_3','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_TAG_FIELD_1','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_TAG_FIELD_2','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_TAG_FIELD_3','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_TAG_FIELD_4','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_TAG_FIELD_5','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CS_FIELD_1','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CS_FIELD_2','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CS_FIELD_3','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CS_FIELD_4','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CS_FIELD_5','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CS_FIELD_6','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CS_FIELD_7','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CS_FIELD_8','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CS_FIELD_9','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CS_FIELD_10','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CS_FILE_FIELD_1','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CS_FILE_FIELD_2','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CS_FILE_FIELD_3','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CS_FILE_FIELD_4','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CS_FILE_FIELD_5','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CS_FILE_FIELD_6','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CS_FILE_FIELD_7','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CS_FILE_FIELD_8','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CS_FILE_FIELD_9','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CS_FILE_FIELD_10','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CS_GROUP_FIELD_1','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CS_GROUP_FIELD_2','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CS_GROUP_FIELD_3','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CS_GROUP_FIELD_4','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_CS_GROUP_FIELD_5','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_USER_FIELD_1','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_USER_FIELD_2','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_USER_FIELD_3','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_USER_FIELD_4','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_USER_FIELD_5','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_USER_FIELD_6','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_USER_FIELD_7','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_USER_FIELD_8','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_USER_FIELD_9','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_USER_FIELD_10','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_MODEL_FIELD_1','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_MODEL_FIELD_2','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_MODEL_FIELD_3','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_MODEL_FIELD_4','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_MODEL_FIELD_5','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_MODEL_FIELD_6','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_MODEL_FIELD_7','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_MODEL_FIELD_8','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_MODEL_FIELD_9','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_MODEL_FIELD_10','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_MODEL_FILE_FIELD_1','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_MODEL_FILE_FIELD_2','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_MODEL_FILE_FIELD_3','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_MODEL_FILE_FIELD_4','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_MODEL_FILE_FIELD_5','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_DVD_FIELD_1','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_DVD_FIELD_2','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_DVD_FIELD_3','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_DVD_FIELD_4','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_DVD_FIELD_5','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_DVD_FIELD_6','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_DVD_FIELD_7','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_DVD_FIELD_8','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_DVD_FIELD_9','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_DVD_FIELD_10','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_DVD_FILE_FIELD_1','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_DVD_FILE_FIELD_2','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_DVD_FILE_FIELD_3','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_DVD_FILE_FIELD_4','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_DVD_FILE_FIELD_5','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_DVD_GROUP_FIELD_1','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_DVD_GROUP_FIELD_2','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_DVD_GROUP_FIELD_3','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_DVD_GROUP_FIELD_4','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_DVD_GROUP_FIELD_5','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_REFERER_FIELD_1','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_REFERER_FIELD_2','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_REFERER_FIELD_3','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_REFERER_FILE_FIELD_1','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_REFERER_FILE_FIELD_2','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_REFERER_FILE_FIELD_3','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_FEEDBACK_FIELD_1','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_FEEDBACK_FIELD_2','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_FEEDBACK_FIELD_3','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_FEEDBACK_FIELD_4','0');
insert into `ktvs_options`(`variable`,`value`) values ('ENABLE_FEEDBACK_FIELD_5','0');

insert into `ktvs_options`(`variable`,`value`) values ('VIDEOS_IMPORT_PRESETS','');
insert into `ktvs_options`(`variable`,`value`) values ('VIDEOS_EXPORT_PRESETS','');
insert into `ktvs_options`(`variable`,`value`) values ('ALBUMS_IMPORT_PRESETS','');
insert into `ktvs_options`(`variable`,`value`) values ('ALBUMS_EXPORT_PRESETS','');

insert into `ktvs_options`(`variable`,`value`) values ('VIDEO_FIELD_1_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('VIDEO_FIELD_2_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('VIDEO_FIELD_3_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('VIDEO_FLAG_1_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('VIDEO_FLAG_2_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('VIDEO_FLAG_3_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('ALBUM_FIELD_1_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('ALBUM_FIELD_2_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('ALBUM_FIELD_3_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('ALBUM_FLAG_1_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('ALBUM_FLAG_2_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('ALBUM_FLAG_3_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CATEGORY_FIELD_1_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CATEGORY_FIELD_2_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CATEGORY_FIELD_3_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CATEGORY_FIELD_4_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CATEGORY_FIELD_5_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CATEGORY_FIELD_6_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CATEGORY_FIELD_7_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CATEGORY_FIELD_8_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CATEGORY_FIELD_9_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CATEGORY_FIELD_10_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CATEGORY_FILE_FIELD_1_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CATEGORY_FILE_FIELD_2_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CATEGORY_FILE_FIELD_3_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CATEGORY_FILE_FIELD_4_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CATEGORY_FILE_FIELD_5_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CATEGORY_GROUP_FIELD_1_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CATEGORY_GROUP_FIELD_2_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CATEGORY_GROUP_FIELD_3_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('TAG_FIELD_1_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('TAG_FIELD_2_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('TAG_FIELD_3_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('TAG_FIELD_4_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('TAG_FIELD_5_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CS_FIELD_1_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CS_FIELD_2_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CS_FIELD_3_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CS_FIELD_4_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CS_FIELD_5_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CS_FIELD_6_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CS_FIELD_7_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CS_FIELD_8_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CS_FIELD_9_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CS_FIELD_10_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CS_FILE_FIELD_1_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CS_FILE_FIELD_2_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CS_FILE_FIELD_3_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CS_FILE_FIELD_4_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CS_FILE_FIELD_5_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CS_FILE_FIELD_6_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CS_FILE_FIELD_7_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CS_FILE_FIELD_8_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CS_FILE_FIELD_9_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CS_FILE_FIELD_10_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CS_GROUP_FIELD_1_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CS_GROUP_FIELD_2_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CS_GROUP_FIELD_3_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CS_GROUP_FIELD_4_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('CS_GROUP_FIELD_5_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('MODEL_FIELD_1_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('MODEL_FIELD_2_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('MODEL_FIELD_3_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('MODEL_FIELD_4_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('MODEL_FIELD_5_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('MODEL_FIELD_6_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('MODEL_FIELD_7_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('MODEL_FIELD_8_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('MODEL_FIELD_9_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('MODEL_FIELD_10_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('MODEL_FILE_FIELD_1_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('MODEL_FILE_FIELD_2_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('MODEL_FILE_FIELD_3_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('MODEL_FILE_FIELD_4_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('MODEL_FILE_FIELD_5_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_FIELD_1_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_FIELD_2_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_FIELD_3_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_FIELD_4_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_FIELD_5_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_FIELD_6_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_FIELD_7_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_FIELD_8_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_FIELD_9_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_FIELD_10_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_FILE_FIELD_1_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_FILE_FIELD_2_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_FILE_FIELD_3_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_FILE_FIELD_4_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_FILE_FIELD_5_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_GROUP_FIELD_1_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_GROUP_FIELD_2_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_GROUP_FIELD_3_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_GROUP_FIELD_4_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('DVD_GROUP_FIELD_5_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('USER_FIELD_1_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('USER_FIELD_2_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('USER_FIELD_3_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('USER_FIELD_4_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('USER_FIELD_5_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('USER_FIELD_6_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('USER_FIELD_7_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('USER_FIELD_8_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('USER_FIELD_9_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('USER_FIELD_10_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('REFERER_FIELD_1_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('REFERER_FIELD_2_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('REFERER_FIELD_3_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('REFERER_FILE_FIELD_1_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('REFERER_FILE_FIELD_2_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('REFERER_FILE_FIELD_3_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('FEEDBACK_FIELD_1_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('FEEDBACK_FIELD_2_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('FEEDBACK_FIELD_3_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('FEEDBACK_FIELD_4_NAME','');
insert into `ktvs_options`(`variable`,`value`) values ('FEEDBACK_FIELD_5_NAME','');

insert into `ktvs_options`(`variable`,`value`) values ('API_ENABLE','0');
insert into `ktvs_options`(`variable`,`value`) values ('API_PASSWORD','');

insert into `ktvs_options`(`variable`,`value`) values ('CRON_TIME','0');
insert into `ktvs_options`(`variable`,`value`) values ('CRON_UID','');

insert into `ktvs_options`(`variable`,`value`) values ('SYSTEM_VERSION','5.5.0');
insert into `ktvs_options`(`variable`,`value`) values ('UPDATE_VERSION','5.5.0');
insert into `ktvs_options`(`variable`,`value`) values ('SYSTEM_CONVERSION_API_VERSION','5.5.0');
insert into `ktvs_options`(`variable`,`value`) values ('SYSTEM_STORAGE_API_VERSION','5.3.0');
insert into `ktvs_options`(`variable`,`value`) values ('SYSTEM_DOMAIN','liarxxx.com');

/* ========================================================================== */
/* Default storage and conversion                                             */
/* ========================================================================== */

insert into `ktvs_admin_conversion_servers`(`server_id`,`title`,`status_id`,`connection_type_id`,`max_tasks`,`option_storage_servers`,`path`,`added_date`) values ('1','Local','2','0','5','1','%PROJECT_PATH%/admin/data/conversion',NOW());

insert into `ktvs_admin_servers_groups`(`group_id`,`title`,`content_type_id`,`status_id`,`added_date`) values ('1','Group Videos','1','1',NOW());
insert into `ktvs_admin_servers`(`server_id`,`group_id`,`title`,`content_type_id`,`status_id`,`connection_type_id`,`streaming_type_id`,`path`,`urls`,`added_date`) values ('1','1','Local Videos','1','1','0','0','%PROJECT_PATH%/contents/videos','https://www.liarxxx.com/contents/videos',NOW());

/* ========================================================================== */
/* Website default users                                                      */
/* ========================================================================== */

insert into `ktvs_users`(`user_id`,`status_id`,`username`,`pass`,`email`,`display_name`,`added_date`) values ('1','2','Admin',    '','email1','Admin',    NOW());
insert into `ktvs_users`(`user_id`,`status_id`,`username`,`pass`,`email`,`display_name`,`added_date`) values ('2','4','Anonymous','','email2','Anonymous',NOW());

/* ========================================================================== */
/* Default referer for bookmarks                                              */
/* ========================================================================== */

insert into `ktvs_stats_referers_list` set title='Bookmarks', referer='<bookmarks>', added_date=NOW();

/* ========================================================================== */
/* Billing providers                                                          */
/* ========================================================================== */

insert into `ktvs_card_bill_providers`(`status_id`,`internal_id`,`title`,`url`,`cf_pkg_trials`,`cf_pkg_rebills`,`cf_pkg_tokens`,`cf_pkg_oneclick`,`cf_pkg_setprice`) values (0, 'segpay', 'SegPay', 'https://www.segpay.com', 1, 1, 1, 1, 0);
insert into `ktvs_card_bill_providers`(`status_id`,`internal_id`,`title`,`url`,`cf_pkg_trials`,`cf_pkg_rebills`,`cf_pkg_tokens`,`cf_pkg_oneclick`,`cf_pkg_setprice`) values (0, 'ccbill', 'CCBill', 'https://www.ccbill.com', 1, 1, 0, 0, 0);
insert into `ktvs_card_bill_providers`(`status_id`,`internal_id`,`title`,`url`,`cf_pkg_trials`,`cf_pkg_rebills`,`cf_pkg_tokens`,`cf_pkg_oneclick`,`cf_pkg_setprice`) values (0, 'ccbilldyn', 'CCBill Dynamic Pricing', 'https://www.ccbill.com', 1, 1, 0, 0, 1);
insert into `ktvs_card_bill_providers`(`status_id`,`internal_id`,`title`,`url`,`cf_pkg_trials`,`cf_pkg_rebills`,`cf_pkg_tokens`,`cf_pkg_oneclick`,`cf_pkg_setprice`) values (0, 'epoch', 'Epoch', 'https://epoch.com', 1, 1, 0, 0, 0);
insert into `ktvs_card_bill_providers`(`status_id`,`internal_id`,`title`,`url`,`cf_pkg_trials`,`cf_pkg_rebills`,`cf_pkg_tokens`,`cf_pkg_oneclick`,`cf_pkg_setprice`) values (0, 'zombaio', 'Zombaio', 'https://www.zombaio.com', 1, 1, 0, 0, 0);
insert into `ktvs_card_bill_providers`(`status_id`,`internal_id`,`title`,`url`,`cf_pkg_trials`,`cf_pkg_rebills`,`cf_pkg_tokens`,`cf_pkg_oneclick`,`cf_pkg_setprice`) values (0, 'nats', 'NATS Transactions', 'http://toomuchmedia.com', 1, 1, 0, 0, 0);
insert into `ktvs_card_bill_providers`(`status_id`,`internal_id`,`title`,`url`,`cf_pkg_trials`,`cf_pkg_rebills`,`cf_pkg_tokens`,`cf_pkg_oneclick`,`cf_pkg_setprice`) values (0, 'natsum', 'NATS User Management', 'http://toomuchmedia.com', 1, 1, 0, 0, 0);
insert into `ktvs_card_bill_providers`(`status_id`,`internal_id`,`title`,`url`,`cf_pkg_trials`,`cf_pkg_rebills`,`cf_pkg_tokens`,`cf_pkg_oneclick`,`cf_pkg_setprice`) values (0, 'mpa3', 'MPA3', 'http://mpa3.com', 1, 1, 0, 0, 0);
insert into `ktvs_card_bill_providers`(`status_id`,`internal_id`,`title`,`url`,`cf_pkg_trials`,`cf_pkg_rebills`,`cf_pkg_tokens`,`cf_pkg_oneclick`,`cf_pkg_setprice`) values (0, 'verotel', 'Verotel', 'https://www.verotel.com', 1, 1, 1, 0, 1);
insert into `ktvs_card_bill_providers`(`status_id`,`internal_id`,`title`,`url`,`cf_pkg_trials`,`cf_pkg_rebills`,`cf_pkg_tokens`,`cf_pkg_oneclick`,`cf_pkg_setprice`) values (0, 'paypal', 'PayPal', 'https://www.paypal.com', 1, 1, 1, 0, 0);
insert into `ktvs_card_bill_providers`(`status_id`,`internal_id`,`title`,`url`,`cf_pkg_trials`,`cf_pkg_rebills`,`cf_pkg_tokens`,`cf_pkg_oneclick`,`cf_pkg_setprice`) values (0, 'robokassa', 'Robokassa', 'https://www.robokassa.ru', 0, 0, 1, 0, 1);
insert into `ktvs_card_bill_providers`(`status_id`,`internal_id`,`title`,`url`,`cf_pkg_trials`,`cf_pkg_rebills`,`cf_pkg_tokens`,`cf_pkg_oneclick`,`cf_pkg_setprice`) values (0, 'tokens', 'Internal Tokens', '', 0, 1, 0, 0, 1);

/* ========================================================================== */
/* Theme                                                                      */
/* ========================================================================== */

insert into `ktvs_formats_videos`(`title`,`postfix`,`status_id`,`is_conditional`,`video_type_id`,`size`,`resize_option`,`resize_option2`,`ffmpeg_options`,`limit_number_parts`,`limit_total_duration`,`added_date`) values ('MP4',        '.mp4',        '1','0','0','',         '2','2','-vcodec libx264 -movflags +faststart -threads 0 -r 25 -g 50 -crf 25 -me_method hex -trellis 0 -bf 8 -acodec aac -strict -2 -ar 44100 -ab 128k -f mp4','1','0', NOW());

update `ktvs_formats_videos` set `is_timeline_enabled`=1, `timeline_option`=2, `timeline_interval`=10, `timeline_directory`='mp4' where postfix='.mp4';

insert into `ktvs_formats_screenshots`(`title`,`status_id`,`group_id`,`size`,`image_type`,`im_options`,`im_options_manual`,`aspect_ratio_id`,`vertical_aspect_ratio_id`,`added_date`) values ('320x180','1','1','320x180','0','-enhance -strip -unsharp 1.0x1.0+0.5 -unsharp 1.0x1.0+0.5 -modulate 110,102,100 -unsharp 1.0x1.0+0.5 -contrast -gamma 1.2 -resize %SIZE% %INPUT_FILE% -filter Lanczos -filter Blackman -quality 80 %OUTPUT_FILE%','-strip -resize %SIZE% %INPUT_FILE% -quality 80 %OUTPUT_FILE%','2','1',NOW());
insert into `ktvs_formats_screenshots`(`title`,`status_id`,`group_id`,`size`,`image_type`,`im_options`,`im_options_manual`,`aspect_ratio_id`,`vertical_aspect_ratio_id`,`added_date`) values ('336x189','1','1','336x189','1','-enhance -strip -unsharp 1.0x1.0+0.5 -unsharp 1.0x1.0+0.5 -modulate 110,102,100 -unsharp 1.0x1.0+0.5 -contrast -gamma 1.2 -resize %SIZE% %INPUT_FILE% -filter Lanczos -filter Blackman -quality 80 %OUTPUT_FILE%','-strip -resize %SIZE% %INPUT_FILE% -quality 80 %OUTPUT_FILE%','2','1',NOW());
insert into `ktvs_formats_screenshots`(`title`,`status_id`,`group_id`,`size`,`image_type`,`im_options`,`im_options_manual`,`aspect_ratio_id`,`vertical_aspect_ratio_id`,`added_date`) values ('180x100','1','2','180x100','0','-enhance -strip -unsharp 1.0x1.0+0.5 -unsharp 1.0x1.0+0.5 -modulate 110,102,100 -unsharp 1.0x1.0+0.5 -contrast -gamma 1.2 -resize %SIZE% %INPUT_FILE% -filter Lanczos -filter Blackman -quality 80 %OUTPUT_FILE%','-strip -resize %SIZE% %INPUT_FILE% -quality 80 %OUTPUT_FILE%','3','1',NOW());
insert into `ktvs_formats_screenshots`(`title`,`status_id`,`group_id`,`size`,`image_type`,`im_options`,`im_options_manual`,`aspect_ratio_id`,`vertical_aspect_ratio_id`,`added_date`) values ('182x100','1','2','182x100','1','-enhance -strip -unsharp 1.0x1.0+0.5 -unsharp 1.0x1.0+0.5 -modulate 110,102,100 -unsharp 1.0x1.0+0.5 -contrast -gamma 1.2 -resize %SIZE% %INPUT_FILE% -filter Lanczos -filter Blackman -quality 80 %OUTPUT_FILE%','-strip -resize %SIZE% %INPUT_FILE% -quality 80 %OUTPUT_FILE%','3','1',NOW());

insert into `ktvs_formats_albums`(`title`,`status_id`,`group_id`,`size`,`im_options`,`aspect_ratio_id`,`vertical_aspect_ratio_id`,`watermark_position_id`,`access_level_id`,`added_date`) values ('200x150','1','1','200x150','-enhance -strip -unsharp 1.0x1.0+0.5 -unsharp 1.0x1.0+0.5 -modulate 110,102,100 -unsharp 1.0x1.0+0.5 -contrast -gamma 1.2 -resize %SIZE% %INPUT_FILE% -filter Lanczos -filter Blackman -quality 80 %OUTPUT_FILE%','4','4','0','0',NOW());
insert into `ktvs_formats_albums`(`title`,`status_id`,`group_id`,`size`,`im_options`,`aspect_ratio_id`,`vertical_aspect_ratio_id`,`watermark_position_id`,`access_level_id`,`added_date`) values ('240x320','1','2','240x320','-enhance -strip -unsharp 1.0x1.0+0.5 -unsharp 1.0x1.0+0.5 -modulate 110,102,100 -unsharp 1.0x1.0+0.5 -contrast -gamma 1.2 -resize %SIZE% %INPUT_FILE% -filter Lanczos -filter Blackman -quality 80 %OUTPUT_FILE%','2','2','0','0',NOW());

insert into `ktvs_flags`(`group_id`,`title`,`external_id`,`is_alert`,`alert_min_count`,`is_rating`,`rating_weight`,`added_date`) values (1, 'Inappropriate',        'flag_inappropriate_video', 1, 1, 0, 0, NOW());
insert into `ktvs_flags`(`group_id`,`title`,`external_id`,`is_alert`,`alert_min_count`,`is_rating`,`rating_weight`,`added_date`) values (1, 'Video error',          'flag_error_video',         1, 1, 0, 0, NOW());
insert into `ktvs_flags`(`group_id`,`title`,`external_id`,`is_alert`,`alert_min_count`,`is_rating`,`rating_weight`,`added_date`) values (1, 'Copyrighted material', 'flag_copyrighted_video',   1, 1, 0, 0, NOW());
insert into `ktvs_flags`(`group_id`,`title`,`external_id`,`is_alert`,`alert_min_count`,`is_rating`,`rating_weight`,`added_date`) values (1, 'Other',                'flag_other_video',         1, 1, 0, 0, NOW());

insert into `ktvs_flags`(`group_id`,`title`,`external_id`,`is_alert`,`alert_min_count`,`is_rating`,`rating_weight`,`added_date`) values (2, 'Inappropriate',        'flag_inappropriate_album', 1, 1, 0, 0, NOW());
insert into `ktvs_flags`(`group_id`,`title`,`external_id`,`is_alert`,`alert_min_count`,`is_rating`,`rating_weight`,`added_date`) values (2, 'Album error',          'flag_error_album',         1, 1, 0, 0, NOW());
insert into `ktvs_flags`(`group_id`,`title`,`external_id`,`is_alert`,`alert_min_count`,`is_rating`,`rating_weight`,`added_date`) values (2, 'Copyrighted material', 'flag_copyrighted_album',   1, 1, 0, 0, NOW());
insert into `ktvs_flags`(`group_id`,`title`,`external_id`,`is_alert`,`alert_min_count`,`is_rating`,`rating_weight`,`added_date`) values (2, 'Other',                'flag_other_album',         1, 1, 0, 0, NOW());

update `ktvs_options` set `value`='0' where `variable`='PRIVATE_VIDEOS_ACCESS';
update `ktvs_options` set `value`='2' where `variable`='PREMIUM_VIDEOS_ACCESS';
update `ktvs_options` set `value`='0' where `variable`='PRIVATE_ALBUMS_ACCESS';
update `ktvs_options` set `value`='2' where `variable`='PREMIUM_ALBUMS_ACCESS';

update `ktvs_options` set `value`='1' where `variable`='ENABLE_CATEGORY_FIELD_1';
update `ktvs_options` set `value`='1' where `variable`='ENABLE_CATEGORY_FIELD_2';
update `ktvs_options` set `value`='1' where `variable`='ENABLE_CATEGORY_FIELD_3';
update `ktvs_options` set `value`='1' where `variable`='ENABLE_TAG_FIELD_1';
update `ktvs_options` set `value`='1' where `variable`='ENABLE_TAG_FIELD_2';
update `ktvs_options` set `value`='1' where `variable`='ENABLE_TAG_FIELD_3';
update `ktvs_options` set `value`='1' where `variable`='ENABLE_CS_FIELD_1';
update `ktvs_options` set `value`='1' where `variable`='ENABLE_CS_FIELD_2';
update `ktvs_options` set `value`='1' where `variable`='ENABLE_CS_FIELD_3';
update `ktvs_options` set `value`='1' where `variable`='ENABLE_CS_FIELD_4';
update `ktvs_options` set `value`='1' where `variable`='ENABLE_CS_FILE_FIELD_1';
update `ktvs_options` set `value`='1' where `variable`='ENABLE_CS_FILE_FIELD_2';
update `ktvs_options` set `value`='1' where `variable`='ENABLE_MODEL_FIELD_1';
update `ktvs_options` set `value`='1' where `variable`='ENABLE_DVD_FIELD_1';

update `ktvs_options` set `value`='HTML title' where `variable`='CATEGORY_FIELD_1_NAME';
update `ktvs_options` set `value`='HTML desc' where `variable`='CATEGORY_FIELD_2_NAME';
update `ktvs_options` set `value`='SEO text' where `variable`='CATEGORY_FIELD_3_NAME';
update `ktvs_options` set `value`='HTML title' where `variable`='TAG_FIELD_1_NAME';
update `ktvs_options` set `value`='HTML desc' where `variable`='TAG_FIELD_2_NAME';
update `ktvs_options` set `value`='SEO text' where `variable`='TAG_FIELD_3_NAME';
update `ktvs_options` set `value`='Content quality' where `variable`='CS_FIELD_1_NAME';
update `ktvs_options` set `value`='Content quantity' where `variable`='CS_FIELD_2_NAME';
update `ktvs_options` set `value`='Originality' where `variable`='CS_FIELD_3_NAME';
update `ktvs_options` set `value`='Reviewer''s rating' where `variable`='CS_FIELD_4_NAME';
update `ktvs_options` set `value`='Banner 1235px' where `variable`='CS_FILE_FIELD_1_NAME';
update `ktvs_options` set `value`='Banner 883px' where `variable`='CS_FILE_FIELD_2_NAME';
update `ktvs_options` set `value`='Website' where `variable`='MODEL_FIELD_1_NAME';
update `ktvs_options` set `value`='Website' where `variable`='DVD_FIELD_1_NAME';

update `ktvs_options` set `value`='240x320' where `variable`='CATEGORY_AVATAR_SIZE';
update `ktvs_options` set `value`='180x180' where `variable`='USER_AVATAR_SIZE';
update `ktvs_options` set `value`='240x320' where `variable`='MODELS_SCREENSHOT_1_SIZE';
update `ktvs_options` set `value`='280x200' where `variable`='MODELS_SCREENSHOT_2_SIZE';
update `ktvs_options` set `value`='1' where `variable`='MODELS_SCREENSHOT_OPTION';
update `ktvs_options` set `value`='240x320' where `variable`='CS_SCREENSHOT_1_SIZE';
update `ktvs_options` set `value`='360x200' where `variable`='CS_SCREENSHOT_2_SIZE';
update `ktvs_options` set `value`='1' where `variable`='CS_SCREENSHOT_OPTION';
update `ktvs_options` set `value`='240x320' where `variable`='DVD_COVER_1_SIZE';
update `ktvs_options` set `value`='360x200' where `variable`='DVD_COVER_2_SIZE';
update `ktvs_options` set `value`='2' where `variable`='DVD_COVER_OPTION';
update `ktvs_options` set `value`='240x320' where `variable`='DVD_GROUP_COVER_1_SIZE';
update `ktvs_options` set `value`='360x200' where `variable`='DVD_GROUP_COVER_2_SIZE';
update `ktvs_options` set `value`='2' where `variable`='DVD_GROUP_COVER_OPTION';

insert into `ktvs_options`(`variable`,`value`) values ('INITIAL_VERSION','5.5.0');
