<?php

$string = "Well now this is a & * test , ? ' .";

$start = time() + microtime();

echo str_replace(array('?', '.', '*', "'"), array('','','',''), $string);
echo "\n";

echo sprintf("%0.5f", time() + microtime() - $start), "\n";

$start = time() + microtime();

echo preg_replace("/[?'.*]/", '', $string);
echo "\n";

echo sprintf("%0.5f", time() + microtime() - $start), "\n";

$start = time() + microtime();

echo preg_replace("/[?'.*]/", '', $string);
echo "\n";

echo sprintf("%0.5f", time() + microtime() - $start), "\n";

$start = time() + microtime();

echo str_replace(array('?', '.', '*', "'"), array('','','',''), $string);
echo "\n";

echo sprintf("%0.5f", time() + microtime() - $start), "\n";

?>
