{include file="install/messages.tpl"}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <title>phpLinkDirectory v{$smarty.const.CURRENT_VERSION} Install - {$title}</title>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
   <link rel="stylesheet" type="text/css" href="install.css" />
   <meta name="robots" content="noindex, nofollow" />
   <meta name="generator" content="PHP Link Directory {$VERSION}" />
   <script type="text/javascript" src="install.js"></script>
</head>
<body>
<div align="center" id="page">

<form method="post" action="">

<table width="700" border="0" cellpadding="0" cellspacing="0">
   <tr>
      <td rowspan="3">
         <img id="lt" src="images/lt.gif" width="7" height="92" alt="" /></td>
      <td colspan="2">
         <img id="tc" src="images/tc.gif" width="686" height="7" alt="" /></td>
      <td rowspan="3">
         <img id="rt" src="images/rt.gif" width="7" height="92" alt="" /></td>
   </tr>
   <tr>
      <td rowspan="2">
         <img id="chain" src="images/chain.jpg" width="324" height="85" alt="" /></td>
      <td>
         <img id="logo" src="images/logo.gif" width="362" height="42" alt="" /></td>
   </tr>
   <tr>
      <td id="title">
         <img src="images/spacer.gif" width="1" height="43" alt="" align="left"/>{$title}</td>
   </tr>
   <tr>
      <td>
         <img id="lc1" src="images/lc1.gif" width="7" height="362" alt="" /></td>
      <td colspan="2" id="main">

{$smarty.capture.form_error}
{$smarty.capture.message}

{if empty($step) or $step le 1}
<table border="0" class="formPage" width="100%">
  <tr>
    <td width="30%">{l}Language{/l}</td>
    <td width="70%" class="smallDesc">
      {html_options options=$languages selected=$language name="language"}
      <img src="images/btn_help.gif" onclick="toggleBox('language');" align="top" alt="" />
      {validate form="install" id="v_language" page="1" message=$smarty.capture.field_required}
      <br />
      <div id="languageSD">{l}Select the language for the installation process.{/l}</div>
      <div id="language" class="longDescription"><p>{l}The language used through the installation process.{/l}</p></div>
   </td>
  </tr>
</table>

{elseif $step eq 2}

<p>{l}Thank you for choosing PHP Link Directory. PHP Link Directory was developed to help create and maintain a link directory and exchange. Many features are already implemented and more are being developed all the time, keep up-to-date by visiting the PHP Link Directory <a target="_blank" href="http://www.phplinkdirectory.com">homepage</a>.{/l}</p>
<h2>{l}Requirements{/l}</h2>
<table id="requirements" border="0" cellpadding="0" cellspacing="0">
{assign var="fatal" value=false}
   {foreach from=$req item="item"}
   <tr>
      <td style="white-space:nowrap; padding:3px;">{$item.req}</td>
      <td style="white-space:nowrap; padding:3px;"> <img src="images/req_{if $item.fatal}fatal{assign var="fatal" value=true}{elseif $item.ok}ok{else}no{/if}.gif" width="16" height="16" alt="" /> </td>
      <td style="padding:3px;"><span>&nbsp;{$item.txt}</span></td>
   </tr>
   {/foreach}
</table>

{if $fatal}
<div class="err">
   <img src="images/no_22.gif" alt="" />
   {l}At least one fatal error was found. Please correct the reported error(s) and refresh this page or restart the installer in order to continue with the installation process.{/l}
</div>
{/if}

