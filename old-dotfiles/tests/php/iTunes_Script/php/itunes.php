<?php

include('array.php');

foreach($dupes as $file)
{
	if(file_exists($file)) unlink($file);
}

return; /*** the following code was used to generate the duplicate file array ***/

function myLS($dir, $path=null)
{
	$return = array();
	$pwd = $dir;
	if($path) $pwd = "$dir/$path";

	if($h = opendir($pwd))
	{
		while (false !== ($file = readdir($h)))
		{
			if($file == '.' || $file == '..') continue;
			if( is_dir("$pwd/$file") )
			{
				$new_path = ($path) ? "$path/$file" : $file;
				$array = array();
				$array = myLS($dir, $new_path);
				foreach($array as $a)
					$return[] = $a;
			} else {
				$return[] = "$dir/$path/$file";
			}
		}
	}

	return $return;
}

$itunes = myLS("/Users/jearsh/Music/iTunes/iTunes Music");
$torrents = myLS("/Users/jearsh/Desktop/Bit Hole");

$dupes = array();

foreach($itunes as $ifile)
{
	foreach($torrents as $tfile)
	{
		if(basename($tfile) == basename($ifile))
			$dupes[] = $tfile;
	} // inner foreach
} // outer foreach

$dupes = array_unique($dupes);

echo "<?php \n\$dupes = ";
var_export($dupes);
echo ";\n?>";

?>
