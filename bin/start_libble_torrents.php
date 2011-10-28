<?php
//curl --header "X-Transmission-Session-Id: HZ0hM8BwcJilfRyr5Vv2WH3c2SyWlyYAXLInPP59xiWu699j" --data '{"method":"torrent-get","arguments":{"fields": ["id", "name", "status", "trackers"]}}' http://localhost:9091/transmission/rpc

$curl = curl_init('http://localhost:9091/transmission/rpc');

curl_setopt($curl, CURLOPT_POSTFIELDS, '{"method":"torrent-get","arguments":{"fields": ["id", "name", "status", "trackers"]}}');
curl_setopt($curl, CURLOPT_HTTPHEADER, array('X-Transmission-Session-Id: HZ0hM8BwcJilfRyr5Vv2WH3c2SyWlyYAXLInPP59xiWu699j'));
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

$output = curl_exec($curl);

if(stristr($output, '409'))
{
	$matches = array();
	preg_match('#<code>([^<]*)</code>#', $output, $matches);

	$session = $matches[1];
}

$curl = curl_init('http://localhost:9091/transmission/rpc');

curl_setopt($curl, CURLOPT_POSTFIELDS, '{"method":"torrent-get","arguments":{"fields": ["id", "name", "status", "trackers"]}}');
curl_setopt($curl, CURLOPT_HTTPHEADER, array($session));
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

$output = curl_exec($curl);

$json = json_decode($output);

$ids = $stop_ids = array();
foreach($json->arguments->torrents as $torrent)
{
	$found = false;
	foreach($torrent->trackers as $tracker)
	{
		if(strpos($tracker->announce, 'libble') !== false)
		{
			$ids[] = $torrent->id;
			$found = true;
			break;
		}
	}
	if(! $found) $stop_ids[] = $torrent->id;
}

$request = array('method' => 'torrent-start', 'arguments' => array('fields' => $ids));

$post_fields = json_encode($request);

$curl = curl_init('http://localhost:9091/transmission/rpc');
curl_setopt($curl, CURLOPT_POSTFIELDS, $post_fields);
curl_setopt($curl, CURLOPT_HTTPHEADER, array($session));
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
$output = curl_exec($curl);

echo $output;

$request = array('method' => 'torrent-stop', 'arguments' => array('fields' => $stop_ids));

$post_fields = json_encode($request);

$curl = curl_init('http://localhost:9091/transmission/rpc');
curl_setopt($curl, CURLOPT_POSTFIELDS, $post_fields);
curl_setopt($curl, CURLOPT_HTTPHEADER, array($session));
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
$output = curl_exec($curl);

echo $output;
?>
