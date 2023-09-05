-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 04, 2023 at 02:44 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `finance`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(2, 'admin'),
(1, 'officer');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add individual_ref', 7, 'add_individual_ref'),
(26, 'Can change individual_ref', 7, 'change_individual_ref'),
(27, 'Can delete individual_ref', 7, 'delete_individual_ref'),
(28, 'Can view individual_ref', 7, 'view_individual_ref'),
(29, 'Can add branch', 8, 'add_branch'),
(30, 'Can change branch', 8, 'change_branch'),
(31, 'Can delete branch', 8, 'delete_branch'),
(32, 'Can view branch', 8, 'view_branch'),
(33, 'Can add individual_lending', 9, 'add_individual_lending'),
(34, 'Can change individual_lending', 9, 'change_individual_lending'),
(35, 'Can delete individual_lending', 9, 'delete_individual_lending'),
(36, 'Can view individual_lending', 9, 'view_individual_lending'),
(37, 'Can add member', 10, 'add_member'),
(38, 'Can change member', 10, 'change_member'),
(39, 'Can delete member', 10, 'delete_member'),
(40, 'Can view member', 10, 'view_member'),
(41, 'Can add group_lending', 11, 'add_group_lending'),
(42, 'Can change group_lending', 11, 'change_group_lending'),
(43, 'Can delete group_lending', 11, 'delete_group_lending'),
(44, 'Can view group_lending', 11, 'view_group_lending'),
(45, 'Can add my_group', 12, 'add_my_group'),
(46, 'Can change my_group', 12, 'change_my_group'),
(47, 'Can delete my_group', 12, 'delete_my_group'),
(48, 'Can view my_group', 12, 'view_my_group'),
(49, 'Can add group_info', 13, 'add_group_info'),
(50, 'Can change group_info', 13, 'change_group_info'),
(51, 'Can delete group_info', 13, 'delete_group_info'),
(52, 'Can view group_info', 13, 'view_group_info');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$YQckGX98LMHcFsr3hvI0vh$prCZ3D7w7NFZWww0vUO1gcn9MuIbAwFc3+Yef+CGnDM=', '2023-09-03 11:37:02.003633', 1, 'admin', '', '', '', 1, 1, '2023-08-31 10:16:59.056211'),
(3, 'pbkdf2_sha256$600000$mNPHLnRM7r0gX6SrmqIrbI$jgT7bMWMmekEl24u0bzxq7dsRdHNvzdjhGax5PEWvy8=', '2023-09-04 12:12:28.090514', 0, 'admins', '', '', '', 0, 1, '2023-09-03 11:35:17.000000'),
(4, 'pbkdf2_sha256$600000$UR5XXKwvk6YqwTlqe0LJc3$zghd7ua0Jueq1oaVjKBGHbh/GO1sGqYRoh5f19N4dw8=', '2023-09-03 17:17:39.148176', 0, 'loan_officer', '', '', '', 0, 1, '2023-09-03 13:31:31.866291'),
(5, 'pbkdf2_sha256$600000$TEq0R8ITk2w860js4oAYvW$+R3lYQI0M3rZENyOdNZ7jsQD6xBnhZh7CEjwzrwiwFw=', '2023-09-03 16:45:40.844592', 0, 'magaita', '', '', '', 0, 1, '2023-09-03 14:00:46.963385'),
(6, 'pbkdf2_sha256$600000$wIvHISYyWbBNTYT6cHCKh5$pVAbA9n7JqN1/kxP5ysWSuEoxt8v73UcWt7fV9pn1o8=', '2023-09-04 11:34:30.387754', 0, 'officer', '', '', '', 0, 1, '2023-09-03 14:28:14.889314');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(2, 3, 2),
(3, 4, 1),
(4, 5, 1),
(5, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-08-31 10:40:31.599820', '1', 'Gideon', 1, '[{\"added\": {}}]', 7, 1),
(2, '2023-08-31 10:40:37.873819', '1', 'Gideon', 2, '[]', 7, 1),
(3, '2023-08-31 11:12:23.027101', '1', 'Gideon', 3, '', 7, 1),
(4, '2023-08-31 17:10:28.053697', '1', 'Nshinyanga Mjini', 1, '[{\"added\": {}}]', 8, 1),
(5, '2023-08-31 17:10:36.011732', '2', 'Kahama', 1, '[{\"added\": {}}]', 8, 1),
(6, '2023-08-31 17:10:43.532698', '3', 'Maganzo', 1, '[{\"added\": {}}]', 8, 1),
(7, '2023-08-31 17:10:49.847701', '4', 'Bahi', 1, '[{\"added\": {}}]', 8, 1),
(8, '2023-08-31 17:11:01.562702', '5', 'Segese', 1, '[{\"added\": {}}]', 8, 1),
(9, '2023-08-31 17:11:07.763701', '6', 'Kigwe', 1, '[{\"added\": {}}]', 8, 1),
(10, '2023-08-31 17:22:25.026700', '1', 'Magaita', 3, '', 9, 1),
(11, '2023-08-31 17:28:30.195552', '3', 'Magaita', 3, '', 9, 1),
(12, '2023-08-31 17:28:30.273548', '2', 'Magaita', 3, '', 9, 1),
(13, '2023-08-31 20:57:02.791020', '5', 'Geo', 2, '[{\"changed\": {\"fields\": [\"Lending date\", \"Date of return\"]}}]', 9, 1),
(14, '2023-08-31 20:57:21.345819', '4', 'Magaita', 2, '[{\"changed\": {\"fields\": [\"Lending date\", \"Date of return\"]}}]', 9, 1),
(15, '2023-08-31 21:48:28.848054', '5', 'Geo', 2, '[{\"changed\": {\"fields\": [\"Amount\", \"Returned amount\"]}}]', 9, 1),
(16, '2023-09-01 13:06:11.068303', '1', 'officer', 1, '[{\"added\": {}}]', 3, 1),
(17, '2023-09-01 13:06:16.513818', '2', 'admin', 1, '[{\"added\": {}}]', 3, 1),
(18, '2023-09-01 13:06:51.826134', '2', 'officer', 1, '[{\"added\": {}}]', 4, 1),
(19, '2023-09-01 13:07:05.510601', '2', 'officer', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(20, '2023-09-02 07:19:17.005952', '1', 'UPENDO GROUP', 1, '[{\"added\": {}}]', 11, 1),
(21, '2023-09-02 07:24:01.229955', '1', 'UPENDO GROUP', 2, '[{\"changed\": {\"fields\": [\"Phone number\"]}}]', 11, 1),
(22, '2023-09-02 08:52:17.376332', '1', 'UPENDO GROUP', 1, '[{\"added\": {}}]', 12, 1),
(23, '2023-09-02 08:52:24.071681', '2', 'UPENDO GROUP2', 1, '[{\"added\": {}}]', 12, 1),
(24, '2023-09-02 08:52:34.547393', '8', 'member1', 2, '[{\"changed\": {\"fields\": [\"Group name\"]}}]', 10, 1),
(25, '2023-09-02 08:52:40.236713', '5', 'Gideon', 2, '[{\"changed\": {\"fields\": [\"Group name\"]}}]', 10, 1),
(26, '2023-09-02 08:52:46.629795', '4', 'Gideon', 2, '[{\"changed\": {\"fields\": [\"Group name\"]}}]', 10, 1),
(27, '2023-09-02 08:52:58.013526', '8', 'Raj', 2, '[{\"changed\": {\"fields\": [\"Group name\"]}}]', 7, 1),
(28, '2023-09-02 08:53:03.964693', '7', 'Grace', 2, '[{\"changed\": {\"fields\": [\"Group name\"]}}]', 7, 1),
(29, '2023-09-02 08:59:40.044427', '8', 'member1', 2, '[{\"changed\": {\"fields\": [\"Group name\"]}}]', 10, 1),
(30, '2023-09-02 08:59:44.637613', '5', 'Gideon', 2, '[{\"changed\": {\"fields\": [\"Group name\"]}}]', 10, 1),
(31, '2023-09-02 08:59:49.067125', '4', 'Gideon', 2, '[{\"changed\": {\"fields\": [\"Group name\"]}}]', 10, 1),
(32, '2023-09-02 08:59:51.971063', '4', 'Gideon', 2, '[]', 10, 1),
(33, '2023-09-02 08:59:55.878420', '3', 'G', 2, '[]', 10, 1),
(34, '2023-09-02 09:00:02.295462', '8', 'Raj', 2, '[{\"changed\": {\"fields\": [\"Group name\"]}}]', 7, 1),
(35, '2023-09-02 09:00:05.981521', '7', 'Grace', 2, '[{\"changed\": {\"fields\": [\"Group name\"]}}]', 7, 1),
(36, '2023-09-02 09:09:55.926631', '3', 'UPENDO GROUP', 1, '[{\"added\": {}}]', 12, 1),
(37, '2023-09-02 09:09:59.516194', '4', 'UPENDO GROUP2', 1, '[{\"added\": {}}]', 12, 1),
(38, '2023-09-02 09:10:45.494126', '8', 'Raj', 2, '[{\"changed\": {\"fields\": [\"Group name\"]}}]', 7, 1),
(39, '2023-09-02 09:10:53.652825', '7', 'Grace', 2, '[{\"changed\": {\"fields\": [\"Group name\"]}}]', 7, 1),
(40, '2023-09-02 09:11:01.790053', '8', 'member1', 2, '[{\"changed\": {\"fields\": [\"Group name\"]}}]', 10, 1),
(41, '2023-09-02 09:11:07.361791', '5', 'Gideon', 2, '[{\"changed\": {\"fields\": [\"Group name\"]}}]', 10, 1),
(42, '2023-09-02 09:11:12.321456', '4', 'Gideon', 2, '[{\"changed\": {\"fields\": [\"Group name\"]}}]', 10, 1),
(43, '2023-09-02 09:11:18.409206', '3', 'G', 2, '[{\"changed\": {\"fields\": [\"Group name\"]}}]', 10, 1),
(44, '2023-09-02 10:01:21.147208', '1', 'UPENDO GROUP', 1, '[{\"added\": {}}]', 12, 1),
(45, '2023-09-02 10:01:24.201660', '2', 'UPENDO GROUP2', 1, '[{\"added\": {}}]', 12, 1),
(46, '2023-09-02 10:01:31.714338', '8', 'member1', 2, '[{\"changed\": {\"fields\": [\"Group name\"]}}]', 10, 1),
(47, '2023-09-02 10:01:36.001592', '5', 'Gideon', 2, '[{\"changed\": {\"fields\": [\"Group name\"]}}]', 10, 1),
(48, '2023-09-02 10:01:39.829882', '4', 'Gideon', 2, '[{\"changed\": {\"fields\": [\"Group name\"]}}]', 10, 1),
(49, '2023-09-02 10:01:44.043270', '3', 'G', 2, '[{\"changed\": {\"fields\": [\"Group name\"]}}]', 10, 1),
(50, '2023-09-02 10:01:47.050332', '3', 'G', 2, '[]', 10, 1),
(51, '2023-09-02 10:01:51.438628', '2', 'm2', 2, '[{\"changed\": {\"fields\": [\"Group name\"]}}]', 10, 1),
(52, '2023-09-02 10:01:54.390608', '2', 'm2', 2, '[]', 10, 1),
(53, '2023-09-02 10:01:58.095680', '1', 'member1', 2, '[{\"changed\": {\"fields\": [\"Group name\"]}}]', 10, 1),
(54, '2023-09-02 10:19:50.800195', '1', 'member1', 2, '[{\"changed\": {\"fields\": [\"Group name\"]}}]', 10, 1),
(55, '2023-09-02 10:20:05.482458', '3', 'G', 2, '[{\"changed\": {\"fields\": [\"Group name\"]}}]', 10, 1),
(56, '2023-09-03 11:35:17.757695', '3', 'admins', 1, '[{\"added\": {}}]', 4, 1),
(57, '2023-09-03 11:35:28.762332', '3', 'admins', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(8, 'mainapp', 'branch'),
(13, 'mainapp', 'group_info'),
(11, 'mainapp', 'group_lending'),
(9, 'mainapp', 'individual_lending'),
(7, 'mainapp', 'individual_ref'),
(10, 'mainapp', 'member'),
(12, 'mainapp', 'my_group'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-08-31 10:16:14.776581'),
(2, 'auth', '0001_initial', '2023-08-31 10:16:26.366585'),
(3, 'admin', '0001_initial', '2023-08-31 10:16:28.175579'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-08-31 10:16:28.255579'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-08-31 10:16:28.288579'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-08-31 10:16:28.915579'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-08-31 10:16:29.615579'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-08-31 10:16:30.357578'),
(9, 'auth', '0004_alter_user_username_opts', '2023-08-31 10:16:30.423580'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-08-31 10:16:31.016582'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-08-31 10:16:31.059579'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-08-31 10:16:31.126586'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-08-31 10:16:31.216580'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-08-31 10:16:31.361578'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-08-31 10:16:32.016581'),
(16, 'auth', '0011_update_proxy_permissions', '2023-08-31 10:16:32.111580'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-08-31 10:16:32.282579'),
(18, 'mainapp', '0001_initial', '2023-08-31 10:16:32.492578'),
(19, 'mainapp', '0002_delete_individual', '2023-08-31 10:16:32.671579'),
(20, 'sessions', '0001_initial', '2023-08-31 10:16:33.105579'),
(21, 'mainapp', '0003_initial', '2023-08-31 10:31:45.419883'),
(22, 'mainapp', '0004_individual_ref_user', '2023-08-31 11:12:00.414103'),
(23, 'mainapp', '0005_branch_individual_lending', '2023-08-31 16:52:23.433479'),
(24, 'mainapp', '0006_alter_individual_lending_interest_and_more', '2023-08-31 17:26:51.095555'),
(25, 'mainapp', '0007_individual_lending_date_of_return_and_more', '2023-08-31 20:54:16.555320'),
(26, 'mainapp', '0008_member', '2023-09-01 17:51:21.691710'),
(27, 'mainapp', '0009_group_lending', '2023-09-01 20:44:25.093431'),
(28, 'mainapp', '0010_my_group_individual_ref_grou_name_member_grou_name', '2023-09-02 08:38:32.390167'),
(29, 'mainapp', '0011_rename_grou_name_individual_ref_group_name_and_more', '2023-09-02 08:51:16.612134'),
(30, 'mainapp', '0012_alter_group_lending_group_name', '2023-09-02 09:09:23.291452'),
(31, 'mainapp', '0013_remove_individual_ref_group_name_and_more', '2023-09-02 09:22:54.778941'),
(32, 'mainapp', '0014_my_group_member_group_name', '2023-09-02 09:53:44.698588'),
(33, 'mainapp', '0015_alter_group_lending_group_name', '2023-09-02 10:07:45.245283'),
(34, 'mainapp', '0016_group_info', '2023-09-03 03:56:19.141269'),
(35, 'mainapp', '0017_delete_group_info_my_group_date_of_registration_and_more', '2023-09-03 03:57:49.739614'),
(36, 'mainapp', '0018_branch_date_of_registration', '2023-09-03 12:38:36.701688'),
(37, 'mainapp', '0019_branch_user', '2023-09-03 13:56:39.249081'),
(38, 'mainapp', '0020_alter_branch_user', '2023-09-03 15:35:31.896023'),
(39, 'mainapp', '0021_alter_branch_user', '2023-09-03 15:37:11.924870'),
(40, 'mainapp', '0022_alter_individual_ref_nida_number', '2023-09-04 12:04:42.849120');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_branch`
--

CREATE TABLE `mainapp_branch` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `date_of_registration` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_branch`
--

INSERT INTO `mainapp_branch` (`id`, `name`, `date_of_registration`, `user_id`) VALUES
(1, 'Shinyanga Mjini', '2023-09-03', 4),
(3, 'Maganzo', '2023-09-03', 6),
(4, 'Bahi', '2023-09-03', 5),
(5, 'Segese', '2023-09-03', NULL),
(6, 'Kigwe', '2023-09-03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_group_lending`
--

CREATE TABLE `mainapp_group_lending` (
  `id` bigint(20) NOT NULL,
  `group_name_id` bigint(20) DEFAULT NULL,
  `phone_number` varchar(200) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `returned_amount` double DEFAULT NULL,
  `interest` double DEFAULT NULL,
  `lending_date` date DEFAULT NULL,
  `date_of_return` date DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `branch_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_group_lending`
--

INSERT INTO `mainapp_group_lending` (`id`, `group_name_id`, `phone_number`, `amount`, `returned_amount`, `interest`, `lending_date`, `date_of_return`, `status`, `branch_id`) VALUES
(8, 4, '0623425558', 100000, 0, 0, '2023-09-03', '2023-10-03', 'pending', 3),
(11, 1, '0623425558', 60000, 0, 0, '2023-09-04', '2023-10-04', 'pending', 6);

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_group_lending_members`
--

CREATE TABLE `mainapp_group_lending_members` (
  `id` bigint(20) NOT NULL,
  `group_lending_id` bigint(20) NOT NULL,
  `member_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_group_lending_members`
--

INSERT INTO `mainapp_group_lending_members` (`id`, `group_lending_id`, `member_id`) VALUES
(43, 8, 4),
(44, 8, 5),
(45, 8, 8),
(46, 8, 9),
(58, 11, 1),
(59, 11, 4),
(60, 11, 5),
(61, 11, 8),
(62, 11, 9);

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_group_lending_referee`
--

CREATE TABLE `mainapp_group_lending_referee` (
  `id` bigint(20) NOT NULL,
  `group_lending_id` bigint(20) NOT NULL,
  `individual_ref_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_group_lending_referee`
--

INSERT INTO `mainapp_group_lending_referee` (`id`, `group_lending_id`, `individual_ref_id`) VALUES
(25, 8, 12),
(26, 8, 13);

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_individual_lending`
--

CREATE TABLE `mainapp_individual_lending` (
  `id` bigint(20) NOT NULL,
  `lender_name` varchar(200) DEFAULT NULL,
  `phone_number` varchar(200) DEFAULT NULL,
  `nida_number` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `occupation` varchar(200) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `returned_amount` double DEFAULT NULL,
  `interest` double DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  `referee_id` bigint(20) DEFAULT NULL,
  `date_of_return` date DEFAULT NULL,
  `lending_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_individual_lending`
--

INSERT INTO `mainapp_individual_lending` (`id`, `lender_name`, `phone_number`, `nida_number`, `address`, `location`, `occupation`, `amount`, `returned_amount`, `interest`, `status`, `branch_id`, `referee_id`, `date_of_return`, `lending_date`) VALUES
(20, 'David M', '0623425558', '123456789098765432134', 'P.O.Box 56300', 'mabibo', 'Teacher', 40000, 0, 0, 'pending', 3, 14, '2023-09-14', '2023-09-04');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_individual_ref`
--

CREATE TABLE `mainapp_individual_ref` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(200) DEFAULT NULL,
  `last_name` varchar(200) DEFAULT NULL,
  `phone_number` varchar(10) NOT NULL,
  `nida_number` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `location` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_individual_ref`
--

INSERT INTO `mainapp_individual_ref` (`id`, `first_name`, `last_name`, `phone_number`, `nida_number`, `address`, `location`, `user_id`) VALUES
(12, 'Gideon', 'Magaita', '0623425558', '19980721372100000127', 'P.O.Box 5678', 'Mabibo', NULL),
(13, 'Hellen', 'Yusuph', '0623425558', '12345678909876543213', 'P.O.Box 56300', 'Mabibo', NULL),
(14, 'Elvis', 'mawenya', '0623425558', '12345678909876543213', 'P.O.Box 56300', 'Mbezi luis', NULL),
(15, 'Fatumaa', 'Abdallah', '0623425555', '12345678909876543214', 'P.O.Box 5611', 'Bunju', NULL),
(16, 'ref1', 'ref1', '0623425558', '12345678909876543213', 'P.O.Box 56300', 'Mbezi luis', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_member`
--

CREATE TABLE `mainapp_member` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(200) DEFAULT NULL,
  `last_name` varchar(200) DEFAULT NULL,
  `phone_number` varchar(10) NOT NULL,
  `nida_number` varchar(21) NOT NULL,
  `address` varchar(20) NOT NULL,
  `location` varchar(100) NOT NULL,
  `occupation` varchar(200) DEFAULT NULL,
  `group_name_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_member`
--

INSERT INTO `mainapp_member` (`id`, `first_name`, `last_name`, `phone_number`, `nida_number`, `address`, `location`, `occupation`, `group_name_id`) VALUES
(1, 'member1', 'member1', '0623425558', '12345678909876543213', 'P.O.Box 8788', 'kahama', 'mkulima', 2),
(4, 'Gideon', 'Magaitas', '0623425558', '12345678909876543213', 'P.O.Box 8788', 'kinondoni', 'Mwalimu', 4),
(5, 'Gideon', 'Magaita', '0623425558', '12345678909876543213', 'P.O.Box 8788', 'kinondoni', 'Mwalimu', 1),
(8, 'member1', 'Magaita', '0623425558', '12345678909876543213', 'P.O.Box 8788', 'kinondoni', 'mkulima', 1),
(9, 'member2', 'member2', '0623425558', '12345678909876543213', 'P.O.Box 8788', 'kinondoni', 'Mwalimu', 2);

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_my_group`
--

CREATE TABLE `mainapp_my_group` (
  `id` bigint(20) NOT NULL,
  `group_name` varchar(200) DEFAULT NULL,
  `date_of_registration` date DEFAULT NULL,
  `group_leader` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_my_group`
--

INSERT INTO `mainapp_my_group` (`id`, `group_name`, `date_of_registration`, `group_leader`) VALUES
(1, 'UPENDO GROUP', '2023-09-03', 'Samson Kenzagi'),
(2, 'UPENDO GROUP2', '2023-09-03', 'Masanja Kudema'),
(4, 'JUA KALI GROUP', '2023-09-03', 'Samson Kenzagi'),
(6, 'UPENDO GROUP3', '2023-09-04', 'my gs');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `mainapp_branch`
--
ALTER TABLE `mainapp_branch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mainapp_branch_user_id_eab24605_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `mainapp_group_lending`
--
ALTER TABLE `mainapp_group_lending`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mainapp_group_lending_branch_id_fca5d5c4_fk_mainapp_branch_id` (`branch_id`),
  ADD KEY `mainapp_group_lending_group_name_id_af7eac9f` (`group_name_id`);

--
-- Indexes for table `mainapp_group_lending_members`
--
ALTER TABLE `mainapp_group_lending_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mainapp_group_lending_me_group_lending_id_member__75693595_uniq` (`group_lending_id`,`member_id`),
  ADD KEY `mainapp_group_lendin_member_id_1853887b_fk_mainapp_m` (`member_id`);

--
-- Indexes for table `mainapp_group_lending_referee`
--
ALTER TABLE `mainapp_group_lending_referee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mainapp_group_lending_re_group_lending_id_individ_7459976a_uniq` (`group_lending_id`,`individual_ref_id`),
  ADD KEY `mainapp_group_lendin_individual_ref_id_61fd064e_fk_mainapp_i` (`individual_ref_id`);

--
-- Indexes for table `mainapp_individual_lending`
--
ALTER TABLE `mainapp_individual_lending`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mainapp_individual_l_branch_id_a118f146_fk_mainapp_b` (`branch_id`),
  ADD KEY `mainapp_individual_l_referee_id_fdc37ebb_fk_mainapp_i` (`referee_id`);

--
-- Indexes for table `mainapp_individual_ref`
--
ALTER TABLE `mainapp_individual_ref`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mainapp_individual_ref_user_id_1f3e6ef6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `mainapp_member`
--
ALTER TABLE `mainapp_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mainapp_member_group_name_id_33e3befb_fk_mainapp_my_group_id` (`group_name_id`);

--
-- Indexes for table `mainapp_my_group`
--
ALTER TABLE `mainapp_my_group`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `mainapp_branch`
--
ALTER TABLE `mainapp_branch`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `mainapp_group_lending`
--
ALTER TABLE `mainapp_group_lending`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `mainapp_group_lending_members`
--
ALTER TABLE `mainapp_group_lending_members`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `mainapp_group_lending_referee`
--
ALTER TABLE `mainapp_group_lending_referee`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `mainapp_individual_lending`
--
ALTER TABLE `mainapp_individual_lending`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `mainapp_individual_ref`
--
ALTER TABLE `mainapp_individual_ref`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `mainapp_member`
--
ALTER TABLE `mainapp_member`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `mainapp_my_group`
--
ALTER TABLE `mainapp_my_group`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `mainapp_branch`
--
ALTER TABLE `mainapp_branch`
  ADD CONSTRAINT `mainapp_branch_user_id_eab24605_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `mainapp_group_lending`
--
ALTER TABLE `mainapp_group_lending`
  ADD CONSTRAINT `mainapp_group_lendin_group_name_id_af7eac9f_fk_mainapp_m` FOREIGN KEY (`group_name_id`) REFERENCES `mainapp_my_group` (`id`),
  ADD CONSTRAINT `mainapp_group_lending_branch_id_fca5d5c4_fk_mainapp_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `mainapp_branch` (`id`);

--
-- Constraints for table `mainapp_group_lending_members`
--
ALTER TABLE `mainapp_group_lending_members`
  ADD CONSTRAINT `mainapp_group_lendin_group_lending_id_e5e03edc_fk_mainapp_g` FOREIGN KEY (`group_lending_id`) REFERENCES `mainapp_group_lending` (`id`),
  ADD CONSTRAINT `mainapp_group_lendin_member_id_1853887b_fk_mainapp_m` FOREIGN KEY (`member_id`) REFERENCES `mainapp_member` (`id`);

--
-- Constraints for table `mainapp_group_lending_referee`
--
ALTER TABLE `mainapp_group_lending_referee`
  ADD CONSTRAINT `mainapp_group_lendin_group_lending_id_4cfb5c57_fk_mainapp_g` FOREIGN KEY (`group_lending_id`) REFERENCES `mainapp_group_lending` (`id`),
  ADD CONSTRAINT `mainapp_group_lendin_individual_ref_id_61fd064e_fk_mainapp_i` FOREIGN KEY (`individual_ref_id`) REFERENCES `mainapp_individual_ref` (`id`);

--
-- Constraints for table `mainapp_individual_lending`
--
ALTER TABLE `mainapp_individual_lending`
  ADD CONSTRAINT `mainapp_individual_l_branch_id_a118f146_fk_mainapp_b` FOREIGN KEY (`branch_id`) REFERENCES `mainapp_branch` (`id`),
  ADD CONSTRAINT `mainapp_individual_l_referee_id_fdc37ebb_fk_mainapp_i` FOREIGN KEY (`referee_id`) REFERENCES `mainapp_individual_ref` (`id`);

--
-- Constraints for table `mainapp_individual_ref`
--
ALTER TABLE `mainapp_individual_ref`
  ADD CONSTRAINT `mainapp_individual_ref_user_id_1f3e6ef6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `mainapp_member`
--
ALTER TABLE `mainapp_member`
  ADD CONSTRAINT `mainapp_member_group_name_id_33e3befb_fk_mainapp_my_group_id` FOREIGN KEY (`group_name_id`) REFERENCES `mainapp_my_group` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
