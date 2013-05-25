#!/usr/bin/php

<?php
	$fields = array('id', 'name', 'rateDownload', 'rateUpload', 'percentDone', 'eta');
	$output = makeRequest();
	$header = getHeader($output);
	switch($argv[1]) {
		case 'open':
			$data = array('method' => 'session-set',
										'arguments' => array('speed-limit-down-enabled' => false,
																				'speed-limit-up' => 20,
																				'speed-limit-up-enabled' => true));
			var_dump( makeRequest($header, $data, true) );
			break;
		case 'close':
			$data = array('method' => 'session-set',
										'arguments' => array('speed-limit-down' => 30,
																				 'speed-limit-down-enabled' => true,
																				 'speed-limit-up' => 10,
																				 'speed-limit-up-enabled' => true));
			var_dump( makeRequest($header, $data, true) );
			break;
		case 'start':
			$ids = array();
			foreach($argv as $ind => $arg) {
				if($ind > 1) $ids[] = intval($arg);
			}
			$data = array('method' => 'torrent-start',
										'arguments' => array('ids' => $ids));
			var_dump( makeRequest($header, $data, true) );
			break;
		case 'stop':
			$ids = array();
			foreach($argv as $ind => $arg) {
				if($ind > 1) $ids[] = intval($arg);
			}
			$data = array('method' => 'torrent-stop',
										'arguments' => array('ids' => $ids));
			var_dump( makeRequest($header, $data, true) );
			break;
		case 'list':
			$data = array('method' => 'torrent-get',
										'arguments' => array('fields' => $fields));
			$result = makeRequest($header, $data, true);
			if(is_string($result)) $result = json_decode($result);
			$torrents = $result->arguments->torrents;
			echo "----- ----------------------------------- ---------- ---------- ---------- --------------------\n";
			printf("%-5s %-35s %-10s %-10s %-10s %-20s\n",
							'Id', 'Name', 'Download', 'Upload', '% Done', 'ETA');
			echo "----- ----------------------------------- ---------- ---------- ---------- --------------------\n";
			foreach($torrents as $torrent) {
				//if($torrent->percentDone < 1) {
					printf("%-5s %-35s %10s %10s %10s %-20s\n",
								 $torrent->id,
								 getSmallName($torrent->name),
								 getSize($torrent->rateDownload),
								 getSize($torrent->rateUpload),
								 ($torrent->percentDone * 100) . '%',
								 getETA($torrent->eta));
				//}
			}

			/*************************************************
			 * 
			 * INSERT
			 *
			 * Total Download Rate
			 * Total Upload Rate
			 * Max ETA
			 *
			 * to the bottom of the output
			 *
			*************************************************/
			break;
		case 'finished-files':
			$fields[] = 'files';
			$fields[] = 'downloadDir';
			$data = array('method' => 'torrent-get',
										'arguments' => array('fields' => $fields));
			$result = makeRequest($header, $data, true);
			if(is_string($result)) $result = json_decode($result);
			$torrents = $result->arguments->torrents;
			echo "----- ----------------------------------- ---------- ---------- ---------- --------------------\n";
			printf("%-5s %-35s %-10s %-10s %-10s %-20s\n",
							'Id', 'Name', 'Download', 'Upload', '% Done', 'ETA');
			echo "----- ----------------------------------- ---------- ---------- ---------- --------------------\n";
			foreach($torrents as $torrent) {
				if($torrent->percentDone < 1) {
					$files = $torrent->files;
					foreach($files as $file) {
						if($file->bytesCompleted == $file->length) {
							echo $torrent->downloadDir, '/', $file->name, "\n";
						}
					}
				}
			}
			break;
		case 'list-all':
			$data = array('method' => 'torrent-get',
										'arguments' => array('fields' => $fields));
			$result = makeRequest($header, $data, true);
			if(is_string($result)) $result = json_decode($result);
			$torrents = $result->arguments->torrents;
			echo "\n----- ----------------------------------- ---------- ---------- ---------- --------------------\n";
			printf("%-5s %-35s %-10s %-10s %-10s %-20s\n",
							'Id', 'Name', 'Download', 'Upload', '% Done', 'ETA');
			echo "----- ----------------------------------- ---------- ---------- ---------- --------------------\n";
			if(! is_array($torrents)) return 'No Torrents.';
			foreach($torrents as $torrent) {
				printf("%-5s %-35s %10s %10s %10s %-20s\n",
								$torrent->id,
								getSmallName($torrent->name),
								getSize($torrent->rateDownload),
								getSize($torrent->rateUpload),
								($torrent->percentDone * 100) . '%',
								getETA($torrent->eta));
			}
			/*************************************************
			 * 
			 * INSERT
			 *
			 * Total Download Rate
			 * Total Upload Rate
			 * Max ETA
			 *
			 * to the bottom of the output
			 *
			*************************************************/
			break;
		case 'limit-down':
			$limit = intval($argv[2]);
			$data = array('method' => 'session-set',
										'arguments' => array('speed-limit-down' => $limit,
																				 'speed-limit-down-enabled' => true));
			var_dump( makeRequest($header, $data, true) );
			break;
		case 'limit-up':
			$limit = intval($argv[2]);
			$data = array('method' => 'session-set',
										'arguments' => array('speed-limit-up' => $limit,
																				 'speed-limit-up-enabled' => true));
			var_dump( makeRequest($header, $data, true) );
			break;
		case 'unlimit-down':
			$data= array('method' => 'session-set',
									 'arguments' => array('speed-limit-down-enabled' => false));
			var_dump( makeRequest($header, $data, true) );
			break;
		case 'unlimit-up':
			$data= array('method' => 'session-set',
									 'arguments' => array('speed-limit-up-enabled' => false));
			var_dump( makeRequest($header, $data, true) );
			break;
	}
	echo "\n";
?>

<?php
	function makeRequest($header=null, $data=null, $encode=false) {
		if($data && $encode) $data = json_encode($data);
		$curl = curl_init('http://localhost:9091/transmission/rpc');
		if($header)
			curl_setopt($curl, CURLOPT_HTTPHEADER, array($header));
		if($data)
			curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		$output = curl_exec($curl);

		if(stristr($output, '409')) return $output;
		return json_decode($output);
	}

	function getHeader($output) {
		$matches = array();
		preg_match('#<code>([^<]*)</code>#', $output, $matches);
		return $matches[1];
	}

	function getETA($eta) {
		$labels = array('d', 'h', 'm', 's');
		$values = array((24*60*60), (60*60), 60, 1);
		$time = '';
		foreach($values as $index => $value) {
			if($eta >= $value) {
				$time .= floor($eta / $value) . $labels[$index] . ' ';
				$eta = $eta % $value;
			}
		}
		return $time;
	}

	function getSize($bytes) {
		$labels = array('g', 'm', 'k', 'b');
		$values = array(pow(1024,3), pow(1024,2), pow(1024,1), pow(1024,0));
		$size = '';
		foreach($values as $index => $value) {
			if($bytes >= $value) {
				$size = sprintf("%0.1f%s", $bytes/$value, $labels[$index]);
				break;
			}
		}
		return $size;
	}

	function getSmallName($name) {
		if(strlen($name) > 35) return substr($name, 0, 32) . '...';
		return $name;
	}
?>
