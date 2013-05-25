#!/usr/bin/php

<?php // The Code

	echo getRatio('jearsh', 'skipper');
	echo getRatio('jearshua', 'mypasswordis');

?>

<?php // Function Definition

	function getRatio($username, $password)
	{
		$url = 'http://www.demonoid.com/account_handler.php';
		$post = array('nickname=' . $username,
									'password=' . $password,
									'Submit=Submit',
									'returnpath=' . rawurlencode('/?rel=' . time()),
									'withq=1');

		$post_fields = join('&', $post);

		$curl = curl_init($url);
		curl_setopt($curl, CURLOPT_POST, true);
		curl_setopt($curl, CURLOPT_POSTFIELDS, $post_fields);
		curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true);
		curl_setopt($curl, CURLOPT_HEADER, true);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curl, CURLOPT_COOKIEJAR, '/tmp/demonoid.cookie');
		$output = curl_exec($curl);
		curl_close($curl);

		$matches = array();
		preg_match('/Uploaded.*Ratio[^<]*/', $output, $matches);
		$output = strip_tags($matches[0]);
		$splits = split(' ', $output);

		$uploaded = $downloaded = $ratio = array();
		foreach($splits as $split)
		{
			if(count($uploaded) < 3) $uploaded[] = $split;
			else if(count($downloaded) < 3) $downloaded[] = $split;
			else $ratio[] = $split;
		}

		$return = $username . ":\n\t" . join(' ', $uploaded) . "\n\t" . join(' ', $downloaded) . "\n\t" . join(' ', $ratio) . "\n\n";
		return $return;
	}

?>
