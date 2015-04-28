-- phpMyAdmin SQL Dump
-- version 4.2.5
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Apr 28, 2015 at 07:41 PM
-- Server version: 5.5.38
-- PHP Version: 5.5.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `spikebook`
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_activity`
--

CREATE TABLE `wp_bp_activity` (
`id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `component` varchar(75) NOT NULL,
  `type` varchar(75) NOT NULL,
  `action` text NOT NULL,
  `content` longtext NOT NULL,
  `primary_link` text NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `secondary_item_id` bigint(20) DEFAULT NULL,
  `date_recorded` datetime NOT NULL,
  `hide_sitewide` tinyint(1) DEFAULT '0',
  `mptt_left` int(11) NOT NULL DEFAULT '0',
  `mptt_right` int(11) NOT NULL DEFAULT '0',
  `is_spam` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `wp_bp_activity`
--

INSERT INTO `wp_bp_activity` (`id`, `user_id`, `component`, `type`, `action`, `content`, `primary_link`, `item_id`, `secondary_item_id`, `date_recorded`, `hide_sitewide`, `mptt_left`, `mptt_right`, `is_spam`) VALUES
(8, 4, 'members', 'last_activity', '', '', '', 0, NULL, '2015-04-21 19:57:23', 0, 0, 0, 0),
(7, 5, 'members', 'last_activity', '', '', '', 0, NULL, '2015-04-21 20:00:10', 0, 0, 0, 0),
(6, 3, 'members', 'last_activity', '', '', '', 0, NULL, '2015-04-23 19:23:01', 0, 0, 0, 0),
(5, 1, 'members', 'last_activity', '', '', '', 0, NULL, '2015-04-27 21:53:36', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_activity_meta`
--

CREATE TABLE `wp_bp_activity_meta` (
`id` bigint(20) NOT NULL,
  `activity_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_friends`
--

CREATE TABLE `wp_bp_friends` (
`id` bigint(20) NOT NULL,
  `initiator_user_id` bigint(20) NOT NULL,
  `friend_user_id` bigint(20) NOT NULL,
  `is_confirmed` tinyint(1) DEFAULT '0',
  `is_limited` tinyint(1) DEFAULT '0',
  `date_created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_groups`
--

CREATE TABLE `wp_bp_groups` (
`id` bigint(20) NOT NULL,
  `creator_id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'public',
  `enable_forum` tinyint(1) NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_bp_groups`
--

INSERT INTO `wp_bp_groups` (`id`, `creator_id`, `name`, `slug`, `description`, `status`, `enable_forum`, `date_created`) VALUES
(1, 1, 'Cohort 2014-2015', 'cohort-2014-2015', 'Cohort 2014-2015', 'public', 0, '2015-04-23 18:52:26');

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_groups_groupmeta`
--

CREATE TABLE `wp_bp_groups_groupmeta` (
`id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `wp_bp_groups_groupmeta`
--

INSERT INTO `wp_bp_groups_groupmeta` (`id`, `group_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'total_member_count', '2'),
(2, 1, 'last_activity', '2015-04-23 18:54:07'),
(3, 1, 'invite_status', 'admins');

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_groups_members`
--

CREATE TABLE `wp_bp_groups_members` (
`id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `inviter_id` bigint(20) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `is_mod` tinyint(1) NOT NULL DEFAULT '0',
  `user_title` varchar(100) NOT NULL,
  `date_modified` datetime NOT NULL,
  `comments` longtext NOT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `invite_sent` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_bp_groups_members`
--

INSERT INTO `wp_bp_groups_members` (`id`, `group_id`, `user_id`, `inviter_id`, `is_admin`, `is_mod`, `user_title`, `date_modified`, `comments`, `is_confirmed`, `is_banned`, `invite_sent`) VALUES
(1, 1, 1, 0, 1, 0, 'Group Admin', '2015-04-23 18:52:01', '', 1, 0, 0),
(2, 1, 3, 0, 0, 0, '', '2015-04-23 18:54:07', '', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_messages_messages`
--

CREATE TABLE `wp_bp_messages_messages` (
`id` bigint(20) NOT NULL,
  `thread_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` longtext NOT NULL,
  `date_sent` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_messages_meta`
--

CREATE TABLE `wp_bp_messages_meta` (
`id` bigint(20) NOT NULL,
  `message_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_messages_notices`
--

CREATE TABLE `wp_bp_messages_notices` (
`id` bigint(20) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` longtext NOT NULL,
  `date_sent` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_messages_recipients`
--

CREATE TABLE `wp_bp_messages_recipients` (
`id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `thread_id` bigint(20) NOT NULL,
  `unread_count` int(10) NOT NULL DEFAULT '0',
  `sender_only` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_notifications`
--

CREATE TABLE `wp_bp_notifications` (
`id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `secondary_item_id` bigint(20) DEFAULT NULL,
  `component_name` varchar(75) NOT NULL,
  `component_action` varchar(75) NOT NULL,
  `date_notified` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_xprofile_data`
--

CREATE TABLE `wp_bp_xprofile_data` (
`id` bigint(20) unsigned NOT NULL,
  `field_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `value` longtext NOT NULL,
  `last_updated` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `wp_bp_xprofile_data`
--

INSERT INTO `wp_bp_xprofile_data` (`id`, `field_id`, `user_id`, `value`, `last_updated`) VALUES
(1, 1, 1, 'admin', '2015-03-09 04:47:11'),
(2, 1, 2, 'Terrence', '2015-03-24 15:39:16'),
(3, 1, 3, 'Test user', '2015-04-23 03:06:23'),
(4, 1, 5, 'harikayedidi', '2015-04-21 19:55:12'),
(5, 1, 4, 'recruiter-test', '2015-04-21 19:57:45'),
(6, 2, 1, 'NYU', '2015-04-24 00:47:48');

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_xprofile_fields`
--

CREATE TABLE `wp_bp_xprofile_fields` (
`id` bigint(20) unsigned NOT NULL,
  `group_id` bigint(20) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned NOT NULL,
  `type` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` longtext NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_default_option` tinyint(1) NOT NULL DEFAULT '0',
  `field_order` bigint(20) NOT NULL DEFAULT '0',
  `option_order` bigint(20) NOT NULL DEFAULT '0',
  `order_by` varchar(15) NOT NULL DEFAULT '',
  `can_delete` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_bp_xprofile_fields`
--

INSERT INTO `wp_bp_xprofile_fields` (`id`, `group_id`, `parent_id`, `type`, `name`, `description`, `is_required`, `is_default_option`, `field_order`, `option_order`, `order_by`, `can_delete`) VALUES
(1, 1, 0, 'textbox', 'Company ', '', 1, 0, 1, 0, '', 0),
(2, 2, 0, 'textbox', 'School', '', 0, 0, 1, 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_xprofile_groups`
--

CREATE TABLE `wp_bp_xprofile_groups` (
`id` bigint(20) unsigned NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` mediumtext NOT NULL,
  `group_order` bigint(20) NOT NULL DEFAULT '0',
  `can_delete` tinyint(1) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_bp_xprofile_groups`
--

INSERT INTO `wp_bp_xprofile_groups` (`id`, `name`, `description`, `group_order`, `can_delete`) VALUES
(1, 'Base', '', 0, 0),
(2, 'Resume fields', 'Type your resume details in the following fields ', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_xprofile_meta`
--

CREATE TABLE `wp_bp_xprofile_meta` (
`id` bigint(20) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `object_type` varchar(150) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_bp_xprofile_meta`
--

INSERT INTO `wp_bp_xprofile_meta` (`id`, `object_id`, `object_type`, `meta_key`, `meta_value`) VALUES
(1, 2, 'field', 'default_visibility', 'public'),
(2, 2, 'field', 'allow_custom_visibility', 'disabled');

-- --------------------------------------------------------

--
-- Table structure for table `wp_cimy_uef_data`
--

CREATE TABLE `wp_cimy_uef_data` (
`ID` bigint(20) NOT NULL,
  `USER_ID` bigint(20) NOT NULL,
  `FIELD_ID` bigint(20) NOT NULL,
  `VALUE` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_cimy_uef_fields`
--

CREATE TABLE `wp_cimy_uef_fields` (
`ID` bigint(20) NOT NULL,
  `F_ORDER` bigint(20) NOT NULL,
  `FIELDSET` bigint(20) NOT NULL DEFAULT '0',
  `NAME` varchar(20) DEFAULT NULL,
  `LABEL` text,
  `DESCRIPTION` text,
  `TYPE` varchar(20) DEFAULT NULL,
  `RULES` text,
  `VALUE` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_cimy_uef_wp_fields`
--

CREATE TABLE `wp_cimy_uef_wp_fields` (
`ID` bigint(20) NOT NULL,
  `F_ORDER` bigint(20) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `LABEL` text,
  `DESCRIPTION` text,
  `TYPE` varchar(20) DEFAULT NULL,
  `RULES` text,
  `VALUE` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
`meta_id` bigint(20) unsigned NOT NULL,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `wp_commentmeta`
--

INSERT INTO `wp_commentmeta` (`meta_id`, `comment_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_trash_meta_status', '0'),
(2, 2, '_wp_trash_meta_time', '1429641156'),
(3, 3, '_wp_trash_meta_status', '0'),
(4, 3, '_wp_trash_meta_time', '1429641157');

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE `wp_comments` (
`comment_ID` bigint(20) unsigned NOT NULL,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Mr WordPress', '', 'https://wordpress.org/', '', '2015-02-15 22:08:09', '2015-02-15 22:08:09', 'Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.', 0, '1', '', '', 0, 0),
(2, 1, 'Janette', 'jbcsotdi@mail.com', 'http://tgi.link/2xsj', '104.168.69.19', '2015-04-19 08:04:19', '2015-04-19 12:04:19', 'Hi my name is Janette and I just wanted to drop you a quick note here instead of calling you. I discovered your Hello world! | SPIKEBOOK page and noticed you could have a lot more visitors. I have found that the key to running a successful website is making sure the visitors you are getting are interested in your niche. There is a company that you can get targeted visitors from and they let you try their service for free for 7 days. I managed to get over 300 targeted visitors to day to my website. Check it out here: http://corta.co/9ipU', 0, 'trash', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.0.3705)', '', 0, 0),
(3, 1, 'Olivie', 'iiyrzr@hotmail.com', 'http://bbqr.me/mu', '104.168.71.60', '2015-04-20 05:57:15', '2015-04-20 09:57:15', 'Hi my name is Olivie and I just wanted to drop you a quick note here instead of calling you. I came to your Hello world! | SPIKEBOOK page and noticed you could have a lot more hits. I have found that the key to running a successful website is making sure the visitors you are getting are interested in your niche. There is a company that you can get targeted visitors from and they let you try the service for free for 7 days. I managed to get over 300 targeted visitors to day to my website. Check it out here: http://garye.co/6y', 0, 'trash', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.0.3705)', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE `wp_links` (
`link_id` bigint(20) unsigned NOT NULL,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE `wp_options` (
`option_id` bigint(20) unsigned NOT NULL,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1927 ;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost', 'yes'),
(2, 'home', 'http://localhost', 'yes'),
(3, 'blogname', 'SPIKEBOOK', 'yes'),
(4, 'blogdescription', 'The Official Resume and Portfolio Portal for NYU SPIKE Interns', 'yes'),
(5, 'users_can_register', '1', 'yes'),
(6, 'admin_email', 'admin@spikebook.co', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i A', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/archives/%post_id%', 'yes'),
(29, 'gzipcompression', '0', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:6:{i:0;s:24:"buddypress/bp-loader.php";i:1;s:49:"cimy-user-extra-fields/cimy_user_extra_fields.php";i:2;s:36:"contact-form-7/wp-contact-form-7.php";i:3;s:24:"page-theme/pageTheme.php";i:4;s:33:"theme-my-login/theme-my-login.php";i:5;s:37:"user-role-editor/user-role-editor.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'advanced_edit', '0', 'yes'),
(37, 'comment_max_links', '2', 'yes'),
(38, 'gmt_offset', '', 'yes'),
(39, 'default_email_category', '1', 'yes'),
(40, 'recently_edited', 'a:5:{i:0;s:77:"/Applications/MAMP/htdocs/spike/wp-content/themes/twentyfifteen/functions.php";i:2;s:87:"/Applications/MAMP/htdocs/spike/wp-content/themes/twentyfifteen/my-custom-functions.php";i:3;s:73:"/Applications/MAMP/htdocs/spike/wp-content/themes/twentyfifteen/style.css";i:4;s:87:"/home/nyuinqb8/public_html/www.spikebook.co/wp-content/plugins/page-theme/pageTheme.php";i:5;s:84:"/home/nyuinqb8/public_html/www.spikebook.co/wp-content/plugins/page-theme/readme.txt";}', 'no'),
(41, 'template', 'twentyfifteen', 'yes'),
(42, 'stylesheet', 'twentyfifteen', 'yes'),
(43, 'comment_whitelist', '1', 'yes'),
(44, 'blacklist_keys', '', 'no'),
(45, 'comment_registration', '0', 'yes'),
(46, 'html_type', 'text/html', 'yes'),
(47, 'use_trackback', '0', 'yes'),
(48, 'default_role', 'subscriber', 'yes'),
(49, 'db_version', '30133', 'yes'),
(50, 'uploads_use_yearmonth_folders', '1', 'yes'),
(51, 'upload_path', '', 'yes'),
(52, 'blog_public', '1', 'yes'),
(53, 'default_link_category', '2', 'yes'),
(54, 'show_on_front', 'page', 'yes'),
(55, 'tag_base', '', 'yes'),
(56, 'show_avatars', '1', 'yes'),
(57, 'avatar_rating', 'G', 'yes'),
(58, 'upload_url_path', '', 'yes'),
(59, 'thumbnail_size_w', '150', 'yes'),
(60, 'thumbnail_size_h', '150', 'yes'),
(61, 'thumbnail_crop', '1', 'yes'),
(62, 'medium_size_w', '300', 'yes'),
(63, 'medium_size_h', '300', 'yes'),
(64, 'avatar_default', 'mystery', 'yes'),
(65, 'large_size_w', '1024', 'yes'),
(66, 'large_size_h', '1024', 'yes'),
(67, 'image_default_link_type', 'file', 'yes'),
(68, 'image_default_size', '', 'yes'),
(69, 'image_default_align', '', 'yes'),
(70, 'close_comments_for_old_posts', '0', 'yes'),
(71, 'close_comments_days_old', '14', 'yes'),
(72, 'thread_comments', '1', 'yes'),
(73, 'thread_comments_depth', '5', 'yes'),
(74, 'page_comments', '0', 'yes'),
(75, 'comments_per_page', '50', 'yes'),
(76, 'default_comments_page', 'newest', 'yes'),
(77, 'comment_order', 'asc', 'yes'),
(78, 'sticky_posts', 'a:0:{}', 'yes'),
(79, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_text', 'a:0:{}', 'yes'),
(81, 'widget_rss', 'a:0:{}', 'yes'),
(82, 'uninstall_plugins', 'a:1:{s:33:"theme-my-login/theme-my-login.php";a:2:{i:0;s:20:"Theme_My_Login_Admin";i:1;s:9:"uninstall";}}', 'no'),
(83, 'timezone_string', 'America/New_York', 'yes'),
(84, 'page_for_posts', '2', 'yes'),
(85, 'page_on_front', '36', 'yes'),
(86, 'default_post_format', '0', 'yes'),
(87, 'link_manager_enabled', '0', 'yes'),
(88, 'initial_db_version', '30133', 'yes'),
(89, 'wp_user_roles', 'a:7:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:69:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:14:"ure_edit_roles";b:1;s:16:"ure_create_roles";b:1;s:16:"ure_delete_roles";b:1;s:23:"ure_create_capabilities";b:1;s:23:"ure_delete_capabilities";b:1;s:18:"ure_manage_options";b:1;s:15:"ure_reset_roles";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:9:"recruiter";a:2:{s:4:"name";s:9:"Recruiter";s:12:"capabilities";a:2:{s:7:"level_0";b:1;s:4:"read";b:1;}}s:7:"student";a:2:{s:4:"name";s:7:"Student";s:12:"capabilities";a:2:{s:7:"level_0";b:1;s:4:"read";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(90, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(91, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(92, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(93, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'sidebars_widgets', 'a:3:{s:19:"wp_inactive_widgets";a:1:{i:0;s:6:"meta-2";}s:9:"sidebar-1";a:5:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";}s:13:"array_version";i:3;}', 'yes'),
(96, 'cron', 'a:6:{i:1430246433;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1430248380;a:1:{s:20:"wp_maybe_auto_update";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1430256495;a:1:{s:14:"redux_tracking";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1430258906;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1430259172;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(97, 'kopa_setting', 'a:9:{s:4:"home";a:2:{s:9:"layout_id";s:18:"blog-right-sidebar";s:8:"sidebars";a:4:{i:0;s:10:"sidebar_14";i:1;s:10:"sidebar_10";i:2;s:10:"sidebar_11";i:3;s:10:"sidebar_12";}}s:10:"front-page";a:2:{s:9:"layout_id";s:11:"home-page-1";s:8:"sidebars";a:12:{i:0;s:9:"sidebar_1";i:1;s:9:"sidebar_2";i:2;s:9:"sidebar_3";i:3;s:9:"sidebar_4";i:4;s:9:"sidebar_5";i:5;s:9:"sidebar_6";i:6;s:9:"sidebar_7";i:7;s:9:"sidebar_8";i:8;s:9:"sidebar_9";i:9;s:10:"sidebar_10";i:10;s:10:"sidebar_11";i:11;s:10:"sidebar_12";}}s:4:"post";a:2:{s:9:"layout_id";s:20:"single-right-sidebar";s:8:"sidebars";a:4:{i:0;s:10:"sidebar_14";i:1;s:10:"sidebar_10";i:2;s:10:"sidebar_11";i:3;s:10:"sidebar_12";}}s:4:"page";a:2:{s:9:"layout_id";s:18:"page-right-sidebar";s:8:"sidebars";a:4:{i:0;s:10:"sidebar_14";i:1;s:10:"sidebar_10";i:2;s:10:"sidebar_11";i:3;s:10:"sidebar_12";}}s:8:"taxonomy";a:2:{s:9:"layout_id";s:18:"blog-right-sidebar";s:8:"sidebars";a:4:{i:0;s:10:"sidebar_14";i:1;s:10:"sidebar_10";i:2;s:10:"sidebar_11";i:3;s:10:"sidebar_12";}}s:6:"search";a:2:{s:9:"layout_id";s:18:"blog-right-sidebar";s:8:"sidebars";a:4:{i:0;s:10:"sidebar_14";i:1;s:10:"sidebar_10";i:2;s:10:"sidebar_11";i:3;s:10:"sidebar_12";}}s:7:"archive";a:2:{s:9:"layout_id";s:18:"blog-right-sidebar";s:8:"sidebars";a:4:{i:0;s:10:"sidebar_14";i:1;s:10:"sidebar_10";i:2;s:10:"sidebar_11";i:3;s:10:"sidebar_12";}}s:4:"_404";a:2:{s:9:"layout_id";s:9:"error-404";s:8:"sidebars";a:3:{i:0;s:10:"sidebar_10";i:1;s:10:"sidebar_11";i:2;s:10:"sidebar_12";}}s:9:"portfolio";a:2:{s:9:"layout_id";s:9:"portfolio";s:8:"sidebars";a:4:{i:0;s:10:"sidebar_15";i:1;s:10:"sidebar_10";i:2;s:10:"sidebar_11";i:3;s:10:"sidebar_12";}}}', 'yes'),
(98, 'kopa_sidebar', 'a:18:{s:12:"sidebar_hide";s:10:"-- None --";s:9:"sidebar_1";s:9:"Sidebar 1";s:9:"sidebar_2";s:9:"Sidebar 2";s:9:"sidebar_3";s:9:"Sidebar 3";s:9:"sidebar_4";s:9:"Sidebar 4";s:9:"sidebar_5";s:9:"Sidebar 5";s:9:"sidebar_6";s:9:"Sidebar 6";s:9:"sidebar_7";s:9:"Sidebar 7";s:9:"sidebar_8";s:9:"Sidebar 8";s:9:"sidebar_9";s:9:"Sidebar 9";s:10:"sidebar_10";s:10:"Sidebar 10";s:10:"sidebar_11";s:10:"Sidebar 11";s:10:"sidebar_12";s:10:"Sidebar 12";s:10:"sidebar_13";s:10:"Sidebar 13";s:10:"sidebar_14";s:10:"Sidebar 14";s:10:"sidebar_15";s:10:"Sidebar 15";s:10:"sidebar_16";s:10:"Sidebar 16";s:10:"sidebar_17";s:10:"Sidebar 17";}', 'yes'),
(99, 'kopa_is_database_setup', 'nictitate-setting-version-21', 'yes'),
(108, '_transient_random_seed', '7f2dff4bc83bcd73846656567c2c7b94', 'yes'),
(109, '_site_transient_timeout_browser_b1bd855164e278694502d59ab27b4b36', '1424643172', 'yes'),
(110, '_site_transient_browser_b1bd855164e278694502d59ab27b4b36', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"40.0.2214.111";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(121, 'can_compress_scripts', '1', 'yes'),
(130, '_site_transient_timeout_browser_25b283ac5a6c8b3b071241d04470c1fe', '1424643195', 'yes'),
(131, '_site_transient_browser_25b283ac5a6c8b3b071241d04470c1fe', 'a:9:{s:8:"platform";s:9:"Macintosh";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"40.0.2214.111";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(136, '_site_transient_timeout_browser_8f730e552d3a22642330005eb6a0b68c', '1424658450', 'yes'),
(137, '_site_transient_browser_8f730e552d3a22642330005eb6a0b68c', 'a:9:{s:8:"platform";s:9:"Macintosh";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"40.0.2214.111";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(143, '_site_transient_timeout_browser_8e169efd09ccd7ef1749c9ea7fb8459c', '1424883624', 'yes'),
(144, '_site_transient_browser_8e169efd09ccd7ef1749c9ea7fb8459c', 'a:9:{s:8:"platform";s:9:"Macintosh";s:4:"name";s:6:"Safari";s:7:"version";s:5:"8.0.2";s:10:"update_url";s:28:"http://www.apple.com/safari/";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/safari.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/safari.png";s:15:"current_version";s:1:"5";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(167, 'auto_core_update_notified', 'a:4:{s:4:"type";s:7:"success";s:5:"email";s:18:"admin@spikebook.co";s:7:"version";s:5:"4.1.2";s:9:"timestamp";i:1429630643;}', 'yes'),
(206, 'recently_activated', 'a:0:{}', 'yes'),
(574, 'current_theme', 'Twenty Fifteen', 'yes'),
(575, 'theme_mods_intima', 'a:3:{i:0;b:0;s:18:"nav_menu_locations";a:1:{s:11:"header-menu";i:2;}s:16:"sidebars_widgets";a:2:{s:4:"time";i:1429758513;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-1";a:0:{}}}}', 'yes'),
(576, 'theme_switched', '', 'yes'),
(577, 'redux-framework-tracking', 'a:3:{s:8:"dev_mode";b:0;s:4:"hash";s:32:"919446d121cb9e14008491c2100eed1f";s:14:"allow_tracking";s:3:"yes";}', 'yes'),
(578, 'redux_framework', 'a:100:{s:8:"last_tab";s:1:"6";s:11:"menu_system";s:1:"1";s:23:"section_leftmenu_avatar";a:5:{s:3:"url";s:65:"http://spikebook.co/wp/wp-content/themes/intima/images/avatar.jpg";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:10:"custom_css";s:44:"                                            ";s:9:"custom_ga";s:44:"                                            ";s:19:"header_display_menu";s:1:"1";s:16:"header_menu_text";s:4:"Home";s:16:"header_menu_icon";s:7:"fa-home";s:17:"header_background";a:3:{s:16:"background-color";s:7:"#161415";s:16:"background-image";s:61:"http://spikebook.co/wp/wp-content/themes/intima/images/bg.jpg";s:5:"media";a:4:{s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}}s:25:"header_overlay_background";a:3:{s:16:"background-color";s:7:"#161415";s:16:"background-image";s:66:"http://spikebook.co/wp/wp-content/themes/intima/images/bg-blur.jpg";s:5:"media";a:4:{s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}}s:12:"header_title";s:30:"I''m <span>Harika Yedidi</span>";s:11:"header_text";s:170:"I''m a passionate <span>UI/UX Designer</span> and <span>Front-End Developer</span> creating modern and responsive design for <span>Web</span> and <span>Mobile</span>. <br>";s:21:"section_about_display";s:1:"1";s:26:"section_about_display_menu";s:1:"1";s:23:"section_about_menu_text";s:5:"Test ";s:23:"section_about_menu_icon";s:7:"fa-user";s:21:"section_abtme_mainimg";a:5:{s:3:"url";s:0:"";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:19:"section_abtme_bgimg";a:2:{s:16:"background-image";s:60:"http://spikebook.co/wp/wp-content/themes/intima/images/2.jpg";s:5:"media";a:4:{s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}}s:19:"section_abtme_title";s:13:"Harika Yedidi";s:22:"section_abtme_subtitle";s:15:"UI/UX Developer";s:10:"about_text";s:0:"";s:16:"hire_button_show";s:1:"1";s:24:"hire_button_contact_link";s:1:"1";s:20:"section_hire_me_link";s:0:"";s:20:"section_abtme_resume";s:63:"https://www.dropbox.com/home?preview=RESUMECV_Harika_Yedidi.pdf";s:22:"section_resume_display";s:1:"1";s:27:"section_resume_display_menu";s:1:"1";s:24:"section_resume_menu_text";s:6:"Resume";s:24:"section_resume_menu_icon";s:12:"fa-file-text";s:20:"section_resume_title";s:6:"RESUME";s:24:"resume_education_display";s:1:"1";s:29:"resume_education_section_text";s:9:"Education";s:21:"education_post_number";s:1:"3";s:20:"education_post_order";s:1:"2";s:25:"resume_employment_display";s:1:"1";s:30:"resume_employment_section_text";s:10:"Employment";s:22:"employment_post_number";s:1:"3";s:21:"employment_post_order";s:1:"2";s:20:"resume_skill_display";s:1:"1";s:25:"resume_skill_section_text";s:5:"skill";s:16:"resume_skill_des";s:0:"";s:13:"resume_skills";a:6:{i:0;s:22:"PHOTOSHOP, 60, #1abc9c";i:1;s:24:"ILLUSTRATOR, 55, #e74c3c";i:2;s:22:"WORDPRESS, 50, #34495e";i:3;s:16:"CSS, 90, #3498db";i:4;s:18:"HTML5, 80, #d35400";i:5;s:19:"JQUERY, 50, #9b59b6";}s:26:"resume_recognition_display";s:1:"1";s:32:"resume_recognition_section_title";s:11:"Recognition";s:22:"resume_recognition_des";s:0:"";s:23:"recognition_post_number";s:1:"4";s:22:"recognition_post_order";s:1:"2";s:25:"section_portfolio_display";s:1:"1";s:30:"section_portfolio_display_menu";s:1:"1";s:23:"section_portfolio_bgimg";a:2:{s:16:"background-image";s:60:"http://spikebook.co/wp/wp-content/themes/intima/images/3.jpg";s:5:"media";a:4:{s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}}s:27:"section_portfolio_menu_text";s:9:"Portfolio";s:27:"section_portfolio_menu_icon";s:12:"fa-briefcase";s:23:"section_portfolio_title";s:16:"SOME OF MY WORKS";s:21:"portfolio_post_number";s:1:"8";s:20:"portfolio_post_order";s:1:"2";s:20:"section_hire_display";s:1:"1";s:18:"section_hire_title";s:32:"HIRE ME FOR YOUR AWESOME PROJECT";s:16:"section_hire_des";s:108:"I am available for Freelance projects that depends on your project value. Hire me and get your project done!";s:21:"port_hire_button_show";s:1:"1";s:31:"port_hire_button_contact_scroll";s:1:"1";s:25:"port_section_hire_me_link";s:0:"";s:27:"section_testimonial_display";s:1:"1";s:32:"section_testimonial_display_menu";s:1:"1";s:29:"section_testimonial_menu_text";s:11:"Testimonial";s:29:"section_testimonial_menu_icon";s:11:"fa-comments";s:25:"section_testimonial_title";s:19:"CLIENT TESTIMONIALS";s:23:"testimonial_post_number";s:1:"3";s:22:"testimonial_post_order";s:1:"2";s:23:"section_contact_display";s:1:"1";s:28:"section_contact_display_menu";s:1:"1";s:25:"section_contact_menu_text";s:7:"CONTACT";s:25:"section_contact_menu_icon";s:11:"fa-envelope";s:21:"section_contact_title";s:12:"GET IN TOUCH";s:19:"section_contact_des";s:46:"Please feel free to e-mail me at hy837@nyu.edu";s:25:"section_contact_shortcode";s:46:"[contact-form-7 id="102" title="Get in touch"]";s:19:"section_map_display";s:1:"1";s:19:"section_contact_lat";s:9:"23.790223";s:19:"section_contact_lon";s:9:"90.414036";s:27:"section_contact_description";s:61:"<!--more-->\r\n\r\n35 Vroom Street, Apt #2, Jersey City, NJ 07306";s:15:"social_facebook";s:0:"";s:14:"social_twitter";s:0:"";s:13:"social_google";s:0:"";s:15:"social_linkedin";s:0:"";s:16:"social_instagram";s:0:"";s:15:"social_dribbble";s:0:"";s:12:"social_skype";s:0:"";s:11:"footer_text";s:0:"";s:25:"section_blog_display_menu";s:1:"0";s:22:"section_blog_menu_text";s:4:"Blog";s:22:"section_blog_menu_link";s:27:"http://spikebook.co/wp/blog";s:22:"section_blog_menu_icon";s:7:"fa-code";s:15:"section_blog_bg";a:5:{s:3:"url";s:73:"http://spikebook.co/wp/wp-content/themes/intima/images/blog-header-bg.jpg";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:18:"section_blog_title";s:9:"Spikebook";s:16:"section_blog_des";s:32:"One stop to hire awesome people!";s:25:"blog_page_template_select";s:1:"1";s:27:"single_page_sidebar_display";s:1:"1";s:17:"section_404_title";s:3:"404";s:15:"section_404_des";s:115:"The page your are looking for does not exist,\r\nI can take you to the <a href="http://spikebook.co/wp">home page</a>";s:19:"section_404_full_bg";a:4:{s:16:"background-color";s:7:"#1481c4";s:17:"background-repeat";s:9:"no-repeat";s:16:"background-image";s:67:"http://spikebook.co/wp/wp-content/themes/intima/images/error_bg.png";s:5:"media";a:4:{s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}}s:20:"section_404_quote_bg";a:3:{s:17:"background-repeat";s:9:"no-repeat";s:16:"background-image";s:67:"http://spikebook.co/wp/wp-content/themes/intima/images/quote_bg.png";s:5:"media";a:4:{s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}}}', 'yes'),
(579, 'redux_framework-transients', 'a:2:{s:14:"changed_values";a:2:{s:8:"last_tab";s:0:"";s:25:"section_contact_shortcode";s:0:"";}s:9:"last_save";i:1429647739;}', 'yes'),
(641, '_site_transient_timeout_browser_28556d50a755ee2d67a82a292c1b27fe', '1425860714', 'yes'),
(642, '_site_transient_browser_28556d50a755ee2d67a82a292c1b27fe', 'a:9:{s:8:"platform";s:9:"Macintosh";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"40.0.2214.115";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(679, 'wpcf7', 'a:1:{s:7:"version";s:5:"4.1.2";}', 'yes'),
(685, 'WPLANG', '', 'yes'),
(688, 'category_children', 'a:0:{}', 'yes'),
(715, '_site_transient_timeout_browser_32a4deac9f9909e92a3f597868ec7b58', '1426101130', 'yes'),
(716, '_site_transient_browser_32a4deac9f9909e92a3f597868ec7b58', 'a:9:{s:8:"platform";s:9:"Macintosh";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"40.0.2214.115";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(728, '_site_transient_timeout_browser_1b723f2446f3ea41c0a31ad26ed43d8e', '1426105449', 'yes'),
(729, '_site_transient_browser_1b723f2446f3ea41c0a31ad26ed43d8e', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"40.0.2214.115";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(765, '_site_transient_timeout_browser_cdcb30699c7399132a5ee6cec6ca57b9', '1426374029', 'yes'),
(766, '_site_transient_browser_cdcb30699c7399132a5ee6cec6ca57b9', 'a:9:{s:8:"platform";s:9:"Macintosh";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"41.0.2272.76";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(818, 'bp-deactivated-components', 'a:0:{}', 'yes'),
(819, 'bb-config-location', '/home/nyuinqb8/public_html/www.spikebook.co/wp/bb-config.php', 'yes'),
(820, 'bp-xprofile-base-group-name', 'Base', 'yes'),
(821, 'bp-xprofile-fullname-field-name', 'Company ', 'yes'),
(822, 'bp-blogs-first-install', '', 'yes'),
(823, 'bp-disable-profile-sync', '1', 'yes'),
(824, 'hide-loggedout-adminbar', '0', 'yes'),
(825, 'bp-disable-avatar-uploads', '0', 'yes'),
(826, 'bp-disable-account-deletion', '0', 'yes'),
(827, 'bp-disable-blogforum-comments', '1', 'yes'),
(828, '_bp_theme_package_id', 'legacy', 'yes'),
(829, 'bp_restrict_group_creation', '1', 'yes'),
(830, '_bp_enable_akismet', '1', 'yes'),
(831, '_bp_enable_heartbeat_refresh', '1', 'yes'),
(832, '_bp_force_buddybar', '', 'yes'),
(833, '_bp_retain_bp_default', '', 'yes'),
(834, 'widget_bp_core_login_widget', '', 'yes'),
(835, 'widget_bp_core_members_widget', '', 'yes'),
(836, 'widget_bp_core_whos_online_widget', '', 'yes'),
(837, 'widget_bp_core_recently_active_widget', '', 'yes'),
(838, 'widget_bp_groups_widget', '', 'yes'),
(839, 'widget_bp_messages_sitewide_notices_widget', '', 'yes'),
(844, 'registration', '0', 'yes'),
(845, 'bp-active-components', 'a:6:{s:8:"xprofile";s:1:"1";s:8:"settings";s:1:"1";s:8:"messages";s:1:"1";s:13:"notifications";s:1:"1";s:6:"groups";s:1:"1";s:7:"members";s:1:"1";}', 'yes'),
(846, 'bp-pages', 'a:4:{s:7:"members";i:26;s:8:"register";i:38;s:8:"activate";i:101;s:6:"groups";i:105;}', 'yes'),
(847, '_bp_db_version', '9181', 'yes'),
(951, '_site_transient_timeout_browser_3e65feecb03c40dbb4c0227e8b8d10ef', '1426900957', 'yes'),
(952, '_site_transient_browser_3e65feecb03c40dbb4c0227e8b8d10ef', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"41.0.2272.76";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(1007, '_site_transient_timeout_browser_b9451e8c39091957d51d1862dc63676e', '1427816283', 'yes'),
(1008, '_site_transient_browser_b9451e8c39091957d51d1862dc63676e', 'a:9:{s:8:"platform";s:9:"Macintosh";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"41.0.2272.101";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(1028, 'jr_mt_internal_settings', 'a:4:{s:7:"version";s:3:"7.1";s:9:"permalink";s:12:"/%postname%/";s:10:"query_vars";a:53:{i:0;s:1:"m";i:1;s:1:"p";i:2;s:5:"posts";i:3;s:1:"w";i:4;s:3:"cat";i:5;s:12:"withcomments";i:6;s:15:"withoutcomments";i:7;s:1:"s";i:8;s:6:"search";i:9;s:5:"exact";i:10;s:8:"sentence";i:11;s:8:"calendar";i:12;s:4:"page";i:13;s:5:"paged";i:14;s:4:"more";i:15;s:2:"tb";i:16;s:2:"pb";i:17;s:6:"author";i:18;s:5:"order";i:19;s:7:"orderby";i:20;s:4:"year";i:21;s:8:"monthnum";i:22;s:3:"day";i:23;s:4:"hour";i:24;s:6:"minute";i:25;s:6:"second";i:26;s:4:"name";i:27;s:13:"category_name";i:28;s:3:"tag";i:29;s:4:"feed";i:30;s:11:"author_name";i:31;s:6:"static";i:32;s:8:"pagename";i:33;s:7:"page_id";i:34;s:5:"error";i:35;s:14:"comments_popup";i:36;s:10:"attachment";i:37;s:13:"attachment_id";i:38;s:7:"subpost";i:39;s:10:"subpost_id";i:40;s:7:"preview";i:41;s:6:"robots";i:42;s:8:"taxonomy";i:43;s:4:"term";i:44;s:5:"cpage";i:45;s:9:"post_type";i:46;s:11:"post_format";i:47;s:9:"education";i:48;s:10:"employment";i:49;s:11:"recognition";i:50;s:9:"portfolio";i:51;s:11:"testimonial";i:52;s:14:"bp_member_type";}s:6:"v7init";b:1;}', 'yes'),
(1029, 'jr_mt_settings', 'a:13:{s:7:"aliases";a:2:{i:0;a:3:{s:3:"url";s:22:"http://spikebook.co/wp";s:4:"prep";a:4:{s:4:"host";s:12:"spikebook.co";s:4:"path";s:3:"/wp";s:4:"port";i:0;s:5:"query";a:0:{}}s:4:"home";b:1;}i:1;a:3:{s:3:"url";s:26:"http://www.spikebook.co/wp";s:4:"prep";a:4:{s:4:"host";s:16:"www.spikebook.co";s:4:"path";s:3:"/wp";s:4:"port";i:0;s:5:"query";a:0:{}}s:4:"home";b:0;}}s:9:"all_pages";s:0:"";s:9:"all_posts";s:0:"";s:9:"site_home";s:0:"";s:7:"current";s:0:"";s:8:"ajax_all";s:0:"";s:5:"query";a:0:{}s:8:"remember";a:1:{s:5:"query";a:0:{}}s:8:"override";a:1:{s:5:"query";a:0:{}}s:13:"query_present";b:0;s:3:"url";a:0:{}s:10:"url_prefix";a:0:{}s:12:"url_asterisk";a:0:{}}', 'yes'),
(1032, 'theme_mods_nictitate', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1427214186;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:18:"orphaned_widgets_1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes'),
(1033, 'theme_mods_twentyfifteen', 'a:6:{i:0;b:0;s:18:"nav_menu_locations";a:1:{s:7:"primary";i:2;}s:16:"background_color";s:6:"f1f1f1";s:12:"color_scheme";s:7:"default";s:17:"sidebar_textcolor";s:7:"#333333";s:23:"header_background_color";s:7:"#ffffff";}', 'yes'),
(1121, '_site_transient_timeout_browser_35a84489a4e5fe0449c08e7bc7ac2fa2', '1428431896', 'yes'),
(1122, '_site_transient_browser_35a84489a4e5fe0449c08e7bc7ac2fa2', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"41.0.2272.89";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(1154, '_site_transient_timeout_browser_893625ca7bb0546d998053067db45664', '1428449314', 'yes'),
(1155, '_site_transient_browser_893625ca7bb0546d998053067db45664', 'a:9:{s:8:"platform";s:9:"Macintosh";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"41.0.2272.104";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(1269, 'theme_my_login', 'a:4:{s:10:"enable_css";b:1;s:11:"email_login";b:1;s:14:"active_modules";a:3:{i:0;s:41:"custom-redirection/custom-redirection.php";i:1;s:39:"custom-user-links/custom-user-links.php";i:2;s:35:"themed-profiles/themed-profiles.php";}s:7:"version";s:6:"6.3.11";}', 'yes'),
(1270, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes'),
(1307, 'theme_my_login_redirection', 'a:5:{s:13:"administrator";a:4:{s:10:"login_type";s:7:"default";s:9:"login_url";s:0:"";s:11:"logout_type";s:7:"default";s:10:"logout_url";s:0:"";}s:6:"editor";a:4:{s:10:"login_type";s:7:"default";s:9:"login_url";s:0:"";s:11:"logout_type";s:7:"default";s:10:"logout_url";s:0:"";}s:6:"author";a:4:{s:10:"login_type";s:7:"default";s:9:"login_url";s:0:"";s:11:"logout_type";s:7:"default";s:10:"logout_url";s:0:"";}s:11:"contributor";a:4:{s:10:"login_type";s:7:"default";s:9:"login_url";s:0:"";s:11:"logout_type";s:7:"default";s:10:"logout_url";s:0:"";}s:10:"subscriber";a:4:{s:10:"login_type";s:7:"default";s:9:"login_url";s:0:"";s:11:"logout_type";s:7:"default";s:10:"logout_url";s:0:"";}}', 'yes'),
(1308, 'theme_my_login_user_links', 'a:5:{s:13:"administrator";a:2:{i:0;a:2:{s:5:"title";s:9:"Dashboard";s:3:"url";s:32:"http://spikebook.co/wp/wp-admin/";}i:1;a:2:{s:5:"title";s:7:"Profile";s:3:"url";s:43:"http://spikebook.co/wp/wp-admin/profile.php";}}s:6:"editor";a:2:{i:0;a:2:{s:5:"title";s:9:"Dashboard";s:3:"url";s:32:"http://spikebook.co/wp/wp-admin/";}i:1;a:2:{s:5:"title";s:7:"Profile";s:3:"url";s:43:"http://spikebook.co/wp/wp-admin/profile.php";}}s:6:"author";a:2:{i:0;a:2:{s:5:"title";s:9:"Dashboard";s:3:"url";s:32:"http://spikebook.co/wp/wp-admin/";}i:1;a:2:{s:5:"title";s:7:"Profile";s:3:"url";s:43:"http://spikebook.co/wp/wp-admin/profile.php";}}s:11:"contributor";a:2:{i:0;a:2:{s:5:"title";s:9:"Dashboard";s:3:"url";s:32:"http://spikebook.co/wp/wp-admin/";}i:1;a:2:{s:5:"title";s:7:"Profile";s:3:"url";s:43:"http://spikebook.co/wp/wp-admin/profile.php";}}s:10:"subscriber";a:2:{i:0;a:2:{s:5:"title";s:9:"Dashboard";s:3:"url";s:31:"http://spikebook.co/wp/wp-admin";}i:1;a:2:{s:5:"title";s:7:"Profile";s:3:"url";s:43:"http://spikebook.co/wp/wp-admin/profile.php";}}}', 'yes'),
(1447, 'pageTheme_disp_options', 's:54:"a:2:{s:9:"disppages";s:1:"1";s:9:"dispposts";s:1:"1";}";', 'yes'),
(1448, 'pageTheme_options', 's:78:"a:1:{i:0;a:3:{s:2:"id";i:97;s:3:"url";s:6:"harika";s:5:"theme";s:6:"intima";}}";', 'yes'),
(1462, '_site_transient_timeout_browser_a283ade1c8175664f3a96dd496da56fb', '1429283892', 'yes'),
(1463, '_site_transient_browser_a283ade1c8175664f3a96dd496da56fb', 'a:9:{s:8:"platform";s:9:"Macintosh";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"41.0.2272.118";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(1568, '_site_transient_timeout_browser_f67d58475348e951b08420a7a5d16f9c', '1429812281', 'yes'),
(1569, '_site_transient_browser_f67d58475348e951b08420a7a5d16f9c', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"41.0.2272.118";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(1592, 'theme_mods_matheson', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1429639297;s:4:"data";a:3:{s:19:"wp_inactive_widgets";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:7:"sidebar";a:0:{}s:18:"home-page-top-area";N;}}}', 'yes'),
(1598, '_transient_timeout_redux_tracking_cache', '1429827643', 'no'),
(1599, '_transient_redux_tracking_cache', '1', 'no'),
(1683, '_site_transient_timeout_browser_837ac6e56c8bf9987e4fbaa5079e156e', '1430181482', 'yes'),
(1684, '_site_transient_browser_837ac6e56c8bf9987e4fbaa5079e156e', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"42.0.2311.90";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(1689, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:4:{i:0;O:8:"stdClass":10:{s:8:"response";s:7:"upgrade";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.1.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.1.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.2.1-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.2.1-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.2.1";s:7:"version";s:5:"4.2.1";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:0:"";}i:1;O:8:"stdClass":12:{s:8:"response";s:10:"autoupdate";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.1.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.1.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.2.1-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.2.1-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.2.1";s:7:"version";s:5:"4.2.1";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:0:"";s:13:"support_email";s:26:"updatehelp41@wordpress.org";s:9:"new_files";s:1:"1";}i:2;O:8:"stdClass":12:{s:8:"response";s:10:"autoupdate";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.1.4.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.1.4.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.1.4-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.1.4-new-bundled.zip";s:7:"partial";s:69:"https://downloads.wordpress.org/release/wordpress-4.1.4-partial-1.zip";s:8:"rollback";s:70:"https://downloads.wordpress.org/release/wordpress-4.1.4-rollback-1.zip";}s:7:"current";s:5:"4.1.4";s:7:"version";s:5:"4.1.4";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:5:"4.1.1";s:13:"support_email";s:26:"updatehelp41@wordpress.org";s:9:"new_files";s:0:"";}i:3;O:8:"stdClass":10:{s:8:"response";s:7:"upgrade";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.1.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.1.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.2.1-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.2.1-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:0:"";s:7:"version";s:0:"";s:11:"php_version";s:3:"4.3";s:13:"mysql_version";s:5:"4.1.2";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1430241161;s:15:"version_checked";s:5:"4.1.1";s:12:"translations";a:0:{}}', 'yes'),
(1720, '_site_transient_timeout_browser_811b7a5c20eaa701bea768c827fe1a86', '1430249084', 'yes'),
(1721, '_site_transient_browser_811b7a5c20eaa701bea768c827fe1a86', 'a:9:{s:8:"platform";s:9:"Macintosh";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"39.0.2171.95";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(1730, '_site_transient_timeout_browser_fbedef9fcc64417bb338e7f27c0d9ed0', '1430251312', 'yes'),
(1731, '_site_transient_browser_fbedef9fcc64417bb338e7f27c0d9ed0', 'a:9:{s:8:"platform";s:9:"Macintosh";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"42.0.2311.90";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(1771, '_site_transient_timeout_available_translations', '1429768402', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1772, '_site_transient_available_translations', 'a:55:{s:2:"ar";a:8:{s:8:"language";s:2:"ar";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-04-01 13:21:43";s:12:"english_name";s:6:"Arabic";s:11:"native_name";s:14:"العربية";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.1/ar.zip";s:3:"iso";a:2:{i:1;s:2:"ar";i:2;s:3:"ara";}s:7:"strings";a:1:{s:8:"continue";s:16:"المتابعة";}}s:2:"az";a:8:{s:8:"language";s:2:"az";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:15:41";s:12:"english_name";s:11:"Azerbaijani";s:11:"native_name";s:16:"Azərbaycan dili";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.1/az.zip";s:3:"iso";a:2:{i:1;s:2:"az";i:2;s:3:"aze";}s:7:"strings";a:1:{s:8:"continue";s:5:"Davam";}}s:5:"bg_BG";a:8:{s:8:"language";s:5:"bg_BG";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:19:26";s:12:"english_name";s:9:"Bulgarian";s:11:"native_name";s:18:"Български";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/bg_BG.zip";s:3:"iso";a:2:{i:1;s:2:"bg";i:2;s:3:"bul";}s:7:"strings";a:1:{s:8:"continue";s:22:"Продължение";}}s:5:"bs_BA";a:8:{s:8:"language";s:5:"bs_BA";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:22:49";s:12:"english_name";s:7:"Bosnian";s:11:"native_name";s:8:"Bosanski";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/bs_BA.zip";s:3:"iso";a:2:{i:1;s:2:"bs";i:2;s:3:"bos";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:2:"ca";a:8:{s:8:"language";s:2:"ca";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:24:48";s:12:"english_name";s:7:"Catalan";s:11:"native_name";s:7:"Català";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.1/ca.zip";s:3:"iso";a:2:{i:1;s:2:"ca";i:2;s:3:"cat";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"cy";a:8:{s:8:"language";s:2:"cy";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:30:22";s:12:"english_name";s:5:"Welsh";s:11:"native_name";s:7:"Cymraeg";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.1/cy.zip";s:3:"iso";a:2:{i:1;s:2:"cy";i:2;s:3:"cym";}s:7:"strings";a:1:{s:8:"continue";s:6:"Parhau";}}s:5:"da_DK";a:8:{s:8:"language";s:5:"da_DK";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:32:23";s:12:"english_name";s:6:"Danish";s:11:"native_name";s:5:"Dansk";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/da_DK.zip";s:3:"iso";a:2:{i:1;s:2:"da";i:2;s:3:"dan";}s:7:"strings";a:1:{s:8:"continue";s:12:"Forts&#230;t";}}s:5:"de_DE";a:8:{s:8:"language";s:5:"de_DE";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:34:24";s:12:"english_name";s:6:"German";s:11:"native_name";s:7:"Deutsch";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/de_DE.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:5:"de_CH";a:8:{s:8:"language";s:5:"de_CH";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:38:25";s:12:"english_name";s:20:"German (Switzerland)";s:11:"native_name";s:17:"Deutsch (Schweiz)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/de_CH.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:2:"el";a:8:{s:8:"language";s:2:"el";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-04-15 12:48:44";s:12:"english_name";s:5:"Greek";s:11:"native_name";s:16:"Ελληνικά";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.1/el.zip";s:3:"iso";a:2:{i:1;s:2:"el";i:2;s:3:"ell";}s:7:"strings";a:1:{s:8:"continue";s:16:"Συνέχεια";}}s:5:"en_CA";a:8:{s:8:"language";s:5:"en_CA";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:44:26";s:12:"english_name";s:16:"English (Canada)";s:11:"native_name";s:16:"English (Canada)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/en_CA.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_GB";a:8:{s:8:"language";s:5:"en_GB";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:46:15";s:12:"english_name";s:12:"English (UK)";s:11:"native_name";s:12:"English (UK)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/en_GB.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_AU";a:8:{s:8:"language";s:5:"en_AU";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:42:35";s:12:"english_name";s:19:"English (Australia)";s:11:"native_name";s:19:"English (Australia)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/en_AU.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:2:"eo";a:8:{s:8:"language";s:2:"eo";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:48:12";s:12:"english_name";s:9:"Esperanto";s:11:"native_name";s:9:"Esperanto";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.1/eo.zip";s:3:"iso";a:2:{i:1;s:2:"eo";i:2;s:3:"epo";}s:7:"strings";a:1:{s:8:"continue";s:8:"Daŭrigi";}}s:5:"es_MX";a:8:{s:8:"language";s:5:"es_MX";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:54:32";s:12:"english_name";s:16:"Spanish (Mexico)";s:11:"native_name";s:19:"Español de México";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/es_MX.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_PE";a:8:{s:8:"language";s:5:"es_PE";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:56:31";s:12:"english_name";s:14:"Spanish (Peru)";s:11:"native_name";s:17:"Español de Perú";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/es_PE.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_ES";a:8:{s:8:"language";s:5:"es_ES";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 14:50:12";s:12:"english_name";s:15:"Spanish (Spain)";s:11:"native_name";s:8:"Español";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/es_ES.zip";s:3:"iso";a:1:{i:1;s:2:"es";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_CL";a:8:{s:8:"language";s:5:"es_CL";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-04 19:47:01";s:12:"english_name";s:15:"Spanish (Chile)";s:11:"native_name";s:17:"Español de Chile";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/es_CL.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:2:"eu";a:8:{s:8:"language";s:2:"eu";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-27 08:55:29";s:12:"english_name";s:6:"Basque";s:11:"native_name";s:7:"Euskara";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.1/eu.zip";s:3:"iso";a:2:{i:1;s:2:"eu";i:2;s:3:"eus";}s:7:"strings";a:1:{s:8:"continue";s:8:"Jarraitu";}}s:5:"fa_IR";a:8:{s:8:"language";s:5:"fa_IR";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 15:03:17";s:12:"english_name";s:7:"Persian";s:11:"native_name";s:10:"فارسی";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/fa_IR.zip";s:3:"iso";a:2:{i:1;s:2:"fa";i:2;s:3:"fas";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:2:"fi";a:8:{s:8:"language";s:2:"fi";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-04-21 06:21:33";s:12:"english_name";s:7:"Finnish";s:11:"native_name";s:5:"Suomi";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.1/fi.zip";s:3:"iso";a:2:{i:1;s:2:"fi";i:2;s:3:"fin";}s:7:"strings";a:1:{s:8:"continue";s:5:"Jatka";}}s:5:"fr_FR";a:8:{s:8:"language";s:5:"fr_FR";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 15:08:29";s:12:"english_name";s:15:"French (France)";s:11:"native_name";s:9:"Français";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/fr_FR.zip";s:3:"iso";a:1:{i:1;s:2:"fr";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:2:"gd";a:8:{s:8:"language";s:2:"gd";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-05 17:37:43";s:12:"english_name";s:15:"Scottish Gaelic";s:11:"native_name";s:9:"Gàidhlig";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.0/gd.zip";s:3:"iso";a:3:{i:1;s:2:"gd";i:2;s:3:"gla";i:3;s:3:"gla";}s:7:"strings";a:1:{s:8:"continue";s:15:"Lean air adhart";}}s:5:"gl_ES";a:8:{s:8:"language";s:5:"gl_ES";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 15:14:57";s:12:"english_name";s:8:"Galician";s:11:"native_name";s:6:"Galego";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/gl_ES.zip";s:3:"iso";a:2:{i:1;s:2:"gl";i:2;s:3:"glg";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:3:"haz";a:8:{s:8:"language";s:3:"haz";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 15:20:27";s:12:"english_name";s:8:"Hazaragi";s:11:"native_name";s:15:"هزاره گی";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1.1/haz.zip";s:3:"iso";a:2:{i:1;s:3:"haz";i:2;s:3:"haz";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:5:"he_IL";a:8:{s:8:"language";s:5:"he_IL";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-04-08 22:28:26";s:12:"english_name";s:6:"Hebrew";s:11:"native_name";s:16:"עִבְרִית";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/he_IL.zip";s:3:"iso";a:1:{i:1;s:2:"he";}s:7:"strings";a:1:{s:8:"continue";s:12:"להמשיך";}}s:2:"hr";a:8:{s:8:"language";s:2:"hr";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 15:25:25";s:12:"english_name";s:8:"Croatian";s:11:"native_name";s:8:"Hrvatski";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.1/hr.zip";s:3:"iso";a:2:{i:1;s:2:"hr";i:2;s:3:"hrv";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:5:"hu_HU";a:8:{s:8:"language";s:5:"hu_HU";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 15:27:28";s:12:"english_name";s:9:"Hungarian";s:11:"native_name";s:6:"Magyar";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/hu_HU.zip";s:3:"iso";a:2:{i:1;s:2:"hu";i:2;s:3:"hun";}s:7:"strings";a:1:{s:8:"continue";s:7:"Tovább";}}s:5:"id_ID";a:8:{s:8:"language";s:5:"id_ID";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 15:29:34";s:12:"english_name";s:10:"Indonesian";s:11:"native_name";s:16:"Bahasa Indonesia";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/id_ID.zip";s:3:"iso";a:2:{i:1;s:2:"id";i:2;s:3:"ind";}s:7:"strings";a:1:{s:8:"continue";s:9:"Lanjutkan";}}s:5:"is_IS";a:8:{s:8:"language";s:5:"is_IS";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-15 22:23:37";s:12:"english_name";s:9:"Icelandic";s:11:"native_name";s:9:"Íslenska";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/is_IS.zip";s:3:"iso";a:2:{i:1;s:2:"is";i:2;s:3:"isl";}s:7:"strings";a:1:{s:8:"continue";s:6:"Áfram";}}s:5:"it_IT";a:8:{s:8:"language";s:5:"it_IT";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 15:33:39";s:12:"english_name";s:7:"Italian";s:11:"native_name";s:8:"Italiano";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/it_IT.zip";s:3:"iso";a:2:{i:1;s:2:"it";i:2;s:3:"ita";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"ja";a:8:{s:8:"language";s:2:"ja";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 15:35:42";s:12:"english_name";s:8:"Japanese";s:11:"native_name";s:9:"日本語";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.1/ja.zip";s:3:"iso";a:1:{i:1;s:2:"ja";}s:7:"strings";a:1:{s:8:"continue";s:9:"続ける";}}s:5:"ko_KR";a:8:{s:8:"language";s:5:"ko_KR";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-04-20 11:48:55";s:12:"english_name";s:6:"Korean";s:11:"native_name";s:9:"한국어";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/ko_KR.zip";s:3:"iso";a:2:{i:1;s:2:"ko";i:2;s:3:"kor";}s:7:"strings";a:1:{s:8:"continue";s:6:"계속";}}s:5:"lt_LT";a:8:{s:8:"language";s:5:"lt_LT";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 15:47:56";s:12:"english_name";s:10:"Lithuanian";s:11:"native_name";s:15:"Lietuvių kalba";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/lt_LT.zip";s:3:"iso";a:2:{i:1;s:2:"lt";i:2;s:3:"lit";}s:7:"strings";a:1:{s:8:"continue";s:6:"Tęsti";}}s:5:"my_MM";a:8:{s:8:"language";s:5:"my_MM";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 15:57:42";s:12:"english_name";s:7:"Burmese";s:11:"native_name";s:15:"ဗမာစာ";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/my_MM.zip";s:3:"iso";a:2:{i:1;s:2:"my";i:2;s:3:"mya";}s:7:"strings";a:1:{s:8:"continue";s:54:"ဆက်လက်လုပ်ေဆာင်ပါ။";}}s:5:"nb_NO";a:8:{s:8:"language";s:5:"nb_NO";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 15:59:41";s:12:"english_name";s:19:"Norwegian (Bokmål)";s:11:"native_name";s:13:"Norsk bokmål";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/nb_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nb";i:2;s:3:"nob";}s:7:"strings";a:1:{s:8:"continue";s:8:"Fortsett";}}s:5:"nl_NL";a:8:{s:8:"language";s:5:"nl_NL";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 16:02:30";s:12:"english_name";s:5:"Dutch";s:11:"native_name";s:10:"Nederlands";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/nl_NL.zip";s:3:"iso";a:2:{i:1;s:2:"nl";i:2;s:3:"nld";}s:7:"strings";a:1:{s:8:"continue";s:8:"Doorgaan";}}s:5:"nn_NO";a:8:{s:8:"language";s:5:"nn_NO";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-04-16 06:38:46";s:12:"english_name";s:19:"Norwegian (Nynorsk)";s:11:"native_name";s:13:"Norsk nynorsk";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/nn_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nn";i:2;s:3:"nno";}s:7:"strings";a:1:{s:8:"continue";s:9:"Hald fram";}}s:5:"pl_PL";a:8:{s:8:"language";s:5:"pl_PL";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 16:07:08";s:12:"english_name";s:6:"Polish";s:11:"native_name";s:6:"Polski";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/pl_PL.zip";s:3:"iso";a:2:{i:1;s:2:"pl";i:2;s:3:"pol";}s:7:"strings";a:1:{s:8:"continue";s:9:"Kontynuuj";}}s:2:"ps";a:8:{s:8:"language";s:2:"ps";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-29 22:19:48";s:12:"english_name";s:6:"Pashto";s:11:"native_name";s:8:"پښتو";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.1/ps.zip";s:3:"iso";a:1:{i:1;s:2:"ps";}s:7:"strings";a:1:{s:8:"continue";s:8:"دوام";}}s:5:"pt_PT";a:8:{s:8:"language";s:5:"pt_PT";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 16:11:07";s:12:"english_name";s:21:"Portuguese (Portugal)";s:11:"native_name";s:10:"Português";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/pt_PT.zip";s:3:"iso";a:1:{i:1;s:2:"pt";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"pt_BR";a:8:{s:8:"language";s:5:"pt_BR";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 16:14:41";s:12:"english_name";s:19:"Portuguese (Brazil)";s:11:"native_name";s:20:"Português do Brasil";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/pt_BR.zip";s:3:"iso";a:2:{i:1;s:2:"pt";i:2;s:3:"por";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"ro_RO";a:8:{s:8:"language";s:5:"ro_RO";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-27 14:48:56";s:12:"english_name";s:8:"Romanian";s:11:"native_name";s:8:"Română";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/ro_RO.zip";s:3:"iso";a:2:{i:1;s:2:"ro";i:2;s:3:"ron";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuă";}}s:5:"ru_RU";a:8:{s:8:"language";s:5:"ru_RU";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 16:19:48";s:12:"english_name";s:7:"Russian";s:11:"native_name";s:14:"Русский";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/ru_RU.zip";s:3:"iso";a:2:{i:1;s:2:"ru";i:2;s:3:"rus";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продолжить";}}s:5:"sk_SK";a:8:{s:8:"language";s:5:"sk_SK";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 16:23:44";s:12:"english_name";s:6:"Slovak";s:11:"native_name";s:11:"Slovenčina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/sk_SK.zip";s:3:"iso";a:2:{i:1;s:2:"sk";i:2;s:3:"slk";}s:7:"strings";a:1:{s:8:"continue";s:12:"Pokračovať";}}s:5:"sl_SI";a:8:{s:8:"language";s:5:"sl_SI";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 16:25:46";s:12:"english_name";s:9:"Slovenian";s:11:"native_name";s:13:"Slovenščina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/sl_SI.zip";s:3:"iso";a:2:{i:1;s:2:"sl";i:2;s:3:"slv";}s:7:"strings";a:1:{s:8:"continue";s:10:"Nadaljujte";}}s:2:"sq";a:8:{s:8:"language";s:2:"sq";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-04-20 08:33:09";s:12:"english_name";s:8:"Albanian";s:11:"native_name";s:5:"Shqip";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.1/sq.zip";s:3:"iso";a:2:{i:1;s:2:"sq";i:2;s:3:"sqi";}s:7:"strings";a:1:{s:8:"continue";s:6:"Vazhdo";}}s:5:"sr_RS";a:8:{s:8:"language";s:5:"sr_RS";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 16:30:35";s:12:"english_name";s:7:"Serbian";s:11:"native_name";s:23:"Српски језик";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/sr_RS.zip";s:3:"iso";a:2:{i:1;s:2:"sr";i:2;s:3:"srp";}s:7:"strings";a:1:{s:8:"continue";s:14:"Настави";}}s:5:"sv_SE";a:8:{s:8:"language";s:5:"sv_SE";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 16:33:33";s:12:"english_name";s:7:"Swedish";s:11:"native_name";s:7:"Svenska";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/sv_SE.zip";s:3:"iso";a:2:{i:1;s:2:"sv";i:2;s:3:"swe";}s:7:"strings";a:1:{s:8:"continue";s:9:"Fortsätt";}}s:2:"th";a:8:{s:8:"language";s:2:"th";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-27 00:00:51";s:12:"english_name";s:4:"Thai";s:11:"native_name";s:9:"ไทย";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.1/th.zip";s:3:"iso";a:2:{i:1;s:2:"th";i:2;s:3:"tha";}s:7:"strings";a:1:{s:8:"continue";s:15:"ต่อไป";}}s:5:"tr_TR";a:8:{s:8:"language";s:5:"tr_TR";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 16:43:10";s:12:"english_name";s:7:"Turkish";s:11:"native_name";s:8:"Türkçe";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/tr_TR.zip";s:3:"iso";a:2:{i:1;s:2:"tr";i:2;s:3:"tur";}s:7:"strings";a:1:{s:8:"continue";s:5:"Devam";}}s:5:"ug_CN";a:8:{s:8:"language";s:5:"ug_CN";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 16:45:38";s:12:"english_name";s:6:"Uighur";s:11:"native_name";s:9:"Uyƣurqə";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/ug_CN.zip";s:3:"iso";a:2:{i:1;s:2:"ug";i:2;s:3:"uig";}s:7:"strings";a:1:{s:8:"continue";s:26:"داۋاملاشتۇرۇش";}}s:2:"uk";a:8:{s:8:"language";s:2:"uk";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-04-10 12:55:55";s:12:"english_name";s:9:"Ukrainian";s:11:"native_name";s:20:"Українська";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.1.1/uk.zip";s:3:"iso";a:2:{i:1;s:2:"uk";i:2;s:3:"ukr";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продовжити";}}s:5:"zh_TW";a:8:{s:8:"language";s:5:"zh_TW";s:7:"version";s:5:"4.1.1";s:7:"updated";s:19:"2015-03-26 16:55:15";s:12:"english_name";s:16:"Chinese (Taiwan)";s:11:"native_name";s:12:"繁體中文";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.1.1/zh_TW.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"繼續";}}s:5:"zh_CN";a:8:{s:8:"language";s:5:"zh_CN";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2014-12-26 02:21:02";s:12:"english_name";s:15:"Chinese (China)";s:11:"native_name";s:12:"简体中文";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/zh_CN.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"继续";}}}', 'yes'),
(1776, 'user_role_editor', 'a:6:{s:11:"ure_version";s:6:"4.18.3";s:17:"ure_caps_readable";i:0;s:24:"ure_show_deprecated_caps";i:0;s:19:"ure_hide_pro_banner";i:0;s:15:"show_admin_role";i:0;s:14:"edit_user_caps";s:1:"1";}', 'yes'),
(1777, 'wp_backup_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:69:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:14:"ure_edit_roles";b:1;s:16:"ure_create_roles";b:1;s:16:"ure_delete_roles";b:1;s:23:"ure_create_capabilities";b:1;s:23:"ure_delete_capabilities";b:1;s:18:"ure_manage_options";b:1;s:15:"ure_reset_roles";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'no'),
(1778, '_site_transient_timeout_ure_caps_readable', '1429758515', 'yes'),
(1779, '_site_transient_ure_caps_readable', '0', 'yes'),
(1780, '_site_transient_timeout_ure_show_deprecated_caps', '1429758503', 'yes'),
(1781, '_site_transient_ure_show_deprecated_caps', '0', 'yes'),
(1786, '_site_transient_timeout_wporg_theme_feature_list', '1429770365', 'yes'),
(1787, '_site_transient_wporg_theme_feature_list', 'a:4:{s:6:"Colors";a:15:{i:0;s:5:"black";i:1;s:4:"blue";i:2;s:5:"brown";i:3;s:4:"gray";i:4;s:5:"green";i:5;s:6:"orange";i:6;s:4:"pink";i:7;s:6:"purple";i:8;s:3:"red";i:9;s:6:"silver";i:10;s:3:"tan";i:11;s:5:"white";i:12;s:6:"yellow";i:13;s:4:"dark";i:14;s:5:"light";}s:6:"Layout";a:9:{i:0;s:12:"fixed-layout";i:1;s:12:"fluid-layout";i:2;s:17:"responsive-layout";i:3;s:10:"one-column";i:4;s:11:"two-columns";i:5;s:13:"three-columns";i:6;s:12:"four-columns";i:7;s:12:"left-sidebar";i:8;s:13:"right-sidebar";}s:8:"Features";a:20:{i:0;s:19:"accessibility-ready";i:1;s:8:"blavatar";i:2;s:10:"buddypress";i:3;s:17:"custom-background";i:4;s:13:"custom-colors";i:5;s:13:"custom-header";i:6;s:11:"custom-menu";i:7;s:12:"editor-style";i:8;s:21:"featured-image-header";i:9;s:15:"featured-images";i:10;s:15:"flexible-header";i:11;s:20:"front-page-post-form";i:12;s:19:"full-width-template";i:13;s:12:"microformats";i:14;s:12:"post-formats";i:15;s:20:"rtl-language-support";i:16;s:11:"sticky-post";i:17;s:13:"theme-options";i:18;s:17:"threaded-comments";i:19;s:17:"translation-ready";}s:7:"Subject";a:3:{i:0;s:7:"holiday";i:1;s:13:"photoblogging";i:2;s:8:"seasonal";}}', 'yes'),
(1789, 'theme_mods_zerif-lite', 'a:3:{i:0;b:0;s:18:"nav_menu_locations";a:1:{s:7:"primary";i:2;}s:16:"sidebars_widgets";a:2:{s:4:"time";i:1429759832;s:4:"data";a:6:{s:19:"wp_inactive_widgets";a:1:{i:0;s:6:"meta-2";}s:9:"sidebar-1";a:5:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";}s:16:"sidebar-ourfocus";N;s:20:"sidebar-testimonials";N;s:15:"sidebar-aboutus";N;s:15:"sidebar-ourteam";N;}}}', 'yes'),
(1801, 'bp_disable_blogforum_comments', '1', 'yes'),
(1802, '_transient_is_multi_author', '0', 'yes'),
(1803, '_transient_twentyfifteen_categories', '1', 'yes'),
(1832, '_transient_bp_active_member_count', '4', 'yes'),
(1890, '_transient_timeout_plugin_slugs', '1430327619', 'no'),
(1891, '_transient_plugin_slugs', 'a:11:{i:0;s:19:"akismet/akismet.php";i:1;s:24:"buddypress/bp-loader.php";i:2;s:49:"cimy-user-extra-fields/cimy_user_extra_fields.php";i:3;s:36:"contact-form-7/wp-contact-form-7.php";i:4;s:9:"hello.php";i:5;s:53:"jonradio-multiple-themes/jonradio-multiple-themes.php";i:6;s:49:"kopa-nictitate-toolkit/kopa-nictitate-toolkit.php";i:7;s:24:"page-theme/pageTheme.php";i:8;s:33:"theme-my-login/theme-my-login.php";i:9;s:37:"user-role-editor/user-role-editor.php";i:10;s:31:"wp-migrate-db/wp-migrate-db.php";}', 'no'),
(1894, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1430241162;s:7:"checked";a:6:{s:6:"intima";s:3:"1.1";s:9:"nictitate";s:5:"1.1.4";s:13:"twentyfifteen";s:3:"1.1";s:14:"twentyfourteen";s:3:"1.4";s:14:"twentythirteen";s:3:"1.5";s:10:"zerif-lite";s:5:"1.7.3";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'yes'),
(1900, 'rewrite_rules', 'a:73:{s:56:"archives/category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:51:"archives/category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:44:"archives/category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:26:"archives/category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:53:"archives/tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:48:"archives/tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:41:"archives/tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:23:"archives/tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:54:"archives/type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:49:"archives/type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:42:"archives/type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:24:"archives/type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:64:"archives/bp_member_type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:53:"index.php?bp_member_type=$matches[1]&feed=$matches[2]";s:59:"archives/bp_member_type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:53:"index.php?bp_member_type=$matches[1]&feed=$matches[2]";s:52:"archives/bp_member_type/([^/]+)/page/?([0-9]{1,})/?$";s:54:"index.php?bp_member_type=$matches[1]&paged=$matches[2]";s:34:"archives/bp_member_type/([^/]+)/?$";s:36:"index.php?bp_member_type=$matches[1]";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:27:"comment-page-([0-9]{1,})/?$";s:39:"index.php?&page_id=36&cpage=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:56:"archives/author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:51:"archives/author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:44:"archives/author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:26:"archives/author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:83:"archives/date/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:78:"archives/date/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:71:"archives/date/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:53:"archives/date/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:70:"archives/date/([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:65:"archives/date/([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:58:"archives/date/([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:40:"archives/date/([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:57:"archives/date/([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:52:"archives/date/([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:45:"archives/date/([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:27:"archives/date/([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:37:"archives/[0-9]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:47:"archives/[0-9]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:67:"archives/[0-9]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"archives/[0-9]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"archives/[0-9]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:30:"archives/([0-9]+)/trackback/?$";s:28:"index.php?p=$matches[1]&tb=1";s:50:"archives/([0-9]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?p=$matches[1]&feed=$matches[2]";s:45:"archives/([0-9]+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?p=$matches[1]&feed=$matches[2]";s:38:"archives/([0-9]+)/page/?([0-9]{1,})/?$";s:41:"index.php?p=$matches[1]&paged=$matches[2]";s:45:"archives/([0-9]+)/comment-page-([0-9]{1,})/?$";s:41:"index.php?p=$matches[1]&cpage=$matches[2]";s:30:"archives/([0-9]+)(/[0-9]+)?/?$";s:40:"index.php?p=$matches[1]&page=$matches[2]";s:26:"archives/[0-9]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:36:"archives/[0-9]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:56:"archives/[0-9]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:51:"archives/[0-9]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:51:"archives/[0-9]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";}', 'yes'),
(1907, '_site_transient_timeout_theme_roots', '1430242731', 'yes'),
(1908, '_site_transient_theme_roots', 'a:7:{s:8:"__MACOSX";s:7:"/themes";s:6:"intima";s:7:"/themes";s:9:"nictitate";s:7:"/themes";s:13:"twentyfifteen";s:7:"/themes";s:14:"twentyfourteen";s:7:"/themes";s:14:"twentythirteen";s:7:"/themes";s:10:"zerif-lite";s:7:"/themes";}', 'yes'),
(1909, '_transient_timeout_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1430284281', 'no'),
(1910, '_transient_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:49:"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"WordPress News";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:26:"https://wordpress.org/news";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:14:"WordPress News";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 27 Apr 2015 18:34:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:39:"http://wordpress.org/?v=4.3-alpha-32315";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:48:"\n		\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:32:"WordPress 4.2.1 Security Release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/news/2015/04/wordpress-4-2-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/news/2015/04/wordpress-4-2-1/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 27 Apr 2015 18:34:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:3:"4.2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3706";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:366:"WordPress 4.2.1 is now available. This is a critical security release for all previous versions and we strongly encourage you to update your sites immediately. A few hours ago, the WordPress team was made aware of a cross-site scripting vulnerability, which could enable commenters to compromise a site. The vulnerability was discovered by Jouko Pynnönen. [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Gary Pendergast";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1010:"<p>WordPress 4.2.1 is now available. This is a <strong>critical security release</strong> for all previous versions and we strongly encourage you to update your sites immediately.</p>\n<p>A few hours ago, the WordPress team was made aware of a cross-site scripting vulnerability, which could enable commenters to compromise a site. The vulnerability was discovered by <a href="http://klikki.fi/">Jouko Pynnönen</a>.</p>\n<p>WordPress 4.2.1 has begun to roll out as an automatic background update, for sites that <a href="https://wordpress.org/plugins/background-update-tester/">support</a> those.</p>\n<p>For more information, see the <a href="https://codex.wordpress.org/Version_4.2.1">release notes</a> or consult the <a href="https://core.trac.wordpress.org/log/branches/4.2?rev=32311&amp;stop_rev=32300">list of changes</a>.</p>\n<p><a href="https://wordpress.org/download/">Download WordPress 4.2.1</a> or venture over to <strong>Dashboard → Updates</strong> and simply click &#8220;Update Now&#8221;.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2015/04/wordpress-4-2-1/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"WordPress 4.2 “Powell”";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:42:"https://wordpress.org/news/2015/04/powell/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/news/2015/04/powell/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 23 Apr 2015 18:35:29 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:3:"4.2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3642";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:343:"Version 4.2 of WordPress, named &#8220;Powell&#8221; in honor of jazz pianist Bud Powell, is available for download or update in your WordPress dashboard. New features in 4.2 help you communicate and share, globally. An easier way to share content Clip it, edit it, publish it. Get familiar with the new and improved Press This. From [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:29252:"<p>Version 4.2 of WordPress, named &#8220;Powell&#8221; in honor of jazz pianist <a href="https://en.wikipedia.org/wiki/Bud_Powell">Bud Powell</a>, is available for <a href="https://wordpress.org/download/">download</a> or update in your WordPress dashboard. New features in 4.2 help you communicate and share, globally.</p>\n<div id="v-e9kH4FzP-1" class="video-player"><embed id="v-e9kH4FzP-1-video" src="https://v0.wordpress.com/player.swf?v=1.04&amp;guid=e9kH4FzP&amp;isDynamicSeeking=true" type="application/x-shockwave-flash" width="692" height="388" title="Introducing WordPress 4.2 &quot;Powell&quot;" wmode="direct" seamlesstabbing="true" allowfullscreen="true" allowscriptaccess="always" overstretch="true"></embed></div>\n<hr />\n<h2 style="text-align: center">An easier way to share content</h2>\n<p><img class="alignnone size-full wp-image-3677" src="https://wordpress.org/news/files/2015/04/4.2-press-this-2.jpg" alt="Press This" width="1000" height="832" />Clip it, edit it, publish it. Get familiar with the new and improved Press This. From the Tools menu, add Press This to your browser bookmark bar or your mobile device home screen. Once installed you can share your content with lightning speed. Sharing your favorite videos, images, and content has never been this fast or this easy.</p>\n<hr />\n<h2 style="text-align: center">Extended character support</h2>\n<p><img class="alignnone size-full wp-image-3676" src="https://wordpress.org/news/files/2015/04/4.2-characters.png" alt="Character support for emoji, special characters" width="1000" height="832" />Writing in WordPress, whatever your language, just got better. WordPress 4.2 supports a host of new characters out-of-the-box, including native Chinese, Japanese, and Korean characters, musical and mathematical symbols, and hieroglyphs.</p>\n<p>Don’t use any of those characters? You can still have fun — emoji are now available in WordPress! Get creative and decorate your content with <img src="https://s.w.org/images/core/emoji/72x72/1f499.png" alt="', 'no'),
(1911, '_transient_timeout_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1430284282', 'no'),
(1912, '_transient_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1430241082', 'no'),
(1913, '_transient_timeout_feed_d117b5738fbd35bd8c0391cda1f2b5d9', '1430284283', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1914, '_transient_feed_d117b5738fbd35bd8c0391cda1f2b5d9', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:61:"\n	\n	\n	\n	\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"WordPress Planet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:28:"http://planet.wordpress.org/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:2:"en";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:47:"WordPress Planet - http://planet.wordpress.org/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:50:{i:0;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Matt: Who is Steve Jobs?";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=45000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:39:"http://ma.tt/2015/04/who-is-steve-jobs/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3898:"<p><a href="http://www.amazon.com/dp/0385347405"><img class="alignright" src="http://i1.wp.com/ecx.images-amazon.com/images/I/51jePfRiSOL.jpg?resize=300%2C459" alt="" /></a>I checked out the new book <a href="http://www.amazon.com/dp/B00N6PCWY8/"><em>Becoming Steve Jobs</em> by Brent Schlender and Rick Tetzeli</a> because there had been some interesting excerpts published to the web, and apparently those closest to Steve didn&#8217;t like <a href="http://www.amazon.com/dp/B004W2UBYW/">the Walter Isaacson book</a>, with Jony Ive saying &#8220;My regard [for Isaacson’s book] couldn’t be any lower.&#8221;</p>\n<p>Along with about a million other people I bought and read the authorized biography, and didn&#8217;t think it portrayed Jobs in a way that made me think any less of him, but there must have been some things in there that someone who knew him closely felt were so off that as a group they decided to coordinate and speak with a new author to set the record straight, as Eddy Cue said of the new <em>Becoming</em> book, &#8220;Well done and first to get it right.&#8221; I will never know who Steve Jobs really was, but it is interesting to triangulate and learn from different takes, especially Isaacson&#8217;s biography that Jobs himself endorsed but might not have read and this new one promoted by his closest friends, colleagues, and family.</p>\n<p>As an independent third party who doesn&#8217;t know any of the characters involved personally, I must say that I felt like I got a much worse impression of Steve Jobs from <em>Becoming</em> than from the authorized biography. It was great to hear the direct voices and anecdotes of so many people close to him that haven&#8217;t spoken much publicly like his wife Laurene &#8212; he was a very private man and his friends respect that. But the parts where Schlender/Tetzeli try to balance things out by acknowledging some of the rougher parts of Steve&#8217;s public life, especially the recent ones around options backdating, anti-poaching agreements, book pricing, (all overblown in my opinion) or even when trying to show his negotiating acumen with suppliers, Disney, or music labels, they make Jobs look like an insensitive jerk, which seems to be the opposite of what everyone involved was intending.</p>\n<p>The direct quotes in the book could not be kinder, and it&#8217;s clear from both books that Jobs was incredibly warm, caring, and thoughtful to those closest to him, but <em>Becoming</em> tries so hard to emphasize that it makes the contrast of some of his public and private actions seem especially callous. The personal anecdotes from the author are the best part: one of the most interesting parts of the book is actually when Jobs calls Schlender to invite him for a walk, as one of the people he reached out to and wanted to speak to before he passed, and Schlender &#8212; not knowing the context &#8212; actually chastises him for cutting off his journalistic access and other trivia, and then blows off the meeting, to his lifelong regret.</p>\n<p>It&#8217;s tragic, and it&#8217;s very <em>human</em>, and that&#8217;s what makes for great stories. No one suggests that Steve Jobs was a saint, nor did he need to be. His legacy is already well-protected both in the incredible results while he was alive, and even more so in what the team he built has accomplished since his passing, both periods which actually amaze and inspire me. <em>Becoming Steve Jobs</em> tries harder and accomplishes less to honor the man. It is worth reading if, like me, you gobble up every book around the technology leaders of the past 40 years and want a different take on a familiar tune, but if you were only to read one book about Jobs, and get the most positive impression of the man and his genius, I&#8217;d recommend <a href="http://www.amazon.com/dp/B004W2UBYW/">Isaacson&#8217;s <em>Steve Jobs</em></a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 28 Apr 2015 16:44:35 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:87:"WPTavern: Poll: How Often Do You Read a WordPress Plugin’s Changelog Before Updating?";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=42906";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:92:"http://wptavern.com/poll-how-often-do-you-read-a-wordpress-plugins-changelog-before-updating";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:840:"<p>As <a href="http://wptavern.com/do-wordpress-org-themes-need-a-changelog">the debate</a> on whether or not <a href="https://wordpress.org/themes/">WordPress.org hosted themes</a> should have changelogs continues, one line of thought is that regular users don&#8217;t read them. As a long time user of WordPress, I always read a plugin&#8217;s changelog before updating.</p>\n<p>A <strong>good</strong> changelog tells me what bugs have been fixed, new features that have been added, and security issues that have been addressed. It also gives me a timeline of changes I can refer to for troubleshooting. Let us know how often you read a WordPress plugin&#8217;s changelog before updating by participating in the following poll.</p>\nNote: There is a poll embedded within this post, please visit the site to participate in this post''s poll.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 27 Apr 2015 20:16:34 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:73:"WPTavern: WordPress 4.2.1 Released to Patch Comment Exploit Vulnerability";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=42873";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:83:"http://wptavern.com/wordpress-4-2-1-released-to-patch-comment-exploit-vulnerability";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2486:"<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2014/04/security-release.jpg" rel="prettyphoto[42873]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2014/04/security-release.jpg?resize=1024%2C505" alt="photo credit: Will Montague - cc" class="size-full wp-image-20655" /></a>photo credit: <a href="http://www.flickr.com/photos/willmontague/3813295674/">Will Montague</a> &#8211; <a href="http://creativecommons.org/licenses/by-nc/2.0/">cc</a>\n<p>This morning we reported on an <a href="http://wptavern.com/zero-day-xss-vulnerability-in-wordpress-4-2-currently-being-patched" target="_blank">XSS vulnerability in WordPress 4.2</a>, 4.1.2, 4.1.1, and 3.9.3, which allows an attacker to compromise a site via its comments. The security team quickly patched the vulnerability and <a href="https://wordpress.org/news/2015/04/wordpress-4-2-1/" target="_blank">released 4.2.1</a> within hours of being notified.</p>\n<p>WordPress&#8217; official statement on the security issue:</p>\n<blockquote><p>The WordPress team was made aware of a XSS issue a few hours ago that we will release an update for shortly. It is a core issue, but the number of sites vulnerable is much smaller than you may think because the vast majority of WordPress-powered sites run Akismet, which blocks this attack. When the fix is tested and ready in the coming hours WordPress users will receive an auto-update and should be safe and protected even if they don’t use Akismet.</p></blockquote>\n<p>That auto-update is now being rolled out to sites where updates have not been disabled. If you are unsure of whether or not your site can perform automatic background updates, Gary Pendergast linked to the <a href="https://wordpress.org/plugins/background-update-tester/" target="_blank">Background Update Tester</a> plugin in the security release. This is a core-supported plugin that will check your site for background update compatibility and explain any issues.</p>\n<p>Since <a href="https://wordpress.org/plugins/akismet/" target="_blank">Akismet</a> is active on more than a million websites, the number of affected users that were not protected is much smaller than it might have been otherwise.</p>\n<p>WordPress 4.2.1 is a critical security release for a widely publicized vulnerability that you do not want to ignore. Users are advised to update immediately. The background update may already have hit your site. If not, you can update manually by navigating to Dashboard → Updates.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 27 Apr 2015 19:46:07 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Matt: Cell Phones &amp; Cancer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44995";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:40:"http://ma.tt/2015/04/cell-phones-cancer/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:833:"<blockquote><p>The ability of radiation to cause cancer is dependent on whether or not the radiation is able to alter chemical bonds. This occurs when electrons involved in bonding in a molecule absorb radiation with enough energy to allow them to escape – this is called <a href="http://en.wikipedia.org/wiki/Ionization" target="_blank">ionization</a>. The thing is, whether or not radiation is ionizing is based solely on its energy, not on its number, and as we saw above, its energy is determined entirely from its frequency.</p></blockquote>\n<p>Cool article on WordPress.com about <a href="http://mitchkirby.com/2015/04/22/why-cell-phones-cant-cause-cancer-but-bananas-can/">Why Cell Phones Can’t Cause Cancer, But Bananas Can</a>, which I read while eating (and finishing) a banana. It covers dielectric heating too.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 27 Apr 2015 16:29:43 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:51:"WPTavern: Do WordPress.org Themes Need a Changelog?";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=42838";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"http://wptavern.com/do-wordpress-org-themes-need-a-changelog";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3692:"<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/04/changelog.jpg" rel="prettyphoto[42838]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/04/changelog.jpg?resize=1024%2C525" alt="photo credit: time - (license)" class="size-full wp-image-42884" /></a>photo credit: <a href="http://www.flickr.com/photos/68419214@N04/6897782843">time</a> &#8211; <a href="https://creativecommons.org/licenses/by-sa/2.0/">(license)</a>\n<p>Over the weekend, Theme Review Team member Jose Castaneda posted a <a href="https://make.wordpress.org/themes/2015/04/26/changelog-proposal/" target="_blank">proposal to add change logs</a> to themes hosted on WordPress.org. The discussion has been on the table for years, but renewed interest in change logs is surfacing for the upcoming 4.3 and 4.4 release cycles.</p>\n<p>Adding changelogs to themes requires action on two related tickets: a <a href="https://meta.trac.wordpress.org/ticket/45" target="_blank">meta ticket</a> to add support for change logs on WordPress.org and a <a href="https://core.trac.wordpress.org/ticket/22810" target="_blank">core ticket</a> to expose the changelog file to users in the WordPress admin.</p>\n<p>Castaneda&#8217;s proposal requests that the team select a standard format for theme authors to follow in either the readme.txt file or a new changelog.txt file. From there the team would follow the core development release cycle to complete whatever steps necessary to get changelog support added to WordPress.org themes.</p>\n<p>Theme Review Team members are divided on whether or not change logs are beneficial to users, as they already have the ability to detect changes using a .diff file when authors submit updates. Others find change logs to be a more readable addition.</p>\n<p>&#8220;Personally, I find change logs to be incredibly helpful, even when using a .diff,&#8221; Theme Review Team admin Chip Bennett said. &#8220;The changelog is the human-readable summary of changes, that can really help grok the diff changes.&#8221;</p>\n<p>Justin Tadlock isn&#8217;t convinced that WordPress users would benefit from themes including change logs:</p>\n<blockquote><p>Honestly, I don’t see change logs as all that important from a user standpoint. While I don’t have any official stats, I’d wager that the vast majority of users don’t read change logs and, of those who do happen upon one, don’t understand most of what’s actually in the file.</p>\n<p>Change logs are, by and large, a developer tool. It’s a nice-to-have feature. I don’t care one way or another. I never read them. I doubt we&#8217;ll get great change logs from the majority of theme authors. We can’t even manage to get some semantic versioning down or basic inline PHP docs. We’ll probably see a lot of Git commit logs copied/pasted or my personal favorite, “Changed a bunch of stuff. Too busy building awesome s*** to care about tracking changes”.</p></blockquote>\n<p>Active discussion on the topic is taking place on the <a href="https://make.wordpress.org/themes/2015/04/26/changelog-proposal/" target="_blank">make.wordpress.org/themes</a> blog. If the team concludes that change logs are beneficial, the main question to answer is whether or not they should simply take up residence in the readme.txt file, like plugins do, or have their own separate file.</p>\n<p>Ultimately, the issue boils down to whether or not WordPress users read and appreciate changelogs, or if they are more beneficial for developers. As the Theme Review Team is primarily made up of developers, it would be valuable if average users who desire theme change logs could chime in on situations where the file might be helpful.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 27 Apr 2015 15:36:01 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:77:"WPTavern: Zero Day XSS Vulnerability in WordPress 4.2 Currently Being Patched";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=42843";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:87:"http://wptavern.com/zero-day-xss-vulnerability-in-wordpress-4-2-currently-being-patched";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2686:"<p>Klikki Oy is <a href="http://klikki.fi/adv/wordpress2.html" target="_blank">reporting</a> a new comment XSS exploit vulnerability in WordPress 4.2, 4.1.2, 4.1.1, and 3.9.3, which allows an unauthenticated attacker to inject JavaScript into comments.</p>\n<blockquote><p>If triggered by a logged-in administrator, under default settings the attacker can leverage the vulnerability to execute arbitrary code on the server via the plugin and theme editors.</p>\n<p>Alternatively the attacker could change the administrator’s password, create new administrator accounts, or do whatever else the currently logged-in administrator can do on the target system.</p></blockquote>\n<p>This particular vulnerability is similar to one <a href="https://cedricvb.be/post/wordpress-stored-xss-vulnerability-4-1-2/" target="_blank">reported by Cedric Van Bockhaven in 2014</a>, which was patched in the most recent <a href="http://wptavern.com/wordpress-4-1-2-is-a-critical-security-release-immediate-update-recommended" target="_blank">WordPress 4.1.2 security release</a>. That particular vulnerability was related to four-byte characters being inserted into comments, causing premature truncation by MySQL.</p>\n<p>In this instance, an attacker posts an excessively long comment in order to trigger the MySQL TEXT type size limit, which truncates the comment as it is inserted into the database.</p>\n<blockquote><p>The truncation results in malformed HTML generated on the page. The attacker can supply any attributes in the allowed HTML tags, in the same way as with the two recently published stored XSS vulnerabilities affecting the WordPress core.</p>\n<p>In these two cases, the injected JavaScript apparently can&#8217;t be triggered in the administrative Dashboard so these exploits seem to require getting around comment moderation e.g. by posting one harmless comment first.</p></blockquote>\n<p>A patch from the WordPress security team should be forthcoming. At this time the team could not provide an ETA, but in the meantime there are a few things users can do to mitigate the risk.</p>\n<p>&#8220;Your best option is to install Akismet (which has already been configured to block this attack), or disable comments,&#8221; core contributor Gary Pendergast said in response to <a href="https://wordpress.slack.com/archives/core/p1430134328007948" target="_blank">inquiries on the WordPress #core Slack channel</a>. &#8220;JavaScript is blocked by wp_kses(). Akismet blocks this specific attack, which gets around wp_kses()’s protection.&#8221;</p>\n<p>WordPress users can also temporarily disable comments in the meantime until the patch has been issued by the WordPress security team.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 27 Apr 2015 12:10:22 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"Matt: Entanglement";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44985";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:34:"http://ma.tt/2015/04/entanglement/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:243:"<p>If you&#8217;re curious about quantum entanglement (and a type of synesthesia) at all, check out <a href="http://www.npr.org/programs/invisibilia/382451600/entanglement">this week&#8217;s Invisibilia show on NPR called Entanglement</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 26 Apr 2015 15:19:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"Matt: 100 Books";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44983";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:31:"http://ma.tt/2015/04/100-books/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:413:"<p>You can&#8217;t go wrong with Amazon&#8217;s <a href="http://www.amazon.com/b?ie=UTF8&node=8192263011">100 Books To Read In A Lifetime</a>. I&#8217;ve only read a bit over a dozen of them, and some of those in school when I probably didn&#8217;t appreciate them. I&#8217;ve never had a time in my life when I thought, &#8220;You know, I&#8217;m reading too much.&#8221; It&#8217;s a weekend &#8212; read!</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 25 Apr 2015 23:38:17 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"Matt: Atlantic Earth Day Pictures";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44980";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:49:"http://ma.tt/2015/04/atlantic-earth-day-pictures/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:185:"<p>The Atlantic <a href="http://www.theatlantic.com/photo/2015/04/earth-day-45/390864/">has a set of 45 pictures that are both beautiful and shocking</a> to commemorate Earth Day.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 25 Apr 2015 04:41:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:79:"WPTavern: Automattic’s Dave Martin Publishes His 5 Step Remote Hiring Process";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=42810";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:86:"http://wptavern.com/automattics-dave-martin-publishes-his-5-step-remote-hiring-process";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3389:"<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/05/automattic-offices.jpg" rel="prettyphoto[42810]"><img class="wp-image-22370 size-full" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/05/automattic-offices.jpg?resize=1025%2C478" alt="photo credit: Peter Slutsky" /></a>photo credit: <a href="http://peterslutsky.com/2013/05/14/pics-touring-automattics-new-office/">Peter Slutsky</a>\n<p>If you&#8217;re thinking about applying to work for <a href="http://automattic.com/">Automattic</a>, you might want to <a href="http://davemart.in/2015/04/22/inside-automattics-remote-hiring-process/">read this article first</a>. Dave Martin, Creative Director at Automattic, published an in-depth look behind the scenes of the remote hiring process for the design and growth portion of the company. He explains the five step process in detail which gives future applicants a good idea of what to expect.</p>\n<p>It&#8217;s a fascinating read and I learned that every part of the process has a purpose. For instance, every trial project consists of work that would normally be completed by existing exmployees. Every question asked by Martin in the interview process has a purpose, whether it&#8217;s to glean information or get a feel for how the applicant communicates.</p>\n<p>The one area of the hiring process I&#8217;ve routinely seen scrutinized by those who don&#8217;t make the cut is the lack of specific feedback on why they&#8217;re not a good fit for a position. Dave Clements, who <a href="https://www.davidclements.me/2014/04/01/experience-trial-automattic/">almost made it to the final stage</a> of the hiring process, criticized the lack of detail from Automattic on why he wasn&#8217;t a good fit.</p>\n<blockquote><p>My only criticism of my whole process from start to finish is that I wish they would have gone into more detail into on why I was not a good fit for them. They had been so verbose and open up to that point about any question that I asked of them, but when I asked why they had come to the decision to not move forward, I was given a fairly generic response as they &#8216;couldn’t go into too much detail&#8217;.</p></blockquote>\n<p>Martin tries to do his best to highlight why someone is not a good fit, but the process is not easy and the number one goal is to hire the best people.</p>\n<blockquote><p>If things don’t end up working out, I’ll do my best to highlight why. At this point the applicant has invested quite a bit of time. I try to be as specific as possible as to why they are not going to proceed to a final interview.</p>\n<p>Telling people no is hard, but mistakenly bringing on the wrong people can be much worse. While you want to always be kind, and helpful to all applicants, your primary responsibility when hiring is to ensure that only the best people get hired. That is priority number one.</p></blockquote>\n<p>Whether you&#8217;re a distributed company or someone who&#8217;s interested in working for one, there is plenty to learn from the post. I also encourage you to read this <a href="https://hbr.org/2014/04/the-ceo-of-automattic-on-holding-auditions-to-build-a-strong-team">Harvard Business Review article</a> from 2014 featuring Matt Mullenweg, on holding auditions to build a strong team. If you&#8217;ve gone through the Automattic hiring process, let us know what it&#8217;s like in the comments.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 24 Apr 2015 23:12:35 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:44:"WPTavern: Story.am Relaunches, Now 100% Free";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=42704";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"http://wptavern.com/story-am-relaunches-now-100-free";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4448:"<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/04/story-am.jpg" rel="prettyphoto[42704]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/04/story-am.jpg?resize=774%2C337" alt="story-am" class="aligncenter size-full wp-image-42815" /></a></p>\n<p>Nick Haskins launched <a href="https://story.am/" target="_blank">Story.am</a> earlier this year as a hosted storytelling platform that offers all the features of <a href="http://wptavern.com/?s=Aesop+Story+Engine" target="_blank">Aesop Story Engine</a>. Initially, the platform was only available to paying customers, but this week Haskins announced that Story.am is <a href="https://story.am/story-am-re-launch/" target="_blank">now available to everyone for free</a>.</p>\n<p>The platform had not received much feedback in the several months it has been open to customers, so Haskins decided to remove all barriers to account creation.</p>\n<p>&#8220;We really want feedback on <a href="https://lasso.is/" target="_blank">Lasso</a>, our visual web editor on Story.AM,&#8221; he said. &#8220;By making it free, we hope to garner a lot of feedback, even if that feedback isn&#8217;t good. Often times, that type of feedback is the best.&#8221;</p>\n<p>In our <a href="http://wptavern.com/introducing-lasso-a-new-frontend-editor-for-wordpress" target="_blank">recent review of Lasso</a>, Jeff Chandler found that the product wasn&#8217;t quite polished enough for prime time but that it has potential. Haskins is hoping to build a broader network of Lasso users who will offer the feedback he needs to improve the editing experience.</p>\n<p>Immediately following his announcement that Story.am accounts are now available for free, Haskins was averaging one signup a minute.</p>\n<blockquote class="twitter-tweet" width="550"><p>Newsletter out, story.am now averaging one signup a minute for the last few minutes. &#10;&#10;The power of free.</p>\n<p>&mdash; Nick Haskins (@nphaskins) <a href="https://twitter.com/nphaskins/status/591359988309708800">April 23, 2015</a></p></blockquote>\n<p></p>\n<p>&#8220;Since the announcement yesterday evening there have been about 130 signups, so we&#8217;ve calmed down to about 5-7 signups an hour,&#8221; he said.</p>\n<p>Story.am is a multisite installation that was built to be elastic and ready to scale. In the future, Haskins will open up a Pro level that will offer additional features such as the ability to sell story subscriptions with Stripe and use your own domain.</p>\n<p>&#8220;The domain mapping and ability to sell story subscriptions are all in place and ready to go,&#8221; he said. &#8220;But rather than just releasing a Pro level straight away, I&#8217;m interested to see if what I THINK users want, is actually inline with what they REALLY want.&#8221;</p>\n<p>Haskins is taking notes of trends while monitoring the signups to get a better picture of how people plan to use Story.am.</p>\n<p>&#8220;I&#8217;m seeing a lot of what I would describe as &#8216;people who aren&#8217;t necessarily writers but want to tell stories,''&#8221; he said. &#8220;The domains that are coming across include terms like comic, pastor, fish, school, etc. It&#8217;s quite interesting to see. We are tracking everything in great detail, so as time goes on we&#8217;ll begin to have some solid metrics.&#8221;</p>\n<p>Many Story.am users are using the platform in the education space, a trend which has continued since opening up the site to free accounts. The platform is also open to bloggers, but Haskins is not aiming to compete with WordPress.com.</p>\n<p>&#8220;I&#8217;d like to see folks use stories in their own unique ways, with their own flair, and I think this will be tough to come by on a &#8216;generalized&#8217; network. i.e, one that basically treats everyone as the same,&#8221; he said. &#8220;One thing I don&#8217;t want to purposefully do is compete with WordPress.com. I&#8217;d much rather work with them to bring our ideas and tools to their platform, in some way, shape, or form.&#8221;</p>\n<p>Story.am has no current ETA for launching Pro level features, but Haskins said that he will be gauging the demand and gathering feedback before moving on monetizing the platform. If you&#8217;re curious about how Aesop Story Engine components work with WordPress and want to try the new Lasso frontend editor, it&#8217;s now as easy as signing up for a free account on <a href="https://story.am/">Story.am</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 24 Apr 2015 22:18:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:75:"WPTavern: New Plugin Adds Quick Access to the “Press This” Posting Form";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=42776";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:79:"http://wptavern.com/new-plugin-adds-quick-access-to-the-press-this-posting-form";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:5312:"<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/04/press-this-new.png" rel="prettyphoto[42776]"><img class="aligncenter size-full wp-image-42649" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/04/press-this-new.png?resize=986%2C531" alt="press-this-new" /></a></p>\n<p>One of the highlights of the recent <a href="http://wptavern.com/wordpress-4-2-powell-is-now-available-for-download" target="_blank">WordPress 4.2</a> release is the <a href="http://wptavern.com/pressthis-revamped-with-a-new-user-interface-and-minimalist-design" target="_blank">completely revamped Press This interface</a>. The feature&#8217;s intended purpose is to make it easy to share text, images, and videos from around the web in a quick post, but many users are newly captivated by Press This&#8217; new minimalist design for post creation.</p>\n<p>Once you try Press This for publishing, you may become some so partial to the posting form that you don&#8217;t want to go back to the standard post editor. It includes only the most essential formatting buttons and a button to add media, with all other extraneous selections for post formats, categories, and tags collapsed.</p>\n<p><a href="https://wordpress.org/plugins/press-this-new-post/" target="_blank">Press This New Post</a> is a new plugin, created by <a href="https://profiles.wordpress.org/drewapicture/" target="_blank">Drew Jaynes</a>, that gives you quick access to the Press This posting form from the &#8216;+ New&#8217; drop-down in the toolbar.</p>\n<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/04/press-this-new-post.jpg" rel="prettyphoto[42776]"><img class="aligncenter size-full wp-image-42787" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/04/press-this-new-post.jpg?resize=888%2C405" alt="press-this-new-post" /></a></p>\n<p>The link takes you to the Press This editor where you can scan a URL or simply start writing a new post.</p>\n<p>In the plugin&#8217;s description, Jaynes refers to the easy access as &#8220;Quick Draft on steroids,&#8221; but it may also become a real substitute for WordPress&#8217; dearly-departed <a href="http://wptavern.com/wordpress-zen-mode-5-compelling-reasons-to-turn-on-distraction-free-writing" target="_blank">zen mode</a>. Many users are distracted by the sliding side menu and the fading of non-essential parts of the editor that was introduced in WordPress 4.1 when the <a href="http://wptavern.com/focus-project-and-session-ui-approved-for-merge-into-wordpress-4-1" target="_blank">Focus Project was merged into core</a>. These animations are guaranteed not to happen to you in Press This mode.</p>\n<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/04/pop-tarts.jpg" rel="prettyphoto[42776]"><img class="aligncenter size-full wp-image-42794" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/04/pop-tarts.jpg?resize=974%2C534" alt="pop-tarts" /></a></p>\n<p>Jaynes is a regular user of the Press This post editor, which was one of his motivations for creating the quick access plugin.</p>\n<p>&#8220;I&#8217;ve already drafted three blog posts using it instead of the standard editor,&#8221; he said. &#8220;Obviously in most cases I finish up in the standard editor, but I really like the posting interface.</p>\n<p>&#8220;I think if we get to the point where Press This supports other post types and/or even other sites in a multisite network, it could really save a lot of time.&#8221;</p>\n<p>The Press This team is actively working on continuing to iterate the feature along those lines and both <a href="https://twitter.com/michaelarestad" target="_blank">Michael Arestad</a> and <a href="https://twitter.com/stephdau" target="_blank">Stephane Daury</a> have stepped up as core component maintainers.</p>\n<p>&#8220;I know for a fact that they both have future plans for improving and iterating it,&#8221; Jaynes said. &#8220;It’s actually really cool to see a continuation of the passion beyond a feature plugin getting merged.&#8221;</p>\n<p>Michael Arestad recently posted his thoughts on <a href="http://blog.michaelarestad.com/2015/04/23/pressed-it/" target="_blank">the future of Press This</a> and listed a host of features that the team is looking at adding:</p>\n<ul>\n<li>Split button (gonna be awesome)</li>\n<li>Some rearranging of components</li>\n<li>Improved tags UI</li>\n<li>Featured image</li>\n<li>Browser extensions</li>\n<li>Site switching</li>\n<li>Image flow improvements are in the works, which should drastically improve the media experience in both editors</li>\n<li>Improved NUX flow</li>\n</ul>\n<p>With its committed maintainers, the Press This feature is well-positioned to evolve to support more diverse content types, which may attract even more users than the bookmarklet does in the long run. If you&#8217;re still thinking of Press This as just a simple bookmarklet for re-posting content, you may want to revisit it. The feature has the potential to influence future iterations of the standard post editor, which suddenly seems a little cluttered.</p>\n<p>If you enjoy using Press This mode for creating new posts, the <a href="https://wordpress.org/plugins/press-this-new-post/" target="_blank">Press This New Post</a> plugin might be a handy addition to your site. Download it for free on WordPress.org.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 24 Apr 2015 20:06:43 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:73:"WPTavern: Insight into the Jamaican WordPress Community with Bianca Welds";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=42752";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:83:"http://wptavern.com/insight-into-the-jamaican-wordpress-community-with-bianca-welds";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:6221:"<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/04/bianca_edi1.jpg" rel="prettyphoto[42752]"><img class="alignright size-medium wp-image-42760" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/04/bianca_edi1.jpg?resize=300%2C226" alt="bianca_edi1" /></a>Last week, I met <a href="http://biancawelds.com/">Bianca Welds</a> who lives in Jamaica. She&#8217;s used WordPress for more than 10 years and has knowledge of the developing tech scene in Jamaica. In this interview, we learn how she discovered WordPress, the Jamaican WordPress community, and if the country will ever host a WordCamp.</p>\n<p><strong>How long have you used WordPress?</strong></p>\n<p>I just celebrated my 10th anniversary. I started using WordPress in 2005 and my first post was on April 2nd, 2005.</p>\n<p><strong>What is your WordPress origin story?</strong></p>\n<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/04/WPProfileOriginStory.png" rel="prettyphoto[42752]"><img class="size-full wp-image-42763" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/04/WPProfileOriginStory.png?resize=736%2C227" alt="As seen on the WordPress profile page" /></a>As seen on the WordPress profile page\n<p>I was working at IBM at the time and finally decided I liked the idea of having my own <a href="http://biancawelds.com/">personal website</a>. The more I thought about it, the more I realized I wanted to have a blog as well as a static site. I knew I could build an HTML site myself, so I researched this blogging thing, and I found <a href="https://www.blogger.com/home">Blogspot</a>. Within a day of signing up, I became frustrated at not being able to customize it, so I looked for alternatives. I came across WordPress and fell in love, purchased a hosting account, installed it, and never looked back.</p>\n<p><strong>What is the tech scene like in Jamaica?</strong></p>\n<p>The tech scene is currently developing nicely. There has been a lot of slow foundation growth over the last decade, but in the last few years, we have seen some dramatic acceleration. The tech meetup, <a href="http://kingstonbeta.com/">Kingston Beta</a>, grew to hosting a regional conference called <a href="http://connectimass.com/media-2/community-events/connect-events-networks/caribbean-beta/">Caribbean Beta</a>.</p>\n<p>The Slash Roots Developer Community saw the formation of the <a href="http://slashroots.org/">Slash Roots Foundation</a> which does a lot of work in the Open Data space. It expanded to organize the <a href="http://developingcaribbean.org/">Developing the Caribbean</a> conference, and was instrumental in the formation of <a href="http://codeforthecaribbean.org/">Code for the Caribbean</a>.</p>\n<p>Startup events have been growing with our first Startup Weekend taking place in 2013. The Digital Jam Mobile Application competition was held for three years along with several other initiatives. The first <a href="http://venturecapitaljamaica.com/conference/about">Venture Capital Conference</a> was held in 2013 where the first formal angel investor group, <a href="http://www.firstangelsja.com/">First Angels</a>, was created. <a href="http://www.start-upjamaica.com/en/p/list/57094">StartUpJamaica</a> is our first accelerator and it launched last year with over 200 applications, where 36 teams participated in boot camps and training. This is a small sample of the things that are happening in our space.</p>\n<p><strong>Is there a vibrant WordPress community in Jamaica?</strong></p>\n<p>Vibrant on an individual level perhaps. There is no active WordPress community at present. There are a lot of WordPress sites being built and a lot of WordPress blogs being run, but they are more or less individual efforts with no real communication or collaboration to grow and develop a community.</p>\n<p>I have recently started putting out feelers to see if there is enough interest in starting a regular WordPress meetup. In the last week, I&#8217;ve had interest from about two dozen people.</p>\n<p><strong>To date, there has not been a WordCamp in Jamaica. Do you think there will ever be one and will you help organize it?</strong></p>\n<p>I hope there will be and I definitely want to be a part of it. The first goal though would be to get the meetups going and gather a core community, so that&#8217;s my focus now.</p>\n<p><strong>Have you ever attended a WordCamp? If not, which one will be your first?</strong></p>\n<p>Unfortunately, I have never attended any WordCamps. I am working on changing that in the near future by going to <a href="http://miami.wordcamp.org/2015/">WordCamp Miami</a> which is the nearest one to Jamaica.</p>\n<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/05/WCMiamiFeaturedImage.png" rel="prettyphoto[42752]"><img class="wp-image-22707 size-full" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/05/WCMiamiFeaturedImage.png?resize=650%2C200" alt="WordCamp Miami Featured Image" /></a>WordCamp Miami Swag\n<p><strong>What do you like most about WordPress and what do you like the least?</strong></p>\n<p>My favorite thing about WordPress is its flexibility. While it may not be the perfect solution for every challenge, there are few things that cannot be done. My least favorite thing is how much there is to learn to truly take full advantage of its power.</p>\n<p><strong>If you wanted people to know something about Jamaica, what would it be?</strong></p>\n<p>The one thing I always try to share when I am <strong>the Jamaican</strong> in the crowd is that, Jamaica is so much more than beaches, weed and reggae. It definitely has those, but there are so many other aspects to our geography, our culture and our people who outsiders don&#8217;t yet fully grasp. But the world is learning.</p>\n<h2>Take the Jamaican WordPress Survey</h2>\n<p>Welds is trying to figure out the size and composition of the Jamaican WordPress community. Please help her out, especially if you&#8217;re a WordPress user living in Jamaica, by taking this <a href="http://lattitudestudios.com/wordpress-jamaica-survey/">short survey</a>. Information will remain confidential and will help Welds develop a better picture of the size and skill level of her local community.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 24 Apr 2015 17:02:21 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:104:"WPTavern: WPWeekly Episode 189 – Drew Jaynes on What it’s Like to Lead a WordPress Development Cycle";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:44:"http://wptavern.com?p=42751&preview_id=42751";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:107:"http://wptavern.com/wpweekly-episode-189-drew-jaynes-on-what-its-like-to-lead-a-wordpress-development-cycle";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3186:"<p>On this episode of WordPress Weekly, <a href="http://marcuscouch.com/">Marcus Couch</a> and I were joined by <a href="http://werdswords.com/">Drew Jaynes</a>, web engineer for <a href="http://10up.com/">10up,</a> and <a href="http://wptavern.com/drew-jaynes-to-lead-wordpress-4-2">release lead for WordPress 4.2</a>. Jaynes explains how a release lead is chosen, their responsibilities, and what their role is. Release leads are shepherds who work with multiple teams to keep development on track.</p>\n<p>Jaynes also explained how people can contribute to WordPress core through <a href="https://core.trac.wordpress.org/">Trac</a>. We discussed new features in WordPress 4.2 and what the benefits are to <a href="http://wptavern.com/wordpress-core-team-announces-release-leads-for-wordpress-4-3-and-4-4">selecting release leads ahead of time</a>. Last but not least, Jaynes helped us cover the week&#8217;s news.</p>\n<h2>Stories Discussed:</h2>\n<p><a href="http://wptavern.com/xss-vulnerability-affects-more-than-a-dozen-popular-wordpress-plugins">XSS Vulnerability Affects More Than a Dozen Popular WordPress Plugins</a><br />\n<a href="http://wptavern.com/xss-vulnerability-what-to-do-if-you-buy-or-sell-items-on-themeforest-and-codecanyon">XSS Vulnerability: What to do if You Buy or Sell Items on Themeforest and CodeCanyon</a><br />\n<a href="http://wptavern.com/wordpress-4-1-2-is-a-critical-security-release-immediate-update-recommended">WordPress 4.1.2 is a Critical Security Release, Immediate Update Recommended</a><br />\n<a href="http://wptavern.com/facebook-has-abandoned-its-official-wordpress-plugin">Facebook Has Abandoned Its Official WordPress Plugin</a></p>\n<h2>Plugins Picked By Marcus:</h2>\n<p><a href="https://wordpress.org/plugins/cosmick-star-rating/">Comstick Star Rating</a> conforms to the Google structured data algorithm. It allows you to capture customer reviews with a simple shortcode on any page. By inserting a single function into your theme&#8217;s header or footer, your rating will be displayed in Google search.</p>\n<p><a href="https://wordpress.org/plugins/employee-spotlight/">Employee Spotlight</a> displays employees, team members, founders, or just a single person in a four column circle grid. It comes with two sidebar widgets that display featured and recent employees selected in the editor.</p>\n<p><a href="https://wordpress.org/plugins/web-push-notifications/">Web Push Notifications</a> allows you to send push notifications to visitors who use Safari and Chrome.</p>\n<h2>WPWeekly Meta:</h2>\n<p><strong>Next Episode:</strong> Wednesday, April 29th 9:30 P.M. Eastern</p>\n<p><strong>Subscribe To WPWeekly Via Itunes: </strong><a href="https://itunes.apple.com/us/podcast/wordpress-weekly/id694849738" target="_blank">Click here to subscribe</a></p>\n<p><strong>Subscribe To WPWeekly Via RSS: </strong><a href="http://www.wptavern.com/feed/podcast" target="_blank">Click here to subscribe</a></p>\n<p><strong>Subscribe To WPWeekly Via Stitcher Radio: </strong><a href="http://www.stitcher.com/podcast/wordpress-weekly-podcast?refid=stpr" target="_blank">Click here to subscribe</a></p>\n<p><strong>Listen To Episode #189:</strong><br />\n</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 24 Apr 2015 06:30:09 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:65:"WPTavern: Why Some Sites Automatically Updated to WordPress 4.1.3";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=42743";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:75:"http://wptavern.com/why-some-sites-automatically-updated-to-wordpress-4-1-3";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1948:"<p>Since <a href="http://wptavern.com/wordpress-4-2-powell-is-now-available-for-download">WordPress 4.2 was released</a>, some users are <a href="https://twitter.com/clindsey/status/591436003853750272">questioning</a> why their sites have automatically updated to WordPress 4.1.3. There&#8217;s no information about the release on the <a href="https://core.trac.wordpress.org/ticket/32051">Make WordPress Core</a> site or the official <a href="https://wordpress.org/news/">WordPress news blog</a>. However, <a href="http://codex.wordpress.org/Version_4.1.3">this Codex article</a> explains what&#8217;s in 4.1.3 and the reason it was released.</p>\n<blockquote><p>Fix database writes for esoteric character sets, broken in the WordPress 4.1.2 security release. Neither UTF-8 nor latin1 were affected. For more information, see <a class="external text" href="https://core.trac.wordpress.org/ticket/32051">ticket #32051</a>.</p></blockquote>\n<p>The ticket contains a lengthy technical discussion of a critical bug and what was done to fix it. In addition to 4.1.3, the patch was merged into the following versions:</p>\n<ul>\n<li>3.7.7</li>\n<li>3.8.7</li>\n<li>3.9.5</li>\n<li>4.0.3</li>\n</ul>\n<p>Since these are point releases, sites running WordPress 3.7 and higher will automatically update unless the server doesn&#8217;t support it or they&#8217;re disabled. If you&#8217;re running an old version of WordPress, I highly encourage you to update to 4.2. Not only does it have <a href="http://wptavern.com/wordpress-4-2-powell-is-now-available-for-download">some nifty new features</a>, but it also fixes <a href="https://core.trac.wordpress.org/query?status=accepted&status=assigned&status=closed&status=new&status=reopened&status=reviewing&type=defect+%28bug%29&version=%21&version=%21trunk&resolution=fixed&milestone=4.2&col=id&col=summary&col=milestone&col=status&col=type&col=owner&col=priority&order=priority" target="_blank">231 defects</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 24 Apr 2015 04:25:35 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:15;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:50:"Post Status: WordPress 4.2, “Powell”, released";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:31:"https://poststatus.com/?p=12432";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:42:"https://poststatus.com/%e2%9d%a4%ef%b8%8f/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:5937:"<p></p>\n<h3>The consistency of WordPress</h3>\n<p>WordPress 4.2,&nbsp;<a href="http://wordpress.org/news/2015/04/powell/">Powell</a>,&nbsp;marks the impressive sixth major version in a row on a four month average development cycle.</p>\n<ul>\n<li>WordPress 3.7: October 24th, 2013</li>\n<li>WordPress 3.8: December 12th, 2013</li>\n<li>WordPress 3.9: April 16th, 2014</li>\n<li>WordPress 4.0: September 4th, 2014</li>\n<li>WordPress 4.1: December 18th, 2014</li>\n<li>WordPress 4.2: April 23rd, 2015</li>\n</ul>\n<p>This streak of consistency in WordPress releases is not accidental. Groundwork was put in place organizationally, technically, and philosophically to help ensure consistent, iterative improvements for WordPress.</p>\n<p>The project has always been quite good at updates, if compared to competition. However, a few releases prior to 3.7 got sidetracked, distracted, or thrown off schedule if held to our own high standard.</p>\n<p>Concepts such as the introduction of <a href="https://make.wordpress.org/core/features-as-plugins/">feature plugins</a> have helped put sanity and routine into the release schedule, even without repeat release leads these last six versions (and none will repeat at least through 4.4).</p>\n<h4>Features of WordPress 4.2</h4>\n<h3>Press This</h3>\n<p><img class="aligncenter size-large wp-image-12436" src="https://poststatus.com/wp-content/uploads/2015/04/press-this-wp-752x517.png" alt="press-this-wp" width="752" height="517" /></p>\n<p>It’s quite possible even long term WordPress users have never heard of, much less used, Press This. However, the bookmarklet makes sharing and publishing others’ articles on your own blog quite simple.</p>\n<p>It was long overdue to either be cut from core or completely revamped. It was completely revamped under the “feature as plugin” model, led by Michael Arestad.</p>\n<p>I’ve been using the new Press This or a while now on my personal blog, and it’s really great. If your goal is to blog more regularly, and you like to curate or share what you’re reading/watching, you’ll love Press This. You can find the bookmarklet in the admin and primary Tools page.</p>\n<p>The editor is modern and honestly a great prototype for what could be a future full WordPress editor. The bookmarklet sits in my bookmarks, and it’s encouraged me to more often blog my thoughts on what I read — versus leave my thoughts with a single Tweet.</p>\n<p>I was at first on the fence as to whether Press This made sense to get a revamp. I’m now convinced it was a great decision, and the team that worked on most of the features was outstanding.</p>\n<p>There are more features coming to Press This. You can check some of them out <a href="http://blog.michaelarestad.com/2015/04/23/pressed-it/">on Michael’s blog post</a> celebrating its inclusion in 4.2. If you’ve never pressed anything with Press This, definitely give it a shot.</p>\n<h3>Customizer Theme Switcher</h3>\n<p>Another feature plugin that made it into 4.2 is the Customizer Theme Switcher. Relatively self-explanatory, this feature brings the theme choosing experience to the customizer.</p>\n<p>The project was lead by Nick Halsey, and you can find the core proposal for the feature <a href="https://make.wordpress.org/core/2015/02/11/customizer-theme-switcher-feature-plugin-merge-proposal/">on the Make WordPress blog</a>. Not many folks using WordPress as a full CMS will change themes that often, but for those that do, the move for selecting and testing themes to the customizer makes sense.</p>\n<h3>Shiny Updates</h3>\n<p><img class="aligncenter size-full wp-image-12438" src="https://poststatus.com/wp-content/uploads/2015/04/shiny-updates.png" alt="shiny-updates" width="707" height="391" /></p>\n<p>Shiny Updates allows for inline updates directly in the plugins admin screen, without a redirect to the funky plugin update progression page you’re probably quite familiar with.</p>\n<p>Shiny Updates is part of a larger effort for making both updates and installs better. Due to some potential UX issues and in order to stick with the release schedule, shiny installs was postponed. However, in a future release, the install and activation process for plugins will be a simpler process as well.</p>\n<h3>Utf8mb4 support to enable special characters and emoji</h3>\n<p><img class="aligncenter size-large wp-image-12437" src="https://poststatus.com/wp-content/uploads/2015/04/4.2-characters-752x626.png" alt="4.2-characters" width="752" height="626" /></p>\n<p>WordPress can now handle all sorts of special characters by default, including Chinese, but also various glyphs and other symbols. And yes, emoji.</p>\n<p>Perhaps the most discussed and also misunderstood feature of WordPress 4.2, Utf8mb4 makes WordPress more accessible in more languages, and that is awesome.</p>\n<p>Also, don’t kid yourself: everyone loves emoji. As WordPress is used more as a mobile app backend, this change will be especially welcome. Can you imagine an app that didn’t support emoji? Of course not. <img src="https://s.w.org/images/core/emoji/72x72/1f389.png" alt="', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1915, '_transient_timeout_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1430284283', 'no'),
(1916, '_transient_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1430241083', 'no'),
(1917, '_transient_timeout_feed_b9388c83948825c1edaef0d856b7b109', '1430284283', 'no'),
(1918, '_transient_feed_b9388c83948825c1edaef0d856b7b109', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n	\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:117:"\n		\n		\n		\n		\n		\n		\n				\n\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:39:"WordPress Plugins » View: Most Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:45:"https://wordpress.org/plugins/browse/popular/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:39:"WordPress Plugins » View: Most Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 28 Apr 2015 16:38:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:25:"http://bbpress.org/?v=1.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:30:{i:0;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Jetpack by WordPress.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:49:"https://wordpress.org/plugins/jetpack/#post-23862";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 Jan 2011 02:21:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"23862@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:28:"Your WordPress, Streamlined.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Tim Moore";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:22:"WordPress SEO by Yoast";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:54:"https://wordpress.org/plugins/wordpress-seo/#post-8321";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 01 Jan 2009 20:34:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"8321@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:131:"Improve your WordPress SEO: Write better content and have a fully optimized WordPress site using Yoast&#039;s WordPress SEO plugin.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"Contact Form 7";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/contact-form-7/#post-2141";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 02 Aug 2007 12:45:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2141@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:54:"Just another contact form plugin. Simple but flexible.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Takayuki Miyoshi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"Akismet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:46:"https://wordpress.org/plugins/akismet/#post-15";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:11:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"15@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:98:"Akismet checks your comments against the Akismet Web service to see if they look like spam or not.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:25:"Google Analytics by Yoast";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:71:"https://wordpress.org/plugins/google-analytics-for-wordpress/#post-2316";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 14 Sep 2007 12:15:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2316@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:124:"Track your WordPress site easily with the latest tracking codes and lots added data for search result pages and error pages.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"All in One SEO Pack";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"https://wordpress.org/plugins/all-in-one-seo-pack/#post-753";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 30 Mar 2007 20:08:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"753@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:126:"All in One SEO Pack is a WordPress SEO plugin to automatically optimize your WordPress blog for Search Engines such as Google.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"uberdose";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"Wordfence Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/wordfence/#post-29832";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 04 Sep 2011 03:13:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"29832@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:137:"Wordfence Security is a free enterprise class security and performance plugin that makes your site up to 50 times faster and more secure.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Wordfence";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"WooCommerce - excelling eCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/woocommerce/#post-29860";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Sep 2011 08:13:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"29860@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:97:"WooCommerce is a powerful, extendable eCommerce plugin that helps you sell anything. Beautifully.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"WooThemes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"Broken Link Checker";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/broken-link-checker/#post-2441";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 08 Oct 2007 21:35:04 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2441@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:131:"This plugin will check your posts, comments and other content for broken links and missing images, and notify you if any are found.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Janis Elsts";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"TinyMCE Advanced";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:57:"https://wordpress.org/plugins/tinymce-advanced/#post-2082";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 27 Jun 2007 15:00:26 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2082@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:71:"Enables the advanced features of TinyMCE, the WordPress WYSIWYG editor.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Andrew Ozz";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"WPtouch Mobile Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:48:"https://wordpress.org/plugins/wptouch/#post-5468";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 01 May 2008 04:58:09 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"5468@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:67:"Make your WordPress website mobile-friendly with just a few clicks.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"BraveNewCode Inc.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:34:"UpdraftPlus Backup and Restoration";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/updraftplus/#post-38058";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 21 May 2012 15:14:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"38058@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:148:"Backup and restoration made easy. Complete backups; manual or scheduled (backup to S3, Dropbox, Google Drive, Rackspace, FTP, SFTP, email + others).";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"David Anderson";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WordPress Importer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/wordpress-importer/#post-18101";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 May 2010 17:42:45 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"18101@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:101:"Import posts, pages, comments, custom fields, categories, tags and more from a WordPress export file.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Brian Colinger";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"Page Builder by SiteOrigin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"https://wordpress.org/plugins/siteorigin-panels/#post-51888";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 11 Apr 2013 10:36:42 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"51888@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:111:"Build responsive page layouts using the widgets you know and love using this simple drag and drop page builder.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Greg Priday";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"Google Analytics Dashboard for WP";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:75:"https://wordpress.org/plugins/google-analytics-dashboard-for-wp/#post-50539";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 10 Mar 2013 17:07:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"50539@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:148:"Displays Google Analytics reports and real-time statistics in your WordPress Dashboard. Inserts the latest tracking code in every page of your site.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Alin Marcu";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:15;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WP Multibyte Patch";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/wp-multibyte-patch/#post-28395";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Jul 2011 12:22:53 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"28395@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:71:"Multibyte functionality enhancement for the WordPress Japanese package.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"plugin-master";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:16;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:32:"P3 (Plugin Performance Profiler)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/p3-profiler/#post-32894";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 12 Dec 2011 23:11:10 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"32894@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:102:"See which plugins are slowing down your site.  This plugin creates a performance report for your site.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"GoDaddy.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:17;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"ManageWP Worker";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:48:"https://wordpress.org/plugins/worker/#post-24528";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 18 Feb 2011 13:06:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"24528@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:103:"ManageWP is the ultimate WordPress productivity tool, allowing you to efficiently manage your websites.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Vladimir Prelovac";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:18;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"The Events Calendar";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:61:"https://wordpress.org/plugins/the-events-calendar/#post-14790";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 16 Dec 2009 21:58:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"14790@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:128:"The Events Calendar is a carefully crafted, extensible plugin that lets you easily share your events. Beautiful. Solid. Awesome.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Peter Chester";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:19;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"Redirection";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"https://wordpress.org/plugins/redirection/#post-2286";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 10 Sep 2007 04:45:08 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2286@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:144:"Redirection is a WordPress plugin to manage 301 redirections and keep track of 404 errors without requiring knowledge of Apache .htaccess files.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"John Godley";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:20;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"Meta Slider";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/ml-slider/#post-49521";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Feb 2013 16:56:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"49521@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:145:"Easy to use WordPress slider plugin. Create SEO optimised responsive slideshows with Nivo Slider, Flex Slider, Coin Slider and Responsive Slides.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Matcha Labs";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:21;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"Disable Comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:58:"https://wordpress.org/plugins/disable-comments/#post-26907";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 27 May 2011 04:42:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"26907@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:134:"Allows administrators to globally disable comments on their site. Comments can be disabled according to post type. Multisite friendly.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"solarissmoke";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:22;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"bbPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:49:"https://wordpress.org/plugins/bbpress/#post-14709";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 13 Dec 2009 00:05:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"14709@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:50:"bbPress is forum software, made the WordPress way.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"John James Jacoby";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:23;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"WP Super Cache";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/wp-super-cache/#post-2572";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Nov 2007 11:40:04 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2572@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:73:"A very fast caching engine for WordPress that produces static html files.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Donncha O Caoimh";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:24;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"NextGEN Gallery";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/plugins/nextgen-gallery/#post-1169";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Apr 2007 20:08:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"1169@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:121:"The most popular WordPress gallery plugin and one of the most popular plugins of all time with over 12 million downloads.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Alex Rabe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:25;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"Google XML Sitemaps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"https://wordpress.org/plugins/google-sitemap-generator/#post-132";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:31:32 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"132@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:105:"This plugin will generate a special XML sitemap which will help search engines to better index your blog.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Arne Brachhold";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:26;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:8:"WP Smush";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/wp-smushit/#post-7936";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 04 Dec 2008 00:00:37 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"7936@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:108:"Reduce image file sizes, improve performance and boost your SEO using the free WPMU DEV WordPress Smush API.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Alex Dunae";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:27;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:13:"Photo Gallery";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/photo-gallery/#post-63299";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 27 Jan 2014 15:58:41 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"63299@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:143:"Photo Gallery is an advanced plugin with a list of tools and options for adding and editing images for different views. It is fully responsive.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"webdorado";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:28;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:10:"BuddyPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"https://wordpress.org/plugins/buddypress/#post-10314";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 23 Apr 2009 17:48:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"10314@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:144:"BuddyPress helps you run any kind of social network on your WordPress, with member profiles, activity streams, user groups, messaging, and more.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Andy Peatling";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:29;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:22:"Advanced Custom Fields";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"https://wordpress.org/plugins/advanced-custom-fields/#post-25254";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 17 Mar 2011 04:07:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"25254@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:68:"Customise WordPress with powerful, professional and intuitive fields";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"elliotcondon";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:46:"https://wordpress.org/plugins/rss/view/popular";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:12:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Tue, 28 Apr 2015 17:11:23 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:25:"strict-transport-security";s:11:"max-age=360";s:7:"expires";s:29:"Tue, 28 Apr 2015 17:13:51 GMT";s:13:"cache-control";s:0:"";s:6:"pragma";s:0:"";s:13:"last-modified";s:31:"Tue, 28 Apr 2015 16:38:51 +0000";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 250";}s:5:"build";s:14:"20150402031630";}', 'no'),
(1919, '_transient_timeout_feed_mod_b9388c83948825c1edaef0d856b7b109', '1430284283', 'no'),
(1920, '_transient_feed_mod_b9388c83948825c1edaef0d856b7b109', '1430241083', 'no'),
(1921, '_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51', '1430284283', 'no'),
(1922, '_transient_dash_4077549d03da2e451c8b5f002294ff51', '<div class="rss-widget"><ul><li><a class=''rsswidget'' href=''https://wordpress.org/news/2015/04/wordpress-4-2-1/''>WordPress 4.2.1 Security Release</a> <span class="rss-date">April 27, 2015</span><div class="rssSummary">WordPress 4.2.1 is now available. This is a critical security release for all previous versions and we strongly encourage you to update your sites immediately. A few hours ago, the WordPress team was made aware of a cross-site scripting vulnerability, which could enable commenters to compromise a site. The vulnerability was discovered by Jouko Pynnönen. [&hellip;]</div></li></ul></div><div class="rss-widget"><ul><li><a class=''rsswidget'' href=''http://ma.tt/2015/04/who-is-steve-jobs/''>Matt: Who is Steve Jobs?</a></li><li><a class=''rsswidget'' href=''http://wptavern.com/poll-how-often-do-you-read-a-wordpress-plugins-changelog-before-updating''>WPTavern: Poll: How Often Do You Read a WordPress Plugin’s Changelog Before Updating?</a></li><li><a class=''rsswidget'' href=''http://wptavern.com/wordpress-4-2-1-released-to-patch-comment-exploit-vulnerability''>WPTavern: WordPress 4.2.1 Released to Patch Comment Exploit Vulnerability</a></li></ul></div><div class="rss-widget"><ul><li class=''dashboard-news-plugin''><span>Popular Plugin:</span> <a href=''https://wordpress.org/plugins/siteorigin-panels/'' class=''dashboard-news-plugin-link''>Page Builder by SiteOrigin</a>&nbsp;<span>(<a href=''plugin-install.php?tab=plugin-information&amp;plugin=siteorigin-panels&amp;_wpnonce=3c746771dd&amp;TB_iframe=true&amp;width=600&amp;height=800'' class=''thickbox'' title=''Page Builder by SiteOrigin''>Install</a>)</span></li></ul></div>', 'no'),
(1923, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1430251899', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1924, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'a:40:{s:6:"widget";a:3:{s:4:"name";s:6:"widget";s:4:"slug";s:6:"widget";s:5:"count";s:4:"5152";}s:4:"post";a:3:{s:4:"name";s:4:"Post";s:4:"slug";s:4:"post";s:5:"count";s:4:"3225";}s:6:"plugin";a:3:{s:4:"name";s:6:"plugin";s:4:"slug";s:6:"plugin";s:5:"count";s:4:"3156";}s:5:"admin";a:3:{s:4:"name";s:5:"admin";s:4:"slug";s:5:"admin";s:5:"count";s:4:"2683";}s:5:"posts";a:3:{s:4:"name";s:5:"posts";s:4:"slug";s:5:"posts";s:5:"count";s:4:"2467";}s:7:"sidebar";a:3:{s:4:"name";s:7:"sidebar";s:4:"slug";s:7:"sidebar";s:5:"count";s:4:"1979";}s:9:"shortcode";a:3:{s:4:"name";s:9:"shortcode";s:4:"slug";s:9:"shortcode";s:5:"count";s:4:"1858";}s:6:"google";a:3:{s:4:"name";s:6:"google";s:4:"slug";s:6:"google";s:5:"count";s:4:"1818";}s:7:"twitter";a:3:{s:4:"name";s:7:"twitter";s:4:"slug";s:7:"twitter";s:5:"count";s:4:"1763";}s:6:"images";a:3:{s:4:"name";s:6:"images";s:4:"slug";s:6:"images";s:5:"count";s:4:"1743";}s:4:"page";a:3:{s:4:"name";s:4:"page";s:4:"slug";s:4:"page";s:5:"count";s:4:"1705";}s:8:"comments";a:3:{s:4:"name";s:8:"comments";s:4:"slug";s:8:"comments";s:5:"count";s:4:"1699";}s:5:"image";a:3:{s:4:"name";s:5:"image";s:4:"slug";s:5:"image";s:5:"count";s:4:"1589";}s:8:"facebook";a:3:{s:4:"name";s:8:"Facebook";s:4:"slug";s:8:"facebook";s:5:"count";s:4:"1395";}s:3:"seo";a:3:{s:4:"name";s:3:"seo";s:4:"slug";s:3:"seo";s:5:"count";s:4:"1345";}s:9:"wordpress";a:3:{s:4:"name";s:9:"wordpress";s:4:"slug";s:9:"wordpress";s:5:"count";s:4:"1271";}s:5:"links";a:3:{s:4:"name";s:5:"links";s:4:"slug";s:5:"links";s:5:"count";s:4:"1199";}s:6:"social";a:3:{s:4:"name";s:6:"social";s:4:"slug";s:6:"social";s:5:"count";s:4:"1147";}s:7:"gallery";a:3:{s:4:"name";s:7:"gallery";s:4:"slug";s:7:"gallery";s:5:"count";s:4:"1129";}s:5:"email";a:3:{s:4:"name";s:5:"email";s:4:"slug";s:5:"email";s:5:"count";s:3:"993";}s:7:"widgets";a:3:{s:4:"name";s:7:"widgets";s:4:"slug";s:7:"widgets";s:5:"count";s:3:"965";}s:5:"pages";a:3:{s:4:"name";s:5:"pages";s:4:"slug";s:5:"pages";s:5:"count";s:3:"917";}s:11:"woocommerce";a:3:{s:4:"name";s:11:"woocommerce";s:4:"slug";s:11:"woocommerce";s:5:"count";s:3:"884";}s:6:"jquery";a:3:{s:4:"name";s:6:"jquery";s:4:"slug";s:6:"jquery";s:5:"count";s:3:"877";}s:3:"rss";a:3:{s:4:"name";s:3:"rss";s:4:"slug";s:3:"rss";s:5:"count";s:3:"855";}s:5:"media";a:3:{s:4:"name";s:5:"media";s:4:"slug";s:5:"media";s:5:"count";s:3:"839";}s:5:"video";a:3:{s:4:"name";s:5:"video";s:4:"slug";s:5:"video";s:5:"count";s:3:"798";}s:4:"ajax";a:3:{s:4:"name";s:4:"AJAX";s:4:"slug";s:4:"ajax";s:5:"count";s:3:"774";}s:7:"content";a:3:{s:4:"name";s:7:"content";s:4:"slug";s:7:"content";s:5:"count";s:3:"747";}s:10:"javascript";a:3:{s:4:"name";s:10:"javascript";s:4:"slug";s:10:"javascript";s:5:"count";s:3:"728";}s:5:"login";a:3:{s:4:"name";s:5:"login";s:4:"slug";s:5:"login";s:5:"count";s:3:"721";}s:9:"ecommerce";a:3:{s:4:"name";s:9:"ecommerce";s:4:"slug";s:9:"ecommerce";s:5:"count";s:3:"715";}s:10:"buddypress";a:3:{s:4:"name";s:10:"buddypress";s:4:"slug";s:10:"buddypress";s:5:"count";s:3:"684";}s:5:"photo";a:3:{s:4:"name";s:5:"photo";s:4:"slug";s:5:"photo";s:5:"count";s:3:"676";}s:4:"feed";a:3:{s:4:"name";s:4:"feed";s:4:"slug";s:4:"feed";s:5:"count";s:3:"672";}s:4:"link";a:3:{s:4:"name";s:4:"link";s:4:"slug";s:4:"link";s:5:"count";s:3:"662";}s:7:"youtube";a:3:{s:4:"name";s:7:"youtube";s:4:"slug";s:7:"youtube";s:5:"count";s:3:"638";}s:6:"photos";a:3:{s:4:"name";s:6:"photos";s:4:"slug";s:6:"photos";s:5:"count";s:3:"628";}s:4:"spam";a:3:{s:4:"name";s:4:"spam";s:4:"slug";s:4:"spam";s:5:"count";s:3:"627";}s:8:"security";a:3:{s:4:"name";s:8:"security";s:4:"slug";s:8:"security";s:5:"count";s:3:"627";}}', 'yes'),
(1925, '_site_transient_update_plugins', 'O:8:"stdClass":5:{s:12:"last_checked";i:1430241217;s:7:"checked";a:11:{s:19:"akismet/akismet.php";s:5:"3.1.1";s:24:"buddypress/bp-loader.php";s:7:"2.2.3.1";s:49:"cimy-user-extra-fields/cimy_user_extra_fields.php";s:5:"2.6.4";s:36:"contact-form-7/wp-contact-form-7.php";s:5:"4.1.2";s:9:"hello.php";s:3:"1.6";s:53:"jonradio-multiple-themes/jonradio-multiple-themes.php";s:3:"7.1";s:49:"kopa-nictitate-toolkit/kopa-nictitate-toolkit.php";s:5:"1.0.0";s:24:"page-theme/pageTheme.php";s:3:"3.5";s:33:"theme-my-login/theme-my-login.php";s:6:"6.3.11";s:37:"user-role-editor/user-role-editor.php";s:6:"4.18.3";s:31:"wp-migrate-db/wp-migrate-db.php";s:5:"0.6.1";}s:8:"response";a:0:{}s:12:"translations";a:0:{}s:9:"no_update";a:11:{s:19:"akismet/akismet.php";O:8:"stdClass":6:{s:2:"id";s:2:"15";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"3.1.1";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.3.1.1.zip";}s:24:"buddypress/bp-loader.php";O:8:"stdClass":7:{s:2:"id";s:4:"7756";s:4:"slug";s:10:"buddypress";s:6:"plugin";s:24:"buddypress/bp-loader.php";s:11:"new_version";s:7:"2.2.3.1";s:3:"url";s:41:"https://wordpress.org/plugins/buddypress/";s:7:"package";s:61:"https://downloads.wordpress.org/plugin/buddypress.2.2.3.1.zip";s:14:"upgrade_notice";s:59:"See: https://codex.buddypress.org/releases/version-2-2-3-1/";}s:49:"cimy-user-extra-fields/cimy_user_extra_fields.php";O:8:"stdClass":6:{s:2:"id";s:4:"5909";s:4:"slug";s:22:"cimy-user-extra-fields";s:6:"plugin";s:49:"cimy-user-extra-fields/cimy_user_extra_fields.php";s:11:"new_version";s:5:"2.6.4";s:3:"url";s:53:"https://wordpress.org/plugins/cimy-user-extra-fields/";s:7:"package";s:71:"https://downloads.wordpress.org/plugin/cimy-user-extra-fields.2.6.4.zip";}s:36:"contact-form-7/wp-contact-form-7.php";O:8:"stdClass":6:{s:2:"id";s:3:"790";s:4:"slug";s:14:"contact-form-7";s:6:"plugin";s:36:"contact-form-7/wp-contact-form-7.php";s:11:"new_version";s:5:"4.1.2";s:3:"url";s:45:"https://wordpress.org/plugins/contact-form-7/";s:7:"package";s:63:"https://downloads.wordpress.org/plugin/contact-form-7.4.1.2.zip";}s:9:"hello.php";O:8:"stdClass":6:{s:2:"id";s:4:"3564";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";}s:53:"jonradio-multiple-themes/jonradio-multiple-themes.php";O:8:"stdClass":7:{s:2:"id";s:5:"34024";s:4:"slug";s:24:"jonradio-multiple-themes";s:6:"plugin";s:53:"jonradio-multiple-themes/jonradio-multiple-themes.php";s:11:"new_version";s:3:"7.1";s:3:"url";s:55:"https://wordpress.org/plugins/jonradio-multiple-themes/";s:7:"package";s:71:"https://downloads.wordpress.org/plugin/jonradio-multiple-themes.7.1.zip";s:14:"upgrade_notice";s:12:"AJAX Support";}s:49:"kopa-nictitate-toolkit/kopa-nictitate-toolkit.php";O:8:"stdClass":6:{s:2:"id";s:5:"52561";s:4:"slug";s:22:"kopa-nictitate-toolkit";s:6:"plugin";s:49:"kopa-nictitate-toolkit/kopa-nictitate-toolkit.php";s:11:"new_version";s:5:"1.0.0";s:3:"url";s:53:"https://wordpress.org/plugins/kopa-nictitate-toolkit/";s:7:"package";s:65:"https://downloads.wordpress.org/plugin/kopa-nictitate-toolkit.zip";}s:24:"page-theme/pageTheme.php";O:8:"stdClass":6:{s:2:"id";s:5:"15181";s:4:"slug";s:10:"page-theme";s:6:"plugin";s:24:"page-theme/pageTheme.php";s:11:"new_version";s:3:"3.5";s:3:"url";s:41:"https://wordpress.org/plugins/page-theme/";s:7:"package";s:57:"https://downloads.wordpress.org/plugin/page-theme.3.5.zip";}s:33:"theme-my-login/theme-my-login.php";O:8:"stdClass":6:{s:2:"id";s:4:"7109";s:4:"slug";s:14:"theme-my-login";s:6:"plugin";s:33:"theme-my-login/theme-my-login.php";s:11:"new_version";s:6:"6.3.11";s:3:"url";s:45:"https://wordpress.org/plugins/theme-my-login/";s:7:"package";s:64:"https://downloads.wordpress.org/plugin/theme-my-login.6.3.11.zip";}s:37:"user-role-editor/user-role-editor.php";O:8:"stdClass":6:{s:2:"id";s:5:"13697";s:4:"slug";s:16:"user-role-editor";s:6:"plugin";s:37:"user-role-editor/user-role-editor.php";s:11:"new_version";s:6:"4.18.3";s:3:"url";s:47:"https://wordpress.org/plugins/user-role-editor/";s:7:"package";s:59:"https://downloads.wordpress.org/plugin/user-role-editor.zip";}s:31:"wp-migrate-db/wp-migrate-db.php";O:8:"stdClass":6:{s:2:"id";s:4:"9135";s:4:"slug";s:13:"wp-migrate-db";s:6:"plugin";s:31:"wp-migrate-db/wp-migrate-db.php";s:11:"new_version";s:5:"0.6.1";s:3:"url";s:44:"https://wordpress.org/plugins/wp-migrate-db/";s:7:"package";s:62:"https://downloads.wordpress.org/plugin/wp-migrate-db.0.6.1.zip";}}}', 'yes'),
(1926, 'cimy_uef_options', 'a:17:{s:18:"extra_fields_title";s:12:"Extra Fields";s:14:"users_per_page";i:50;s:17:"aue_hidden_fields";a:3:{i:0;s:7:"website";i:1;s:5:"posts";i:2;s:5:"email";}s:16:"wp_hidden_fields";a:1:{i:0;s:8:"username";}s:14:"fieldset_title";s:0:"";s:17:"registration-logo";s:0:"";s:7:"captcha";s:4:"none";s:13:"welcome_email";s:51:"Username: USERNAME\r\nPassword: PASSWORD\r\nLOGINLINK\r\n";s:12:"confirm_form";b:0;s:13:"confirm_email";b:0;s:14:"password_meter";b:0;s:19:"mail_include_fields";b:0;s:11:"redirect_to";s:0:"";s:11:"file_fields";a:5:{s:11:"show_in_reg";i:0;s:15:"show_in_profile";i:0;s:11:"show_in_aeu";i:0;s:12:"show_in_blog";i:0;s:14:"show_in_search";i:0;}s:12:"image_fields";a:5:{s:11:"show_in_reg";i:0;s:15:"show_in_profile";i:0;s:11:"show_in_aeu";i:0;s:12:"show_in_blog";i:0;s:14:"show_in_search";i:0;}s:14:"tinymce_fields";a:5:{s:11:"show_in_reg";i:0;s:15:"show_in_profile";i:0;s:11:"show_in_aeu";i:0;s:12:"show_in_blog";i:0;s:14:"show_in_search";i:0;}s:7:"version";s:5:"2.6.4";}', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
`meta_id` bigint(20) unsigned NOT NULL,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=557 ;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 1, '_edit_lock', '1429210371:1'),
(3, 2, '_edit_lock', '1429641180:1'),
(4, 4, '_edit_last', '1'),
(5, 4, '_edit_lock', '1425419605:1'),
(6, 6, '_edit_last', '1'),
(7, 6, '_edit_lock', '1429759416:1'),
(8, 6, 'kopa_nictitate_total_view', '1'),
(9, 9, '_form', '<p>Your Name (required)<br />\n    [text* your-name] </p>\n\n<p>Your Email (required)<br />\n    [email* your-email] </p>\n\n<p>Subject<br />\n    [text your-subject] </p>\n\n<p>Your Message<br />\n    [textarea your-message] </p>\n\n<p>[submit "Send"]</p>'),
(10, 9, '_mail', 'a:8:{s:7:"subject";s:14:"[your-subject]";s:6:"sender";s:32:"[your-name] <admin@spikebook.co>";s:4:"body";s:167:"From: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on My Blog (http://spikebook.co/wp)";s:9:"recipient";s:18:"admin@spikebook.co";s:18:"additional_headers";s:22:"Reply-To: [your-email]";s:11:"attachments";s:0:"";s:8:"use_html";i:0;s:13:"exclude_blank";i:0;}'),
(11, 9, '_mail_2', 'a:9:{s:6:"active";b:0;s:7:"subject";s:14:"[your-subject]";s:6:"sender";s:28:"My Blog <admin@spikebook.co>";s:4:"body";s:109:"Message Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on My Blog (http://spikebook.co/wp)";s:9:"recipient";s:12:"[your-email]";s:18:"additional_headers";s:28:"Reply-To: admin@spikebook.co";s:11:"attachments";s:0:"";s:8:"use_html";i:0;s:13:"exclude_blank";i:0;}'),
(12, 9, '_messages', 'a:6:{s:12:"mail_sent_ok";s:43:"Your message was sent successfully. Thanks.";s:12:"mail_sent_ng";s:93:"Failed to send your message. Please try later or contact the administrator by another method.";s:16:"validation_error";s:74:"Validation errors occurred. Please confirm the fields and submit it again.";s:4:"spam";s:93:"Failed to send your message. Please try later or contact the administrator by another method.";s:12:"accept_terms";s:35:"Please accept the terms to proceed.";s:16:"invalid_required";s:31:"Please fill the required field.";}'),
(13, 9, '_additional_settings', ''),
(14, 9, '_locale', 'en_US'),
(15, 2, '_edit_last', '1'),
(16, 1, '_edit_last', '1'),
(19, 6, '_wp_page_template', 'default'),
(57, 20, '_edit_last', '1'),
(58, 20, '_intima_port_title', 'Test'),
(59, 20, '_edit_lock', '1427827254:1'),
(60, 26, '_edit_lock', '1427827127:1'),
(62, 30, '_edit_lock', '1428614641:1'),
(63, 30, '_edit_last', '1'),
(64, 30, '_intima_port_title', 'Harika Yedidi'),
(65, 30, '_intima_port_ceta', 'Resume Book'),
(67, 36, '_tml_action', 'login'),
(68, 37, '_tml_action', 'logout'),
(69, 38, '_tml_action', 'register'),
(70, 39, '_tml_action', 'lostpassword'),
(71, 40, '_tml_action', 'resetpass'),
(72, 41, '_menu_item_type', 'post_type'),
(73, 41, '_menu_item_menu_item_parent', '0'),
(74, 41, '_menu_item_object_id', '6'),
(75, 41, '_menu_item_object', 'page'),
(76, 41, '_menu_item_target', ''),
(77, 41, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(78, 41, '_menu_item_xfn', ''),
(79, 41, '_menu_item_url', ''),
(80, 41, '_menu_item_orphaned', '1428110772'),
(81, 42, '_menu_item_type', 'post_type'),
(82, 42, '_menu_item_menu_item_parent', '0'),
(83, 42, '_menu_item_object_id', '2'),
(84, 42, '_menu_item_object', 'page'),
(85, 42, '_menu_item_target', ''),
(86, 42, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(87, 42, '_menu_item_xfn', ''),
(88, 42, '_menu_item_url', ''),
(89, 42, '_menu_item_orphaned', '1428110772'),
(90, 43, '_menu_item_type', 'post_type'),
(91, 43, '_menu_item_menu_item_parent', '0'),
(92, 43, '_menu_item_object_id', '25'),
(93, 43, '_menu_item_object', 'page'),
(94, 43, '_menu_item_target', ''),
(95, 43, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(96, 43, '_menu_item_xfn', ''),
(97, 43, '_menu_item_url', ''),
(98, 43, '_menu_item_orphaned', '1428110772'),
(99, 44, '_menu_item_type', 'post_type'),
(100, 44, '_menu_item_menu_item_parent', '0'),
(101, 44, '_menu_item_object_id', '4'),
(102, 44, '_menu_item_object', 'page'),
(103, 44, '_menu_item_target', ''),
(104, 44, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(105, 44, '_menu_item_xfn', ''),
(106, 44, '_menu_item_url', ''),
(107, 44, '_menu_item_orphaned', '1428110772'),
(108, 45, '_menu_item_type', 'post_type'),
(109, 45, '_menu_item_menu_item_parent', '0'),
(110, 45, '_menu_item_object_id', '6'),
(111, 45, '_menu_item_object', 'page'),
(112, 45, '_menu_item_target', ''),
(113, 45, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(114, 45, '_menu_item_xfn', ''),
(115, 45, '_menu_item_url', ''),
(116, 45, '_menu_item_orphaned', '1428110772'),
(117, 46, '_menu_item_type', 'post_type'),
(118, 46, '_menu_item_menu_item_parent', '0'),
(119, 46, '_menu_item_object_id', '36'),
(120, 46, '_menu_item_object', 'page'),
(121, 46, '_menu_item_target', ''),
(122, 46, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(123, 46, '_menu_item_xfn', ''),
(124, 46, '_menu_item_url', ''),
(125, 46, '_menu_item_orphaned', '1428110772'),
(126, 47, '_menu_item_type', 'post_type'),
(127, 47, '_menu_item_menu_item_parent', '0'),
(128, 47, '_menu_item_object_id', '37'),
(129, 47, '_menu_item_object', 'page'),
(130, 47, '_menu_item_target', ''),
(131, 47, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(132, 47, '_menu_item_xfn', ''),
(133, 47, '_menu_item_url', ''),
(134, 47, '_menu_item_orphaned', '1428110772'),
(135, 48, '_menu_item_type', 'post_type'),
(136, 48, '_menu_item_menu_item_parent', '0'),
(137, 48, '_menu_item_object_id', '39'),
(138, 48, '_menu_item_object', 'page'),
(139, 48, '_menu_item_target', ''),
(140, 48, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(141, 48, '_menu_item_xfn', ''),
(142, 48, '_menu_item_url', ''),
(143, 48, '_menu_item_orphaned', '1428110772'),
(144, 49, '_menu_item_type', 'post_type'),
(145, 49, '_menu_item_menu_item_parent', '0'),
(146, 49, '_menu_item_object_id', '26'),
(147, 49, '_menu_item_object', 'page'),
(148, 49, '_menu_item_target', ''),
(149, 49, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(150, 49, '_menu_item_xfn', ''),
(151, 49, '_menu_item_url', ''),
(152, 49, '_menu_item_orphaned', '1428110772'),
(153, 50, '_menu_item_type', 'post_type'),
(154, 50, '_menu_item_menu_item_parent', '0'),
(155, 50, '_menu_item_object_id', '38'),
(156, 50, '_menu_item_object', 'page'),
(157, 50, '_menu_item_target', ''),
(158, 50, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(159, 50, '_menu_item_xfn', ''),
(160, 50, '_menu_item_url', ''),
(161, 50, '_menu_item_orphaned', '1428110772'),
(162, 51, '_menu_item_type', 'post_type'),
(163, 51, '_menu_item_menu_item_parent', '0'),
(164, 51, '_menu_item_object_id', '40'),
(165, 51, '_menu_item_object', 'page'),
(166, 51, '_menu_item_target', ''),
(167, 51, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(168, 51, '_menu_item_xfn', ''),
(169, 51, '_menu_item_url', ''),
(170, 51, '_menu_item_orphaned', '1428110772'),
(171, 52, '_menu_item_type', 'post_type'),
(172, 52, '_menu_item_menu_item_parent', '0'),
(173, 52, '_menu_item_object_id', '6'),
(174, 52, '_menu_item_object', 'page'),
(175, 52, '_menu_item_target', ''),
(176, 52, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(177, 52, '_menu_item_xfn', ''),
(178, 52, '_menu_item_url', ''),
(179, 52, '_menu_item_orphaned', '1428110806'),
(180, 53, '_menu_item_type', 'post_type'),
(181, 53, '_menu_item_menu_item_parent', '0'),
(182, 53, '_menu_item_object_id', '2'),
(183, 53, '_menu_item_object', 'page'),
(184, 53, '_menu_item_target', ''),
(185, 53, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(186, 53, '_menu_item_xfn', ''),
(187, 53, '_menu_item_url', ''),
(188, 53, '_menu_item_orphaned', '1428110806'),
(189, 54, '_menu_item_type', 'post_type'),
(190, 54, '_menu_item_menu_item_parent', '0'),
(191, 54, '_menu_item_object_id', '25'),
(192, 54, '_menu_item_object', 'page'),
(193, 54, '_menu_item_target', ''),
(194, 54, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(195, 54, '_menu_item_xfn', ''),
(196, 54, '_menu_item_url', ''),
(197, 54, '_menu_item_orphaned', '1428110806'),
(198, 55, '_menu_item_type', 'post_type'),
(199, 55, '_menu_item_menu_item_parent', '0'),
(200, 55, '_menu_item_object_id', '4'),
(201, 55, '_menu_item_object', 'page'),
(202, 55, '_menu_item_target', ''),
(203, 55, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(204, 55, '_menu_item_xfn', ''),
(205, 55, '_menu_item_url', ''),
(206, 55, '_menu_item_orphaned', '1428110806'),
(207, 56, '_menu_item_type', 'post_type'),
(208, 56, '_menu_item_menu_item_parent', '0'),
(209, 56, '_menu_item_object_id', '6'),
(210, 56, '_menu_item_object', 'page'),
(211, 56, '_menu_item_target', ''),
(212, 56, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(213, 56, '_menu_item_xfn', ''),
(214, 56, '_menu_item_url', ''),
(215, 56, '_menu_item_orphaned', '1428110806'),
(216, 57, '_menu_item_type', 'post_type'),
(217, 57, '_menu_item_menu_item_parent', '0'),
(218, 57, '_menu_item_object_id', '36'),
(219, 57, '_menu_item_object', 'page'),
(220, 57, '_menu_item_target', ''),
(221, 57, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(222, 57, '_menu_item_xfn', ''),
(223, 57, '_menu_item_url', ''),
(224, 57, '_menu_item_orphaned', '1428110806'),
(225, 58, '_menu_item_type', 'post_type'),
(226, 58, '_menu_item_menu_item_parent', '0'),
(227, 58, '_menu_item_object_id', '37'),
(228, 58, '_menu_item_object', 'page'),
(229, 58, '_menu_item_target', ''),
(230, 58, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(231, 58, '_menu_item_xfn', ''),
(232, 58, '_menu_item_url', ''),
(233, 58, '_menu_item_orphaned', '1428110806'),
(234, 59, '_menu_item_type', 'post_type'),
(235, 59, '_menu_item_menu_item_parent', '0'),
(236, 59, '_menu_item_object_id', '39'),
(237, 59, '_menu_item_object', 'page'),
(238, 59, '_menu_item_target', ''),
(239, 59, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(240, 59, '_menu_item_xfn', ''),
(241, 59, '_menu_item_url', ''),
(242, 59, '_menu_item_orphaned', '1428110806'),
(243, 60, '_menu_item_type', 'post_type'),
(244, 60, '_menu_item_menu_item_parent', '0'),
(245, 60, '_menu_item_object_id', '26'),
(246, 60, '_menu_item_object', 'page'),
(247, 60, '_menu_item_target', ''),
(248, 60, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(249, 60, '_menu_item_xfn', ''),
(250, 60, '_menu_item_url', ''),
(251, 60, '_menu_item_orphaned', '1428110806'),
(252, 61, '_menu_item_type', 'post_type'),
(253, 61, '_menu_item_menu_item_parent', '0'),
(254, 61, '_menu_item_object_id', '38'),
(255, 61, '_menu_item_object', 'page'),
(256, 61, '_menu_item_target', ''),
(257, 61, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(258, 61, '_menu_item_xfn', ''),
(259, 61, '_menu_item_url', ''),
(260, 61, '_menu_item_orphaned', '1428110806'),
(261, 62, '_menu_item_type', 'post_type'),
(262, 62, '_menu_item_menu_item_parent', '0'),
(263, 62, '_menu_item_object_id', '40'),
(264, 62, '_menu_item_object', 'page'),
(265, 62, '_menu_item_target', ''),
(266, 62, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(267, 62, '_menu_item_xfn', ''),
(268, 62, '_menu_item_url', ''),
(269, 62, '_menu_item_orphaned', '1428110806'),
(270, 63, '_menu_item_type', 'post_type'),
(271, 63, '_menu_item_menu_item_parent', '0'),
(272, 63, '_menu_item_object_id', '6'),
(273, 63, '_menu_item_object', 'page'),
(274, 63, '_menu_item_target', ''),
(275, 63, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(276, 63, '_menu_item_xfn', ''),
(277, 63, '_menu_item_url', ''),
(279, 64, '_menu_item_type', 'post_type'),
(280, 64, '_menu_item_menu_item_parent', '0'),
(281, 64, '_menu_item_object_id', '2'),
(282, 64, '_menu_item_object', 'page'),
(283, 64, '_menu_item_target', ''),
(284, 64, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(285, 64, '_menu_item_xfn', ''),
(286, 64, '_menu_item_url', ''),
(297, 66, '_menu_item_type', 'post_type'),
(298, 66, '_menu_item_menu_item_parent', '0'),
(299, 66, '_menu_item_object_id', '4'),
(300, 66, '_menu_item_object', 'page'),
(301, 66, '_menu_item_target', ''),
(302, 66, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(303, 66, '_menu_item_xfn', ''),
(304, 66, '_menu_item_url', ''),
(305, 66, '_menu_item_orphaned', '1428110837'),
(315, 68, '_menu_item_type', 'post_type'),
(316, 68, '_menu_item_menu_item_parent', '0'),
(317, 68, '_menu_item_object_id', '36'),
(318, 68, '_menu_item_object', 'page'),
(319, 68, '_menu_item_target', ''),
(320, 68, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(321, 68, '_menu_item_xfn', ''),
(322, 68, '_menu_item_url', ''),
(324, 69, '_menu_item_type', 'post_type'),
(325, 69, '_menu_item_menu_item_parent', '0'),
(326, 69, '_menu_item_object_id', '37'),
(327, 69, '_menu_item_object', 'page'),
(328, 69, '_menu_item_target', ''),
(329, 69, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(330, 69, '_menu_item_xfn', ''),
(331, 69, '_menu_item_url', ''),
(332, 69, '_menu_item_orphaned', '1428110837'),
(351, 72, '_menu_item_type', 'post_type'),
(352, 72, '_menu_item_menu_item_parent', '0'),
(353, 72, '_menu_item_object_id', '38'),
(354, 72, '_menu_item_object', 'page'),
(355, 72, '_menu_item_target', ''),
(356, 72, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(357, 72, '_menu_item_xfn', ''),
(358, 72, '_menu_item_url', ''),
(369, 74, '_menu_item_type', 'post_type'),
(370, 74, '_menu_item_menu_item_parent', '0'),
(371, 74, '_menu_item_object_id', '40'),
(372, 74, '_menu_item_object', 'page'),
(373, 74, '_menu_item_target', ''),
(374, 74, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(375, 74, '_menu_item_xfn', ''),
(376, 74, '_menu_item_url', ''),
(377, 74, '_menu_item_orphaned', '1428110910'),
(378, 75, '_menu_item_type', 'post_type'),
(379, 75, '_menu_item_menu_item_parent', '0'),
(380, 75, '_menu_item_object_id', '39'),
(381, 75, '_menu_item_object', 'page'),
(382, 75, '_menu_item_target', ''),
(383, 75, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(384, 75, '_menu_item_xfn', ''),
(385, 75, '_menu_item_url', ''),
(386, 75, '_menu_item_orphaned', '1428110910'),
(387, 76, '_menu_item_type', 'post_type'),
(388, 76, '_menu_item_menu_item_parent', '0'),
(389, 76, '_menu_item_object_id', '38'),
(390, 76, '_menu_item_object', 'page'),
(391, 76, '_menu_item_target', ''),
(392, 76, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(393, 76, '_menu_item_xfn', ''),
(394, 76, '_menu_item_url', ''),
(395, 76, '_menu_item_orphaned', '1428110910'),
(396, 77, '_menu_item_type', 'post_type'),
(397, 77, '_menu_item_menu_item_parent', '0'),
(398, 77, '_menu_item_object_id', '36'),
(399, 77, '_menu_item_object', 'page'),
(400, 77, '_menu_item_target', ''),
(401, 77, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(402, 77, '_menu_item_xfn', ''),
(403, 77, '_menu_item_url', ''),
(404, 77, '_menu_item_orphaned', '1428110910'),
(405, 39, '_edit_lock', '1428111142:1'),
(406, 37, '_edit_lock', '1428122957:1'),
(407, 78, '_tml_action', 'profile'),
(408, 38, '_edit_lock', '1429759944:1'),
(409, 36, '_edit_lock', '1428122250:1'),
(410, 36, '_edit_last', '1'),
(420, 81, '_menu_item_type', 'post_type'),
(421, 81, '_menu_item_menu_item_parent', '0'),
(422, 81, '_menu_item_object_id', '78'),
(423, 81, '_menu_item_object', 'page'),
(424, 81, '_menu_item_target', ''),
(425, 81, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(426, 81, '_menu_item_xfn', ''),
(427, 81, '_menu_item_url', ''),
(429, 82, '_menu_item_type', 'post_type'),
(430, 82, '_menu_item_menu_item_parent', '0'),
(431, 82, '_menu_item_object_id', '40'),
(432, 82, '_menu_item_object', 'page'),
(433, 82, '_menu_item_target', ''),
(434, 82, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(435, 82, '_menu_item_xfn', ''),
(436, 82, '_menu_item_url', ''),
(437, 82, '_menu_item_orphaned', '1428121048'),
(447, 84, '_menu_item_type', 'post_type'),
(448, 84, '_menu_item_menu_item_parent', '0'),
(449, 84, '_menu_item_object_id', '26'),
(450, 84, '_menu_item_object', 'page'),
(451, 84, '_menu_item_target', ''),
(452, 84, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(453, 84, '_menu_item_xfn', ''),
(454, 84, '_menu_item_url', ''),
(456, 85, '_menu_item_type', 'post_type'),
(457, 85, '_menu_item_menu_item_parent', '0'),
(458, 85, '_menu_item_object_id', '25'),
(459, 85, '_menu_item_object', 'page'),
(460, 85, '_menu_item_target', ''),
(461, 85, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(462, 85, '_menu_item_xfn', ''),
(463, 85, '_menu_item_url', ''),
(465, 86, '_menu_item_type', 'post_type'),
(466, 86, '_menu_item_menu_item_parent', '0'),
(467, 86, '_menu_item_object_id', '6'),
(468, 86, '_menu_item_object', 'page'),
(469, 86, '_menu_item_target', ''),
(470, 86, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(471, 86, '_menu_item_xfn', ''),
(472, 86, '_menu_item_url', ''),
(474, 87, '_menu_item_type', 'post_type'),
(475, 87, '_menu_item_menu_item_parent', '0'),
(476, 87, '_menu_item_object_id', '2'),
(477, 87, '_menu_item_object', 'page'),
(478, 87, '_menu_item_target', ''),
(479, 87, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(480, 87, '_menu_item_xfn', ''),
(481, 87, '_menu_item_url', ''),
(483, 89, '_menu_item_type', 'post_type'),
(484, 89, '_menu_item_menu_item_parent', '0'),
(485, 89, '_menu_item_object_id', '37'),
(486, 89, '_menu_item_object', 'page'),
(487, 89, '_menu_item_target', ''),
(488, 89, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(489, 89, '_menu_item_xfn', ''),
(490, 89, '_menu_item_url', ''),
(492, 90, '_menu_item_type', 'post_type'),
(493, 90, '_menu_item_menu_item_parent', '0'),
(494, 90, '_menu_item_object_id', '40'),
(495, 90, '_menu_item_object', 'page'),
(496, 90, '_menu_item_target', ''),
(497, 90, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(498, 90, '_menu_item_xfn', ''),
(499, 90, '_menu_item_url', ''),
(500, 90, '_menu_item_orphaned', '1428123283'),
(501, 91, '_menu_item_type', 'post_type'),
(502, 91, '_menu_item_menu_item_parent', '0'),
(503, 91, '_menu_item_object_id', '39'),
(504, 91, '_menu_item_object', 'page'),
(505, 91, '_menu_item_target', ''),
(506, 91, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(507, 91, '_menu_item_xfn', ''),
(508, 91, '_menu_item_url', ''),
(510, 92, '_menu_item_type', 'post_type'),
(511, 92, '_menu_item_menu_item_parent', '0'),
(512, 92, '_menu_item_object_id', '38'),
(513, 92, '_menu_item_object', 'page'),
(514, 92, '_menu_item_target', ''),
(515, 92, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(516, 92, '_menu_item_xfn', ''),
(517, 92, '_menu_item_url', ''),
(519, 93, '_menu_item_type', 'post_type'),
(520, 93, '_menu_item_menu_item_parent', '0'),
(521, 93, '_menu_item_object_id', '36'),
(522, 93, '_menu_item_object', 'page'),
(523, 93, '_menu_item_target', ''),
(524, 93, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(525, 93, '_menu_item_xfn', ''),
(526, 93, '_menu_item_url', ''),
(528, 94, '_menu_item_type', 'post_type'),
(529, 94, '_menu_item_menu_item_parent', '0'),
(530, 94, '_menu_item_object_id', '6'),
(531, 94, '_menu_item_object', 'page'),
(532, 94, '_menu_item_target', ''),
(533, 94, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(534, 94, '_menu_item_xfn', ''),
(535, 94, '_menu_item_url', ''),
(537, 95, '_menu_item_type', 'post_type'),
(538, 95, '_menu_item_menu_item_parent', '0'),
(539, 95, '_menu_item_object_id', '2'),
(540, 95, '_menu_item_object', 'page'),
(541, 95, '_menu_item_target', ''),
(542, 95, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(543, 95, '_menu_item_xfn', ''),
(544, 95, '_menu_item_url', ''),
(546, 97, '_edit_last', '1'),
(547, 97, '_edit_lock', '1429821018:1'),
(548, 97, '_wp_page_template', 'landing-page.php'),
(549, 78, '_edit_lock', '1430171350:1'),
(550, 25, '_edit_lock', '1429833873:1'),
(551, 102, '_form', '<p>Your Name (required)<br />\n    [text* your-name] </p>\n\n<p>Your Email (required)<br />\n    [email* your-email] </p>\n\n<p>Subject<br />\n    [text your-subject] </p>\n\n<p>Your Message<br />\n    [textarea your-message] </p>\n\n<p>[submit "Send"]</p>'),
(552, 102, '_mail', 'a:8:{s:7:"subject";s:14:"[your-subject]";s:6:"sender";s:32:"[your-name] <admin@spikebook.co>";s:4:"body";s:166:"From: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on SPIKEBOOK (http://spikebook.co)";s:9:"recipient";s:18:"admin@spikebook.co";s:18:"additional_headers";s:22:"Reply-To: [your-email]";s:11:"attachments";s:0:"";s:8:"use_html";b:0;s:13:"exclude_blank";b:0;}'),
(553, 102, '_mail_2', 'a:9:{s:6:"active";b:0;s:7:"subject";s:14:"[your-subject]";s:6:"sender";s:30:"SPIKEBOOK <admin@spikebook.co>";s:4:"body";s:108:"Message Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on SPIKEBOOK (http://spikebook.co)";s:9:"recipient";s:12:"[your-email]";s:18:"additional_headers";s:28:"Reply-To: admin@spikebook.co";s:11:"attachments";s:0:"";s:8:"use_html";b:0;s:13:"exclude_blank";b:0;}'),
(554, 102, '_messages', 'a:23:{s:12:"mail_sent_ok";s:43:"Your message was sent successfully. Thanks.";s:12:"mail_sent_ng";s:93:"Failed to send your message. Please try later or contact the administrator by another method.";s:16:"validation_error";s:74:"Validation errors occurred. Please confirm the fields and submit it again.";s:4:"spam";s:93:"Failed to send your message. Please try later or contact the administrator by another method.";s:12:"accept_terms";s:35:"Please accept the terms to proceed.";s:16:"invalid_required";s:34:"Please fill in the required field.";s:16:"invalid_too_long";s:23:"This input is too long.";s:17:"invalid_too_short";s:24:"This input is too short.";s:17:"captcha_not_match";s:31:"Your entered code is incorrect.";s:14:"invalid_number";s:28:"Number format seems invalid.";s:16:"number_too_small";s:25:"This number is too small.";s:16:"number_too_large";s:25:"This number is too large.";s:13:"invalid_email";s:28:"Email address seems invalid.";s:11:"invalid_url";s:18:"URL seems invalid.";s:11:"invalid_tel";s:31:"Telephone number seems invalid.";s:23:"quiz_answer_not_correct";s:27:"Your answer is not correct.";s:12:"invalid_date";s:26:"Date format seems invalid.";s:14:"date_too_early";s:23:"This date is too early.";s:13:"date_too_late";s:22:"This date is too late.";s:13:"upload_failed";s:22:"Failed to upload file.";s:24:"upload_file_type_invalid";s:30:"This file type is not allowed.";s:21:"upload_file_too_large";s:23:"This file is too large.";s:23:"upload_failed_php_error";s:38:"Failed to upload file. Error occurred.";}'),
(555, 102, '_additional_settings', ''),
(556, 102, '_locale', 'en_US');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE `wp_posts` (
`ID` bigint(20) unsigned NOT NULL,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=106 ;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2015-02-15 22:08:09', '2015-02-15 22:08:09', 'Hello!!', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2015-03-03 22:01:13', '2015-03-03 22:01:13', '', 0, 'http://spikebook.co/wp/?p=1', 0, 'post', '', 1),
(2, 1, '2015-02-15 22:08:09', '2015-02-15 22:08:09', '<blockquote>Hi there! This is a resume book created for New York University Incubator SPIKE interns.</blockquote>', 'About', '', 'private', 'open', 'open', '', 'about', '', '', '2015-04-21 14:35:13', '2015-04-21 18:35:13', '', 0, 'http://spikebook.co/wp/?page_id=2', 0, 'page', '', 0),
(4, 1, '2015-02-25 18:41:46', '2015-02-25 18:41:46', '', 'Blog', '', 'publish', 'open', 'open', '', 'blog', '', '', '2015-02-25 18:41:46', '2015-02-25 18:41:46', '', 0, 'http://spikebook.co/wp/?page_id=4', 0, 'page', '', 0),
(5, 1, '2015-02-25 18:41:46', '2015-02-25 18:41:46', '', 'Blog', '', 'inherit', 'open', 'open', '', '4-revision-v1', '', '', '2015-02-25 18:41:46', '2015-02-25 18:41:46', '', 4, 'http://spikebook.co/wp/4-revision-v1/', 0, 'revision', '', 0),
(6, 1, '2015-02-25 18:43:08', '2015-02-25 18:43:08', '<h1>Cohort - S15</h1>\r\n<h2>Engineering</h2>\r\n-<a title="Harika Yedidi" href="http://localhost/harika/" target="_blank">Harika Yedidi 2015</a>\r\n', 'Home', '', 'publish', 'open', 'open', '', 'home', '', '', '2015-04-22 23:13:27', '2015-04-23 03:13:27', '', 0, 'http://spikebook.co/wp/?page_id=6', 0, 'page', '', 0),
(7, 1, '2015-02-25 18:43:08', '2015-02-25 18:43:08', '', 'Home', '', 'inherit', 'open', 'open', '', '6-revision-v1', '', '', '2015-02-25 18:43:08', '2015-02-25 18:43:08', '', 6, 'http://spikebook.co/wp/6-revision-v1/', 0, 'revision', '', 0),
(9, 1, '2015-03-03 21:12:15', '2015-03-03 21:12:15', '<p>Your Name (required)<br />\n    [text* your-name] </p>\n\n<p>Your Email (required)<br />\n    [email* your-email] </p>\n\n<p>Subject<br />\n    [text your-subject] </p>\n\n<p>Your Message<br />\n    [textarea your-message] </p>\n\n<p>[submit "Send"]</p>\n[your-subject]\n[your-name] <admin@spikebook.co>\nFrom: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on My Blog (http://spikebook.co/wp)\nadmin@spikebook.co\nReply-To: [your-email]\n\n0\n0\n\n[your-subject]\nMy Blog <admin@spikebook.co>\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on My Blog (http://spikebook.co/wp)\n[your-email]\nReply-To: admin@spikebook.co\n\n0\n0\nYour message was sent successfully. Thanks.\nFailed to send your message. Please try later or contact the administrator by another method.\nValidation errors occurred. Please confirm the fields and submit it again.\nFailed to send your message. Please try later or contact the administrator by another method.\nPlease accept the terms to proceed.\nPlease fill the required field.', 'Contact form 1', '', 'publish', 'open', 'open', '', 'contact-form-1', '', '', '2015-03-03 21:12:15', '2015-03-03 21:12:15', '', 0, 'http://spikebook.co/wp/?post_type=wpcf7_contact_form&p=9', 0, 'wpcf7_contact_form', '', 0),
(11, 1, '2015-03-03 21:57:58', '2015-03-03 21:57:58', '<blockquote>Hi there! This is a resume book created for New York University Incubator SPIKE interns.</blockquote>', 'About', '', 'inherit', 'open', 'open', '', '2-revision-v1', '', '', '2015-03-03 21:57:58', '2015-03-03 21:57:58', '', 2, 'http://spikebook.co/wp/2-revision-v1/', 0, 'revision', '', 0),
(12, 1, '2015-03-03 22:01:13', '2015-03-03 22:01:13', 'Hello!!', 'Hello world!', '', 'inherit', 'open', 'open', '', '1-revision-v1', '', '', '2015-03-03 22:01:13', '2015-03-03 22:01:13', '', 1, 'http://spikebook.co/wp/1-revision-v1/', 0, 'revision', '', 0),
(20, 1, '2015-03-04 14:27:35', '2015-03-04 19:27:35', '', 'Test', '', 'publish', 'closed', 'closed', '', '20', '', '', '2015-03-04 14:27:42', '2015-03-04 19:27:42', '', 0, 'http://spikebook.co/wp/?post_type=portfolio&#038;p=20', 0, 'portfolio', '', 0),
(22, 1, '2015-03-07 18:20:19', '2015-03-07 23:20:19', 'TEST', 'Home', '', 'inherit', 'open', 'open', '', '6-revision-v1', '', '', '2015-03-07 18:20:19', '2015-03-07 23:20:19', '', 6, 'http://spikebook.co/wp/6-revision-v1/', 0, 'revision', '', 0),
(23, 1, '2015-03-07 18:21:23', '2015-03-07 23:21:23', 'Cohort S15\n<h1>Cohort - S15</h1>\n-Student Name ‘Year\n\n-Student Name ‘Year\n\n-Student Name ‘Year\n\n&nbsp;', 'Home', '', 'inherit', 'open', 'open', '', '6-autosave-v1', '', '', '2015-03-07 18:21:23', '2015-03-07 23:21:23', '', 6, 'http://spikebook.co/wp/6-autosave-v1/', 0, 'revision', '', 0),
(24, 1, '2015-03-07 18:22:16', '2015-03-07 23:22:16', '<h1>Cohort - S15</h1>\r\n<h2>Engineering</h2>\r\n-Student Name ‘Year\r\n-Student Name ‘Year\r\n-Student Name ‘Year', 'Home', '', 'inherit', 'open', 'open', '', '6-revision-v1', '', '', '2015-03-07 18:22:16', '2015-03-07 23:22:16', '', 6, 'http://spikebook.co/wp/6-revision-v1/', 0, 'revision', '', 0),
(25, 1, '2015-03-09 00:47:09', '2015-03-09 04:47:09', '', 'Activity', '', 'publish', 'closed', 'closed', '', 'activity', '', '', '2015-03-09 00:47:09', '2015-03-09 04:47:09', '', 0, 'http://spikebook.co/wp/activity/', 0, 'page', '', 0),
(26, 1, '2015-03-09 00:47:09', '2015-03-09 04:47:09', '', 'Members', '', 'publish', 'closed', 'closed', '', 'members', '', '', '2015-03-09 00:47:09', '2015-03-09 04:47:09', '', 0, 'http://spikebook.co/wp/members/', 0, 'page', '', 0),
(28, 1, '2015-03-31 14:40:31', '2015-03-31 18:40:31', 'Harika Yedidi', 'Members', '', 'inherit', 'open', 'open', '', '26-autosave-v1', '', '', '2015-03-31 14:40:31', '2015-03-31 18:40:31', '', 26, 'http://spikebook.co/wp/26-autosave-v1/', 0, 'revision', '', 0),
(30, 1, '2015-03-31 15:48:50', '2015-03-31 19:48:50', '', 'Harika Yedidi', '', 'publish', 'closed', 'closed', '', 'harika-yedidi', '', '', '2015-03-31 15:48:50', '2015-03-31 19:48:50', '', 0, 'http://spikebook.co/wp/?post_type=portfolio&#038;p=30', 0, 'portfolio', '', 0),
(33, 1, '2015-03-31 22:26:11', '2015-04-01 02:26:11', '<h1>Cohort - S15</h1>\r\n<h2>Engineering</h2>\r\n-Harika Yedidi 2015\r\n\r\n-Student Name ‘Year\r\n-Student Name ‘Year\r\n-Student Name ‘Year', 'Home', '', 'inherit', 'open', 'open', '', '6-revision-v1', '', '', '2015-03-31 22:26:11', '2015-04-01 02:26:11', '', 6, 'http://spikebook.co/wp/6-revision-v1/', 0, 'revision', '', 0),
(35, 1, '2015-03-31 23:01:05', '2015-04-01 03:01:05', '<h1>Cohort - S15</h1>\r\n<h2>Engineering</h2>\r\n-<a title="Harika Yedidi" href="http://spikebook.co/wp/portfolio/harika-yedidi/" target="_blank">Harika Yedidi 2015</a>\r\n\r\n-Student Name ‘Year\r\n-Student Name ‘Year\r\n-Student Name ‘Year', 'Home', '', 'inherit', 'open', 'open', '', '6-revision-v1', '', '', '2015-03-31 23:01:05', '2015-04-01 03:01:05', '', 6, 'http://spikebook.co/wp/6-revision-v1/', 0, 'revision', '', 0),
(36, 1, '2015-04-03 21:25:26', '2015-04-04 01:25:26', '[theme-my-login]', 'Log In', '', 'publish', 'closed', 'closed', '', 'login', '', '', '2015-04-04 00:26:24', '2015-04-04 04:26:24', '', 0, 'http://spikebook.co/wp/login/', 0, 'page', '', 0),
(37, 1, '2015-04-03 21:25:26', '2015-04-04 01:25:26', '[theme-my-login]', 'Log Out', '', 'publish', 'closed', 'closed', '', 'logout', '', '', '2015-04-03 21:25:26', '2015-04-04 01:25:26', '', 0, 'http://spikebook.co/wp/logout/', 0, 'page', '', 0),
(38, 1, '2015-04-03 21:25:26', '2015-04-04 01:25:26', '[theme-my-login]', 'Register', '', 'publish', 'closed', 'closed', '', 'register', '', '', '2015-04-03 21:25:26', '2015-04-04 01:25:26', '', 0, 'http://spikebook.co/wp/register/', 0, 'page', '', 0),
(39, 1, '2015-04-03 21:25:26', '2015-04-04 01:25:26', '[theme-my-login]', 'Lost Password', '', 'publish', 'closed', 'closed', '', 'lostpassword', '', '', '2015-04-03 21:25:26', '2015-04-04 01:25:26', '', 0, 'http://spikebook.co/wp/lostpassword/', 0, 'page', '', 0),
(40, 1, '2015-04-03 21:25:26', '2015-04-04 01:25:26', '[theme-my-login]', 'Reset Password', '', 'publish', 'closed', 'closed', '', 'resetpass', '', '', '2015-04-03 21:25:26', '2015-04-04 01:25:26', '', 0, 'http://spikebook.co/wp/resetpass/', 0, 'page', '', 0),
(41, 1, '2015-04-03 21:26:11', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-03 21:26:11', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=41', 1, 'nav_menu_item', '', 0),
(42, 1, '2015-04-03 21:26:12', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-03 21:26:12', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=42', 1, 'nav_menu_item', '', 0),
(43, 1, '2015-04-03 21:26:12', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-03 21:26:12', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=43', 1, 'nav_menu_item', '', 0),
(44, 1, '2015-04-03 21:26:12', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-03 21:26:12', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=44', 1, 'nav_menu_item', '', 0),
(45, 1, '2015-04-03 21:26:12', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-03 21:26:12', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=45', 1, 'nav_menu_item', '', 0),
(46, 1, '2015-04-03 21:26:12', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-03 21:26:12', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=46', 1, 'nav_menu_item', '', 0),
(47, 1, '2015-04-03 21:26:12', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-03 21:26:12', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=47', 1, 'nav_menu_item', '', 0),
(48, 1, '2015-04-03 21:26:12', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-03 21:26:12', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=48', 1, 'nav_menu_item', '', 0),
(49, 1, '2015-04-03 21:26:12', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-03 21:26:12', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=49', 1, 'nav_menu_item', '', 0),
(50, 1, '2015-04-03 21:26:12', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-03 21:26:12', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=50', 1, 'nav_menu_item', '', 0),
(51, 1, '2015-04-03 21:26:12', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-03 21:26:12', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=51', 1, 'nav_menu_item', '', 0),
(52, 1, '2015-04-03 21:26:46', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-03 21:26:46', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=52', 1, 'nav_menu_item', '', 0),
(53, 1, '2015-04-03 21:26:46', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-03 21:26:46', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=53', 1, 'nav_menu_item', '', 0),
(54, 1, '2015-04-03 21:26:46', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-03 21:26:46', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=54', 1, 'nav_menu_item', '', 0),
(55, 1, '2015-04-03 21:26:46', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-03 21:26:46', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=55', 1, 'nav_menu_item', '', 0),
(56, 1, '2015-04-03 21:26:46', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-03 21:26:46', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=56', 1, 'nav_menu_item', '', 0),
(57, 1, '2015-04-03 21:26:46', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-03 21:26:46', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=57', 1, 'nav_menu_item', '', 0),
(58, 1, '2015-04-03 21:26:46', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-03 21:26:46', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=58', 1, 'nav_menu_item', '', 0),
(59, 1, '2015-04-03 21:26:46', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-03 21:26:46', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=59', 1, 'nav_menu_item', '', 0),
(60, 1, '2015-04-03 21:26:46', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-03 21:26:46', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=60', 1, 'nav_menu_item', '', 0),
(61, 1, '2015-04-03 21:26:46', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-03 21:26:46', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=61', 1, 'nav_menu_item', '', 0),
(62, 1, '2015-04-03 21:26:46', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-03 21:26:46', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=62', 1, 'nav_menu_item', '', 0),
(63, 1, '2015-04-03 21:28:53', '2015-04-04 01:28:53', ' ', '', '', 'publish', 'open', 'open', '', '63', '', '', '2015-04-04 01:05:27', '2015-04-04 05:05:27', '', 0, 'http://spikebook.co/wp/?p=63', 1, 'nav_menu_item', '', 0),
(64, 1, '2015-04-03 21:28:53', '2015-04-04 01:28:53', ' ', '', '', 'publish', 'open', 'open', '', '64', '', '', '2015-04-04 01:05:27', '2015-04-04 05:05:27', '', 0, 'http://spikebook.co/wp/?p=64', 2, 'nav_menu_item', '', 0),
(66, 1, '2015-04-03 21:27:17', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-03 21:27:17', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=66', 1, 'nav_menu_item', '', 0),
(68, 1, '2015-04-03 21:28:53', '2015-04-04 01:28:53', ' ', '', '', 'publish', 'open', 'open', '', '68', '', '', '2015-04-04 01:05:27', '2015-04-04 05:05:27', '', 0, 'http://spikebook.co/wp/?p=68', 4, 'nav_menu_item', '', 0),
(69, 1, '2015-04-03 21:27:17', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-03 21:27:17', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=69', 1, 'nav_menu_item', '', 0),
(72, 1, '2015-04-03 21:28:53', '2015-04-04 01:28:53', ' ', '', '', 'publish', 'open', 'open', '', '72', '', '', '2015-04-04 01:05:27', '2015-04-04 05:05:27', '', 0, 'http://spikebook.co/wp/?p=72', 3, 'nav_menu_item', '', 0),
(74, 1, '2015-04-03 21:28:30', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-03 21:28:30', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=74', 1, 'nav_menu_item', '', 0),
(75, 1, '2015-04-03 21:28:30', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-03 21:28:30', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=75', 1, 'nav_menu_item', '', 0),
(76, 1, '2015-04-03 21:28:30', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-03 21:28:30', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=76', 1, 'nav_menu_item', '', 0),
(77, 1, '2015-04-03 21:28:30', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-03 21:28:30', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=77', 1, 'nav_menu_item', '', 0),
(78, 1, '2015-04-03 21:41:16', '2015-04-04 01:41:16', '[theme-my-login]', 'Your Profile', '', 'publish', 'closed', 'closed', '', 'your-profile', '', '', '2015-04-03 21:41:16', '2015-04-04 01:41:16', '', 0, 'http://spikebook.co/wp/your-profile/', 0, 'page', '', 0),
(79, 1, '2015-04-04 00:09:44', '2015-04-04 04:09:44', '[theme-my-login show_reg_link=0]', 'Log In', '', 'inherit', 'open', 'open', '', '36-revision-v1', '', '', '2015-04-04 00:09:44', '2015-04-04 04:09:44', '', 36, 'http://spikebook.co/wp/36-revision-v1/', 0, 'revision', '', 0),
(81, 1, '2015-04-04 00:18:11', '2015-04-04 04:18:11', ' ', '', '', 'publish', 'open', 'open', '', '81', '', '', '2015-04-04 00:28:42', '2015-04-04 04:28:42', '', 0, 'http://spikebook.co/wp/?p=81', 3, 'nav_menu_item', '', 0),
(82, 1, '2015-04-04 00:17:28', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-04 00:17:28', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=82', 1, 'nav_menu_item', '', 0),
(84, 1, '2015-04-04 00:18:11', '2015-04-04 04:18:11', ' ', '', '', 'publish', 'open', 'open', '', '84', '', '', '2015-04-04 00:28:42', '2015-04-04 04:28:42', '', 0, 'http://spikebook.co/wp/?p=84', 4, 'nav_menu_item', '', 0),
(85, 1, '2015-04-04 00:18:11', '2015-04-04 04:18:11', ' ', '', '', 'publish', 'open', 'open', '', '85', '', '', '2015-04-04 00:28:42', '2015-04-04 04:28:42', '', 0, 'http://spikebook.co/wp/?p=85', 5, 'nav_menu_item', '', 0),
(86, 1, '2015-04-04 00:18:11', '2015-04-04 04:18:11', ' ', '', '', 'publish', 'open', 'open', '', '86', '', '', '2015-04-04 00:28:42', '2015-04-04 04:28:42', '', 0, 'http://spikebook.co/wp/?p=86', 1, 'nav_menu_item', '', 0),
(87, 1, '2015-04-04 00:18:11', '2015-04-04 04:18:11', ' ', '', '', 'publish', 'open', 'open', '', '87', '', '', '2015-04-04 00:28:42', '2015-04-04 04:28:42', '', 0, 'http://spikebook.co/wp/?p=87', 2, 'nav_menu_item', '', 0),
(88, 1, '2015-04-04 00:26:24', '2015-04-04 04:26:24', '[theme-my-login]', 'Log In', '', 'inherit', 'open', 'open', '', '36-revision-v1', '', '', '2015-04-04 00:26:24', '2015-04-04 04:26:24', '', 36, 'http://spikebook.co/wp/36-revision-v1/', 0, 'revision', '', 0),
(89, 1, '2015-04-04 00:28:42', '2015-04-04 04:28:42', ' ', '', '', 'publish', 'open', 'open', '', '89', '', '', '2015-04-04 00:28:42', '2015-04-04 04:28:42', '', 0, 'http://spikebook.co/wp/?p=89', 6, 'nav_menu_item', '', 0),
(90, 1, '2015-04-04 00:54:43', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-04-04 00:54:43', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/wp/?p=90', 1, 'nav_menu_item', '', 0),
(91, 1, '2015-04-04 00:55:06', '2015-04-04 04:55:06', ' ', '', '', 'publish', 'open', 'open', '', '91', '', '', '2015-04-04 00:57:23', '2015-04-04 04:57:23', '', 0, 'http://spikebook.co/wp/?p=91', 3, 'nav_menu_item', '', 0),
(92, 1, '2015-04-04 00:55:06', '2015-04-04 04:55:06', ' ', '', '', 'publish', 'open', 'open', '', '92', '', '', '2015-04-04 00:57:23', '2015-04-04 04:57:23', '', 0, 'http://spikebook.co/wp/?p=92', 4, 'nav_menu_item', '', 0),
(93, 1, '2015-04-04 00:55:06', '2015-04-04 04:55:06', ' ', '', '', 'publish', 'open', 'open', '', '93', '', '', '2015-04-04 00:57:23', '2015-04-04 04:57:23', '', 0, 'http://spikebook.co/wp/?p=93', 5, 'nav_menu_item', '', 0),
(94, 1, '2015-04-04 00:55:06', '2015-04-04 04:55:06', ' ', '', '', 'publish', 'open', 'open', '', '94', '', '', '2015-04-04 00:57:23', '2015-04-04 04:57:23', '', 0, 'http://spikebook.co/wp/?p=94', 1, 'nav_menu_item', '', 0),
(95, 1, '2015-04-04 00:55:06', '2015-04-04 04:55:06', ' ', '', '', 'publish', 'open', 'open', '', '95', '', '', '2015-04-04 00:57:23', '2015-04-04 04:57:23', '', 0, 'http://spikebook.co/wp/?p=95', 2, 'nav_menu_item', '', 0),
(97, 1, '2015-04-09 17:19:35', '2015-04-09 21:19:35', '', 'Harika', '', 'publish', 'open', 'open', '', 'harika', '', '', '2015-04-09 17:28:01', '2015-04-09 21:28:01', '', 0, 'http://spikebook.co/?page_id=97', 0, 'page', '', 0),
(98, 1, '2015-04-09 17:19:35', '2015-04-09 21:19:35', '', 'Harika', '', 'inherit', 'open', 'open', '', '97-revision-v1', '', '', '2015-04-09 17:19:35', '2015-04-09 21:19:35', '', 97, 'http://spikebook.co/97-revision-v1/', 0, 'revision', '', 0),
(99, 1, '2015-04-16 21:26:49', '2015-04-17 01:26:49', '<h1>Cohort - S15</h1>\r\n<h2>Engineering</h2>\r\n-<a title="Harika Yedidi" href="http://spikebook.co/harika/" target="_blank">Harika Yedidi 2015</a>\r\n\r\n-Student Name ‘Year\r\n-Student Name ‘Year\r\n-Student Name ‘Year', 'Home', '', 'inherit', 'open', 'open', '', '6-revision-v1', '', '', '2015-04-16 21:26:49', '2015-04-17 01:26:49', '', 6, 'http://spikebook.co/6-revision-v1/', 0, 'revision', '', 0),
(100, 1, '2015-04-20 20:28:25', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-04-20 20:28:25', '0000-00-00 00:00:00', '', 0, 'http://spikebook.co/?p=100', 0, 'post', '', 0),
(101, 1, '2015-04-21 16:04:22', '2015-04-21 20:04:22', '', 'Activate', '', 'publish', 'closed', 'closed', '', 'activate', '', '', '2015-04-21 16:04:22', '2015-04-21 20:04:22', '', 0, 'http://spikebook.co/activate/', 0, 'page', '', 0),
(102, 1, '2015-04-21 16:21:30', '2015-04-21 20:21:30', '<p>Your Name (required)<br />\r\n    [text* your-name] </p>\r\n\r\n<p>Your Email (required)<br />\r\n    [email* your-email] </p>\r\n\r\n<p>Subject<br />\r\n    [text your-subject] </p>\r\n\r\n<p>Your Message<br />\r\n    [textarea your-message] </p>\r\n\r\n<p>[submit "Send"]</p>\n[your-subject]\n[your-name] <admin@spikebook.co>\nFrom: [your-name] <[your-email]>\r\nSubject: [your-subject]\r\n\r\nMessage Body:\r\n[your-message]\r\n\r\n--\r\nThis e-mail was sent from a contact form on SPIKEBOOK (http://spikebook.co)\nadmin@spikebook.co\nReply-To: [your-email]\n\n\n\n\n[your-subject]\nSPIKEBOOK <admin@spikebook.co>\nMessage Body:\r\n[your-message]\r\n\r\n--\r\nThis e-mail was sent from a contact form on SPIKEBOOK (http://spikebook.co)\n[your-email]\nReply-To: admin@spikebook.co\n\n\n\nYour message was sent successfully. Thanks.\nFailed to send your message. Please try later or contact the administrator by another method.\nValidation errors occurred. Please confirm the fields and submit it again.\nFailed to send your message. Please try later or contact the administrator by another method.\nPlease accept the terms to proceed.\nPlease fill in the required field.\nThis input is too long.\nThis input is too short.\nYour entered code is incorrect.\nNumber format seems invalid.\nThis number is too small.\nThis number is too large.\nEmail address seems invalid.\nURL seems invalid.\nTelephone number seems invalid.\nYour answer is not correct.\nDate format seems invalid.\nThis date is too early.\nThis date is too late.\nFailed to upload file.\nThis file type is not allowed.\nThis file is too large.\nFailed to upload file. Error occurred.', 'Get in touch', '', 'publish', 'open', 'open', '', 'get-in-touch', '', '', '2015-04-21 16:21:30', '2015-04-21 20:21:30', '', 0, 'http://spikebook.co/?post_type=wpcf7_contact_form&p=102', 0, 'wpcf7_contact_form', '', 0),
(103, 1, '2015-04-22 23:09:31', '2015-04-23 03:09:31', '<h1>Cohort - S15</h1>\r\n<h2>Engineering</h2>\r\n-<a title="Harika Yedidi" href="http://spikebook.co/harika/" target="_blank">Harika Yedidi 2015</a>\r\n', 'Home', '', 'inherit', 'open', 'open', '', '6-revision-v1', '', '', '2015-04-22 23:09:31', '2015-04-23 03:09:31', '', 6, 'http://localhost/6-revision-v1/', 0, 'revision', '', 0),
(104, 1, '2015-04-22 23:13:27', '2015-04-23 03:13:27', '<h1>Cohort - S15</h1>\r\n<h2>Engineering</h2>\r\n-<a title="Harika Yedidi" href="http://localhost/harika/" target="_blank">Harika Yedidi 2015</a>\r\n', 'Home', '', 'inherit', 'open', 'open', '', '6-revision-v1', '', '', '2015-04-22 23:13:27', '2015-04-23 03:13:27', '', 6, 'http://localhost/6-revision-v1/', 0, 'revision', '', 0),
(105, 1, '2015-04-23 14:49:27', '2015-04-23 18:49:27', '', 'Groups', '', 'publish', 'closed', 'closed', '', 'groups', '', '', '2015-04-23 14:49:27', '2015-04-23 18:49:27', '', 0, 'http://localhost/groups/', 0, 'page', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_signups`
--

CREATE TABLE `wp_signups` (
`signup_id` bigint(20) NOT NULL,
  `domain` varchar(200) NOT NULL DEFAULT '',
  `path` varchar(100) NOT NULL DEFAULT '',
  `title` longtext NOT NULL,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `activation_key` varchar(50) NOT NULL DEFAULT '',
  `meta` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE `wp_terms` (
`term_id` bigint(20) unsigned NOT NULL,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'logged-out', 'logged-out', 0),
(3, 'logged-in', 'logged-in', 0),
(4, 'menu1', 'menu1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(63, 2, 0),
(64, 2, 0),
(68, 2, 0),
(72, 2, 0),
(81, 3, 0),
(84, 3, 0),
(85, 3, 0),
(86, 3, 0),
(87, 3, 0),
(89, 3, 0),
(91, 4, 0),
(92, 4, 0),
(93, 4, 0),
(94, 4, 0),
(95, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
`term_taxonomy_id` bigint(20) unsigned NOT NULL,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'nav_menu', '', 0, 4),
(3, 3, 'nav_menu', '', 0, 6),
(4, 4, 'nav_menu', '', 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
`umeta_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', 'wp360_locks,wp390_widgets,wp410_dfw'),
(13, 1, 'show_welcome_panel', '1'),
(14, 1, 'session_tokens', 'a:2:{s:64:"4ffc85e2b6fb7f5c804e9b9581cb3c797d6bc584ae26df68d797b1d9d654ac78";a:4:{s:10:"expiration";i:1430336514;s:2:"ip";s:3:"::1";s:2:"ua";s:120:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36";s:5:"login";i:1430163714;}s:64:"515b8e9cda45161da910bf22b11b11443a21753654adb638d2a6598321ed6a96";a:4:{s:10:"expiration";i:1430413876;s:2:"ip";s:3:"::1";s:2:"ua";s:120:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36";s:5:"login";i:1430241076;}}'),
(15, 1, 'wp_dashboard_quick_press_last_post_id', '100'),
(16, 2, 'nickname', 'Terrence'),
(17, 2, 'first_name', ''),
(18, 2, 'last_name', ''),
(19, 2, 'description', ''),
(20, 2, 'rich_editing', 'true'),
(21, 2, 'comment_shortcuts', 'false'),
(22, 2, 'admin_color', 'fresh'),
(23, 2, 'use_ssl', '0'),
(24, 2, 'show_admin_bar_front', 'true'),
(25, 2, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(26, 2, 'wp_user_level', '10'),
(27, 2, 'dismissed_wp_pointers', 'wp360_locks,wp390_widgets'),
(28, 1, 'managenav-menuscolumnshidden', 'a:4:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";}'),
(29, 1, 'metaboxhidden_nav-menus', 'a:7:{i:0;s:8:"add-post";i:1;s:13:"add-education";i:2;s:14:"add-employment";i:3;s:15:"add-recognition";i:4;s:13:"add-portfolio";i:5;s:15:"add-testimonial";i:6;s:12:"add-post_tag";}'),
(30, 1, 'wp_user-settings', 'editor=html&wplink=1&mfold=o'),
(31, 1, 'wp_user-settings-time', '1428120580'),
(32, 1, 'last_activity', '2015-04-27 21:53:36'),
(33, 3, 'nickname', 'test'),
(34, 3, 'first_name', 'test'),
(35, 3, 'last_name', 'user'),
(36, 3, 'description', ''),
(37, 3, 'rich_editing', 'true'),
(38, 3, 'comment_shortcuts', 'false'),
(39, 3, 'admin_color', 'fresh'),
(40, 3, 'use_ssl', '0'),
(41, 3, 'show_admin_bar_front', 'true'),
(42, 3, 'wp_capabilities', 'a:1:{s:7:"student";b:1;}'),
(43, 3, 'wp_user_level', '0'),
(44, 3, 'dismissed_wp_pointers', 'wp360_locks,wp390_widgets'),
(46, 3, 'last_activity', '2015-04-23 19:23:01'),
(49, 1, 'nav_menu_recently_edited', '2'),
(50, 1, 'closedpostboxes_page', 'a:0:{}'),
(51, 1, 'metaboxhidden_page', 'a:5:{i:0;s:10:"postcustom";i:1;s:16:"commentstatusdiv";i:2;s:11:"commentsdiv";i:3;s:7:"slugdiv";i:4;s:9:"authordiv";}'),
(53, 4, 'nickname', 'recruiter-test'),
(54, 4, 'first_name', ''),
(55, 4, 'last_name', ''),
(56, 4, 'description', ''),
(57, 4, 'rich_editing', 'true'),
(58, 4, 'comment_shortcuts', 'false'),
(59, 4, 'admin_color', 'fresh'),
(60, 4, 'use_ssl', '0'),
(61, 4, 'show_admin_bar_front', 'true'),
(62, 4, 'wp_capabilities', 'a:1:{s:10:"subscriber";b:1;}'),
(63, 4, 'wp_user_level', '0'),
(64, 4, 'default_password_nag', ''),
(65, 5, 'nickname', 'harikayedidi'),
(66, 5, 'first_name', 'Harika'),
(67, 5, 'last_name', 'Yedidi'),
(68, 5, 'description', ''),
(69, 5, 'rich_editing', 'true'),
(70, 5, 'comment_shortcuts', 'false'),
(71, 5, 'admin_color', 'fresh'),
(72, 5, 'use_ssl', '0'),
(73, 5, 'show_admin_bar_front', 'true'),
(74, 5, 'wp_capabilities', 'a:1:{s:10:"subscriber";b:1;}'),
(75, 5, 'wp_user_level', '0'),
(76, 5, 'default_password_nag', '1'),
(78, 5, 'last_activity', '2015-04-21 20:00:10'),
(79, 4, 'session_tokens', 'a:2:{s:64:"980f79eb5e4008344a9f8e55fa77494504c008b41782a692aed62be31b5e094c";a:4:{s:10:"expiration";i:1430855842;s:2:"ip";s:14:"165.254.84.238";s:2:"ua";s:120:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36";s:5:"login";i:1429646242;}s:64:"0679a3e728354df595f265f591e63d2ae6da822a49ec79ea18af9364e391a35e";a:4:{s:10:"expiration";i:1430855865;s:2:"ip";s:14:"165.254.84.238";s:2:"ua";s:120:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36";s:5:"login";i:1429646265;}}'),
(80, 4, 'last_activity', '2015-04-21 19:57:23'),
(81, 1, 'meta-box-order_dashboard', 'a:4:{s:6:"normal";s:38:"dashboard_right_now,dashboard_activity";s:4:"side";s:39:"dashboard_quick_press,dashboard_primary";s:7:"column3";s:0:"";s:7:"column4";s:0:"";}'),
(83, 3, 'session_tokens', 'a:1:{s:64:"aeac8328ef8f37d7de2a3388b5e91aae962a17c09339d08bd9df85026266baa1";a:4:{s:10:"expiration";i:1429988032;s:2:"ip";s:3:"::1";s:2:"ua";s:120:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36";s:5:"login";i:1429815232;}}'),
(85, 1, 'total_group_count', '1'),
(86, 3, 'total_group_count', '1'),
(87, 1, 'bp_xprofile_visibility_levels', 'a:1:{i:2;s:6:"public";}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE `wp_users` (
`ID` bigint(20) unsigned NOT NULL,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BhEGthXk6O1u1q62Uwuq6PsuHGBiw1/', 'admin', 'admin@spikebook.co', '', '2015-02-15 22:08:09', '', 0, 'admin'),
(2, 'Terrence', '$P$B8Dv0CvTgWmS.jnPv94TezPdw4ufJt0', 'terrence', 'terrence.agbi@gmail.com', '', '2015-03-01 20:43:14', '', 0, 'Terrence'),
(3, 'test', '$P$BLj8ZfRzCeBSrjr6kD29E3f/hFyqCE/', 'test', 'km3056@nyu.edu', '', '2015-04-04 00:36:47', '', 0, 'Test user'),
(4, 'recruiter-test', '$P$Br3mqvQ/GRtOjqE5rx83tQW9ypc/d./', 'recruiter-test', 'ghettohippie115@gmail.com', '', '2015-04-21 19:48:42', '', 0, 'recruiter-test'),
(5, 'harikayedidi', '$P$BkZpEZ0I6y0VNQclVGUUnC9OuMT5dl1', 'harikayedidi', 'hy837@nyu.edu', '', '2015-04-21 19:53:46', '', 0, 'harikayedidi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wp_bp_activity`
--
ALTER TABLE `wp_bp_activity`
 ADD PRIMARY KEY (`id`), ADD KEY `date_recorded` (`date_recorded`), ADD KEY `user_id` (`user_id`), ADD KEY `item_id` (`item_id`), ADD KEY `secondary_item_id` (`secondary_item_id`), ADD KEY `component` (`component`), ADD KEY `type` (`type`), ADD KEY `mptt_left` (`mptt_left`), ADD KEY `mptt_right` (`mptt_right`), ADD KEY `hide_sitewide` (`hide_sitewide`), ADD KEY `is_spam` (`is_spam`);

--
-- Indexes for table `wp_bp_activity_meta`
--
ALTER TABLE `wp_bp_activity_meta`
 ADD PRIMARY KEY (`id`), ADD KEY `activity_id` (`activity_id`), ADD KEY `meta_key` (`meta_key`);

--
-- Indexes for table `wp_bp_friends`
--
ALTER TABLE `wp_bp_friends`
 ADD PRIMARY KEY (`id`), ADD KEY `initiator_user_id` (`initiator_user_id`), ADD KEY `friend_user_id` (`friend_user_id`);

--
-- Indexes for table `wp_bp_groups`
--
ALTER TABLE `wp_bp_groups`
 ADD PRIMARY KEY (`id`), ADD KEY `creator_id` (`creator_id`), ADD KEY `status` (`status`);

--
-- Indexes for table `wp_bp_groups_groupmeta`
--
ALTER TABLE `wp_bp_groups_groupmeta`
 ADD PRIMARY KEY (`id`), ADD KEY `group_id` (`group_id`), ADD KEY `meta_key` (`meta_key`);

--
-- Indexes for table `wp_bp_groups_members`
--
ALTER TABLE `wp_bp_groups_members`
 ADD PRIMARY KEY (`id`), ADD KEY `group_id` (`group_id`), ADD KEY `is_admin` (`is_admin`), ADD KEY `is_mod` (`is_mod`), ADD KEY `user_id` (`user_id`), ADD KEY `inviter_id` (`inviter_id`), ADD KEY `is_confirmed` (`is_confirmed`);

--
-- Indexes for table `wp_bp_messages_messages`
--
ALTER TABLE `wp_bp_messages_messages`
 ADD PRIMARY KEY (`id`), ADD KEY `sender_id` (`sender_id`), ADD KEY `thread_id` (`thread_id`);

--
-- Indexes for table `wp_bp_messages_meta`
--
ALTER TABLE `wp_bp_messages_meta`
 ADD PRIMARY KEY (`id`), ADD KEY `message_id` (`message_id`), ADD KEY `meta_key` (`meta_key`);

--
-- Indexes for table `wp_bp_messages_notices`
--
ALTER TABLE `wp_bp_messages_notices`
 ADD PRIMARY KEY (`id`), ADD KEY `is_active` (`is_active`);

--
-- Indexes for table `wp_bp_messages_recipients`
--
ALTER TABLE `wp_bp_messages_recipients`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`), ADD KEY `thread_id` (`thread_id`), ADD KEY `is_deleted` (`is_deleted`), ADD KEY `sender_only` (`sender_only`), ADD KEY `unread_count` (`unread_count`);

--
-- Indexes for table `wp_bp_notifications`
--
ALTER TABLE `wp_bp_notifications`
 ADD PRIMARY KEY (`id`), ADD KEY `item_id` (`item_id`), ADD KEY `secondary_item_id` (`secondary_item_id`), ADD KEY `user_id` (`user_id`), ADD KEY `is_new` (`is_new`), ADD KEY `component_name` (`component_name`), ADD KEY `component_action` (`component_action`), ADD KEY `useritem` (`user_id`,`is_new`);

--
-- Indexes for table `wp_bp_xprofile_data`
--
ALTER TABLE `wp_bp_xprofile_data`
 ADD PRIMARY KEY (`id`), ADD KEY `field_id` (`field_id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `wp_bp_xprofile_fields`
--
ALTER TABLE `wp_bp_xprofile_fields`
 ADD PRIMARY KEY (`id`), ADD KEY `group_id` (`group_id`), ADD KEY `parent_id` (`parent_id`), ADD KEY `field_order` (`field_order`), ADD KEY `can_delete` (`can_delete`), ADD KEY `is_required` (`is_required`);

--
-- Indexes for table `wp_bp_xprofile_groups`
--
ALTER TABLE `wp_bp_xprofile_groups`
 ADD PRIMARY KEY (`id`), ADD KEY `can_delete` (`can_delete`);

--
-- Indexes for table `wp_bp_xprofile_meta`
--
ALTER TABLE `wp_bp_xprofile_meta`
 ADD PRIMARY KEY (`id`), ADD KEY `object_id` (`object_id`), ADD KEY `meta_key` (`meta_key`);

--
-- Indexes for table `wp_cimy_uef_data`
--
ALTER TABLE `wp_cimy_uef_data`
 ADD PRIMARY KEY (`ID`), ADD KEY `USER_ID` (`USER_ID`), ADD KEY `FIELD_ID` (`FIELD_ID`);

--
-- Indexes for table `wp_cimy_uef_fields`
--
ALTER TABLE `wp_cimy_uef_fields`
 ADD PRIMARY KEY (`ID`), ADD KEY `F_ORDER` (`F_ORDER`), ADD KEY `NAME` (`NAME`);

--
-- Indexes for table `wp_cimy_uef_wp_fields`
--
ALTER TABLE `wp_cimy_uef_wp_fields`
 ADD PRIMARY KEY (`ID`), ADD KEY `F_ORDER` (`F_ORDER`), ADD KEY `NAME` (`NAME`);

--
-- Indexes for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
 ADD PRIMARY KEY (`meta_id`), ADD KEY `comment_id` (`comment_id`), ADD KEY `meta_key` (`meta_key`);

--
-- Indexes for table `wp_comments`
--
ALTER TABLE `wp_comments`
 ADD PRIMARY KEY (`comment_ID`), ADD KEY `comment_post_ID` (`comment_post_ID`), ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`), ADD KEY `comment_date_gmt` (`comment_date_gmt`), ADD KEY `comment_parent` (`comment_parent`), ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `wp_links`
--
ALTER TABLE `wp_links`
 ADD PRIMARY KEY (`link_id`), ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `wp_options`
--
ALTER TABLE `wp_options`
 ADD PRIMARY KEY (`option_id`), ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
 ADD PRIMARY KEY (`meta_id`), ADD KEY `post_id` (`post_id`), ADD KEY `meta_key` (`meta_key`);

--
-- Indexes for table `wp_posts`
--
ALTER TABLE `wp_posts`
 ADD PRIMARY KEY (`ID`), ADD KEY `post_name` (`post_name`), ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`), ADD KEY `post_parent` (`post_parent`), ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `wp_signups`
--
ALTER TABLE `wp_signups`
 ADD PRIMARY KEY (`signup_id`), ADD KEY `activation_key` (`activation_key`), ADD KEY `user_email` (`user_email`), ADD KEY `user_login_email` (`user_login`,`user_email`), ADD KEY `domain_path` (`domain`,`path`);

--
-- Indexes for table `wp_terms`
--
ALTER TABLE `wp_terms`
 ADD PRIMARY KEY (`term_id`), ADD KEY `slug` (`slug`), ADD KEY `name` (`name`);

--
-- Indexes for table `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
 ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`), ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
 ADD PRIMARY KEY (`term_taxonomy_id`), ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`), ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
 ADD PRIMARY KEY (`umeta_id`), ADD KEY `user_id` (`user_id`), ADD KEY `meta_key` (`meta_key`);

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
 ADD PRIMARY KEY (`ID`), ADD KEY `user_login_key` (`user_login`), ADD KEY `user_nicename` (`user_nicename`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wp_bp_activity`
--
ALTER TABLE `wp_bp_activity`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `wp_bp_activity_meta`
--
ALTER TABLE `wp_bp_activity_meta`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_bp_friends`
--
ALTER TABLE `wp_bp_friends`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_bp_groups`
--
ALTER TABLE `wp_bp_groups`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wp_bp_groups_groupmeta`
--
ALTER TABLE `wp_bp_groups_groupmeta`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `wp_bp_groups_members`
--
ALTER TABLE `wp_bp_groups_members`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wp_bp_messages_messages`
--
ALTER TABLE `wp_bp_messages_messages`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_bp_messages_meta`
--
ALTER TABLE `wp_bp_messages_meta`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_bp_messages_notices`
--
ALTER TABLE `wp_bp_messages_notices`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_bp_messages_recipients`
--
ALTER TABLE `wp_bp_messages_recipients`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_bp_notifications`
--
ALTER TABLE `wp_bp_notifications`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_bp_xprofile_data`
--
ALTER TABLE `wp_bp_xprofile_data`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `wp_bp_xprofile_fields`
--
ALTER TABLE `wp_bp_xprofile_fields`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wp_bp_xprofile_groups`
--
ALTER TABLE `wp_bp_xprofile_groups`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wp_bp_xprofile_meta`
--
ALTER TABLE `wp_bp_xprofile_meta`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wp_cimy_uef_data`
--
ALTER TABLE `wp_cimy_uef_data`
MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_cimy_uef_fields`
--
ALTER TABLE `wp_cimy_uef_fields`
MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_cimy_uef_wp_fields`
--
ALTER TABLE `wp_cimy_uef_wp_fields`
MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
MODIFY `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `wp_comments`
--
ALTER TABLE `wp_comments`
MODIFY `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `wp_links`
--
ALTER TABLE `wp_links`
MODIFY `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_options`
--
ALTER TABLE `wp_options`
MODIFY `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1927;
--
-- AUTO_INCREMENT for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
MODIFY `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=557;
--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
MODIFY `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=106;
--
-- AUTO_INCREMENT for table `wp_signups`
--
ALTER TABLE `wp_signups`
MODIFY `signup_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_terms`
--
ALTER TABLE `wp_terms`
MODIFY `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
MODIFY `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
MODIFY `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
MODIFY `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;