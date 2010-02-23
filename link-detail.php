<?php
require_once 'init.php';
session_start();

preg_match ('#(.*)(_|-)(\d+)\.htm[l]?$#i', request_uri(), $matches);

$id = (!empty ($matches[3]) ? intval ($matches[3]) : 0);
$linkdetail = $db->GetAll("SELECT * FROM PLD_LINK WHERE ID ='$id'");
$tpl->assign('linkdetail', $linkdetail);

$path = array ();
$path[] = array ('ID' => '0', 'TITLE' => _L('Home'), 'TITLE_URL' => DOC_ROOT, 'DESCRIPTION' => '');
$path[] = array ('ID' => '0', 'TITLE' => _L('Link Detail'), 'TITLE_URL' => '', 'DESCRIPTION' => _L('Link Detail'));

$tpl->assign('path', $path);

echo $tpl->fetch('link-detail.tpl');
?>