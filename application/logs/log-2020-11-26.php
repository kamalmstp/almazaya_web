<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2020-11-26 03:05:20 --> 404 Page Not Found: Media_library/images
ERROR - 2020-11-26 03:34:11 --> 404 Page Not Found: admission/Guest/index
ERROR - 2020-11-26 06:16:36 --> Severity: error --> Exception: syntax error, unexpected ''address'' (T_CONSTANT_ENCAPSED_STRING), expecting ']' C:\xampp7\htdocs\almazaya_web\application\controllers\admission\Guest.php 118
ERROR - 2020-11-26 13:17:54 --> Query error: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'AND x1.id = 1' at line 12 - Invalid query: 
			SELECT x1.id
				, x1.created_at
				, CASE WHEN x1.is_approved = 'true' THEN 'Diterima'
					WHEN x1.is_approved = 'false' THEN 'Tidak Diterima'
					ELSE 'Belum Diseleksi'
					END AS is_approved
				, x1.full_name
				, x1.address
				, x1.phone
			FROM guest x1
		
		AND x1.id = 1
		
ERROR - 2020-11-26 08:02:57 --> 404 Page Not Found: academic/Guest/pagination
ERROR - 2020-11-26 08:03:27 --> 404 Page Not Found: academic/Guest/pagination