{elseif $step eq 3}
<p>{l}MySQL Database connection and login information.{/l}</p>
<br />
<table border="0" class="formPage" width="100%">
  <tr>
    <td width="30%">{l}Database Server{/l}<span class='req'>*</span></td>
    <td width="70%" class="smallDesc">
      <input {if $errors.db_host}class="err" {/if}type="text" name="db_host" value="{$db_host}" size="20" maxlength="100" />
      <img src="images/btn_help.gif" onclick="toggleBox('dbHost');" align="top" alt="" />
      {validate form="install" id="v_db_host" page="3" message=$smarty.capture.field_required}
      <br />
      <div id="dbHostSD">{l}Hostame or IP-address of the database server{/l}</div>
      <div id="dbHost" class="longDescription">{l}The database server can be in the form of a hostname, such as db1.myserver.com, or as an IP-address, such as 192.168.0.1{/l}</div>
   </td>
  </tr>
  <tr>
    <td width="30%">{l}Database Name{/l}<span class='req'>*</span></td>
    <td width="70%" class="smallDesc">
      <input type="text" name="db_name" value="{$db_name}" size="20" maxlength="100" />
      <img src="images/btn_help.gif" onclick="toggleBox('dbName');" align="top" alt="" />
      {validate form="install" id="v_db_name" page="3" message=$smarty.capture.field_required}
      <br />
      <div id="dbNameSD">{l}Database Name{/l}</div>
      <div id="dbName" class="longDescription">{l}The database used to hold the data. An example database name is 'phplinkd'.{/l}</div>
   </td>
  </tr>
  <tr>
    <td width="30%">{l}Username{/l}<span class='req'>*</span></td>
    <td width="70%" class="smallDesc">
      <input type="text" name="db_user" value="{$db_user}" size="20" maxlength="100" />
      <img src="images/btn_help.gif" onclick="toggleBox('dbUser');" align="top" alt="" />
      {validate form="install" id="v_db_user" page="3" message=$smarty.capture.field_required}
      <br />
      <div id="dbUserSD">{l}Database username{/l}</div>
      <div id="dbUser" class="longDescription"><p>{l}The username used to connect to the database server. An example username is 'mysql_10'.{/l}</p><p><i>{l}Note: Create and Drop permissions <b>are required</b> at this point of the installation procedure.{/l}</i></p></div>
   </td>
  </tr>
  <tr>
    <td width="30%">{l}Password{/l}</td>
    <td width="70%" class="smallDesc">
      <input type="password" name="db_password" value="{$db_password}" size="20" maxlength="100" />
      <img src="images/btn_help.gif" onclick="toggleBox('dbPass');" align="top" alt="" />
      <br />
      <div id="dbPassSD">{l}Database password{/l}</div>
      <div id="dbPass" class="longDescription">{l}The password is used together with the username, which forms the database user account.{/l}</div>
   </td>
  </tr>
</table>

