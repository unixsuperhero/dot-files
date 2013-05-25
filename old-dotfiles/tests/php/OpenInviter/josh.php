<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<script type="text/javascript">
		function updateView() {
			var contacts = document.getElementById('contacts').innerHTML;
			window.top.invite.after_login(contacts);
		}
		function bodyLoad() {
			document.domain = 'redgage.com';
			updateView();
		}
	</script>
</head>
<body onload="bodyLoad()">
Hello
<div id="contacts">
	<?php

include('openinviter.php');

$username = strtolower($_POST['username']);
$password = $_POST['password'];
$service = strtolower($_POST['service']);

if(strpos($username, '@' . $service . '.com') === false) {
	$temp = split('@', $username);
	$username = $temp[0] . '@' . $service . '.com';
}
if($username && $password) {
	$inviter = new OpenInviter();
	$service = $inviter->startPlugin($service);
	if(!$inviter->login($username, $password))
	{ //$inviter->login('jearsh', 'mypasswordispassword'); 
			echo 'Login failed.  Please check the email and password you have provided and try again later.</div></body></html>';
			return;
	}

	$contacts = $inviter->getMyContacts();

	if($inviter->getInternalError())
	{
		echo 'Unable to get contacts.</div></body></html>';
		return;
	}

	//$inviter->logout();

	$total = 0;
	if(is_array($contacts))
		$total = count($contacts);
	$current = 1;
	
	if($total > 0) {
		echo '<div class="dark_gray" style="background-color:#ddd;"><input type="checkbox" /><span class="select_all">Select/Deselect All</span></div>';
		foreach($contacts as $email => $name):

			if($name != $email)
				echo '<div class="dark_gray"><input type="checkbox" value="' . $email . '" /><span>' . $name . ' &lt;' . $email . '&gt;</span></div>';
			else
				echo '<div class="dark_gray"><input type="checkbox" value="' . $email . '" /><span>&lt;' . $email . '&gt;</span></div>';

			$current ++;
		endforeach;
	}
} else {
	echo 'Invalid Request';
}
?>
</div>
</body>
</html>
