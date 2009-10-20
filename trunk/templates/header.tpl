<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   {* Document/Browser title *}
   <title>{$smarty.const.DIRECTORY_TITLE}{$smarty.capture.title|strip}</title>

   {* Document character set *}
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

   {* CSS Style file *}
   <link rel="stylesheet" type="text/css" href="{$smarty.const.DOC_ROOT}/main.css" />

   {* Please keep this line for better version tracking *}
   <meta name="generator" content="PHP Link Directory {$smarty.const.CURRENT_VERSION}" />
</head>
<body>

{* Error and confirmation messages *}
{include file="admin/messages.tpl"}

<h1 id="title">{$in_page_title|escape|trim}</h1>
<p id="descr">{$description|escape|trim}&nbsp;</p>