{elseif $step eq 4}
<p>{l}Create an administrative user for the phpLinkDirectory.{/l}</p>
<br />
<table border="0" class="formPage" width="100%">
  <tr>
    <td width="30%">{l}Username{/l}<span class='req'>*</span></td>
    <td width="70%" class="smallDesc">
      <input type="text" name="admin_user" value="{$admin_user}" size="20" maxlength="25" />
      <img src="images/btn_help.gif" onclick="toggleBox('adminUser');" align="top" alt="" />
      {validate form="install" id="v_admin_user" page="4" message=$smarty.capture.invalid_username}
      <br />
      <div id="adminUserSD">{l}Administrator username{/l}</div>
      <div id="adminUser" class="longDescription"><p>{l}The username used to access the administrative pages of phpLinkDirectory. The user name must have minimum 4 characters, maximum 10 characters and must contain only letters and digits.{/l}</p></div>
   </td>
  </tr>
  <tr>
    <td width="30%">{l}Name{/l}<span class='req'>*</span></td>
    <td width="70%" class="smallDesc">
      <input type="text" name="admin_name" value="{$admin_name}" size="20" maxlength="100" />
      <img src="images/btn_help.gif" onclick="toggleBox('adminName');" align="top" alt="" />
      {validate form="install" id="v_admin_name" page="4" message=$smarty.capture.field_required}
      <br />
      <div id="adminNameSD">{l}Administrator name{/l}</div>
      <div id="adminName" class="longDescription"><p>{l}The name of the administrative user. This name will be used in the <i>From:</i> field when sending emails.{/l}</p></div>
   </td>
  </tr>
  <tr>
    <td width="30%">{l}Password{/l}<span class='req'>*</span></td>
    <td width="70%" class="smallDesc">
      <input type="password" name="admin_password" value="" size="20" maxlength="25" />
      <img src="images/btn_help.gif" onclick="toggleBox('adminPass');" align="top" alt="" />
      {validate form="install" id="v_admin_password" page="4" message=$smarty.capture.invalid_password}
      <br />
      <div id="adminPassSD">{l}Administrator password{/l}</div>
      <div id="adminPass" class="longDescription">{l}The password is used together with the username to access the administrative pages of phpLinkDirectory. The password must have minimum 6 characters and maximum 10 characters.{/l}</div>
   </td>
  </tr>
  <tr>
    <td width="30%">{l}Confirm Password{/l}<span class='req'>*</span></td>
    <td width="70%" class="smallDesc">
      <input type="password" name="admin_passwordc" value="" size="20" maxlength="25" />
      <img src="images/btn_help.gif" onclick="toggleBox('adminPassc');" align="top" alt="" />
      {validate form="install" id="v_admin_passwordc" page="4"  message=$smarty.capture.password_not_match}
      <br />
      <div id="adminPasscSD">{l}Confirm administrator password{/l}</div>
      <div id="adminPassc" class="longDescription">{l}To verify that the password was typed correctly please enter it again.{/l}</div>
   </td>
  </tr>
  <tr>
    <td width="30%">{l}Email{/l}<span class='req'>*</span></td>
    <td width="70%" class="smallDesc">
      <input type="text" name="admin_email" value="{$admin_email}" size="20" maxlength="250" />
      <img src="images/btn_help.gif" onclick="toggleBox('adminEmail');" align="top" alt="" />
      {validate form="install" id="v_admin_email" page="4" message=$smarty.capture.invalid_email}
      <br />
      <div id="adminEmailSD">{l}Administrator Email{/l}</div>
      <div id="adminEmail" class="longDescription"><p>{l}Administrative email address. This email address will be used for notifications regarding the system.{/l}</p></div>
   </td>
  </tr>
</table>

{elseif $step ge 5}
<h3>{l}Thank you for choosing phpLinkDirectory.{/l}</h3>
<br /><br />
<p>{l}To start setting up the directory access the administrative pages {/l}<a href="{$smarty.const.DOC_ROOT}/admin/login.php">{l}here{/l}</a>.</p>
<br />
<p>{l}You can browse the directory {/l}<a href="{$smarty.const.DOC_ROOT}/">{l}here{/l}</a>.</p>
<br /><br /><br />
<h3>{l}YOU MUST DELETE THE FOLLOWING FILE(S) BEFORE CONTINUING:{/l} <em>{$smarty.const.DOC_ROOT}/install/index.php</em></h3>
<h3>{l}YOU MUST DROP WRITING PERMISSIONS TO FOLLOWING FILE(S) BEFORE CONTINUING:{/l} <em>{$smarty.const.DOC_ROOT}/include/config.php</em></h3>
{/if}
         </td>
      <td rowspan="2">
         <img id="rc" src="images/rc.gif" width="7" height="392" alt="" /></td>
   </tr>
   <tr>
      <td>
         <img id="lc2" src="images/lc2.gif" width="7" height="30" alt="" /></td>
      <td id="buttons" colspan="2">
      {if $btn_back}
         <input type="submit" name="submit" value="back" title="{l}Go to previous step{/l}" accesskey="b" class="button" />
      {/if}
      {if not $fatal}
         {if $btn_next}
            <input type="submit" name="submit" value="next" title="{l}Go to next step{/l}" accesskey="n" class="button" />
         {/if}
      {/if}
      {if $btn_restart}
         <input type="submit" name="submit" value="restart" title="{l}Restart installation/update process.{/l}" accesskey="r" class="button" />
      {/if}
      </td>
   </tr>
   <tr>
      <td>
         <img id="lb" src="images/lb.gif" width="7" height="16" alt="" /></td>
      <td colspan="2">
         <img id="bc" src="images/bc.gif" width="686" height="16" alt="" /></td>
      <td>
         <img id="rb" src="images/rb.gif" width="7" height="16" alt="" /></td>
   </tr>
</table>
</form>
</div>
</body>
</html>