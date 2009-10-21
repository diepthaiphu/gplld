<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <title>phpLinkDirectory v{$smarty.const.CURRENT_VERSION} Admin - Login</title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <meta name="robots" content="noindex, nofollow" />
   <link rel="stylesheet" type="text/css" media="screen,print,projection" href="files/main.css" />
</head>
<body style="vertical-align:middle">
{* Error and confirmation messages *}
{include file="admin/messages.tpl"}
{strip}
<form method="post" action="">
   <div style="width:340px; margin:0 auto; margin-top:100px;">
      <div id="login">
         <div class="ttl">
            <img src="images/nubs.gif" alt="" style="margin-top:5px; float:left;"/>
            <img src="images/m_login.gif" alt="" style="margin-top:6px; margin-left:5px; float:left;"/>
            <span style="margin-top:6px; margin-left:5px; float:left;">Admin Login</span>
            <img src="images/logo.gif" border="0" alt="" style="float:right;" />
         </div>
         <div id="login-main">
         <table border="0" cellpadding="0" cellspacing="5" style="margin:0 auto; text-align:left;">
            <tr>
               <td colspan="2">
                  {if $failed}
                     <span class="warning" style="margin:5px;">{l}Invalid username or password.{/l}</span>
                  {/if}
                  {if $no_permission}
                     <span class="warning" style="margin:5px;">{l}No permissions set for this user.{/l}</span>
                  {/if}&nbsp;
               </td>
            </tr>
            <tr>
               <td>{l}User{/l}</td>
               <td>
                  <input type="text" name="user" value="{$user}" size="10" maxlength="100" class="text" />
                  {validate form="login" id="v_user" message=$smarty.capture.field_required}
               </td>
            </tr>
            <tr>
               <td>{l}Password{/l}</td>
               <td>
                  <input type="password" name="pass" value="" size="10" maxlength="100" class="text" />
                  {validate form="login" id="v_pass" message=$smarty.capture.field_required}
               </td>
            </tr>
            <tr>
               <td>&nbsp;</td>
               <td><input type="submit" name="submit" value="Login" class="btn" /></td>
            </tr>
         </table>
      </div>
   </div>

   <img src="images/lb.gif" alt="" style="float:left" />
   <img src="images/cb.gif" alt="" style="float:left;" width="322" height="10" />
   <img src="images/rb.gif" alt="" style="float:left; margin-right:-2px;" />
</div>
</form>
{/strip}
</body>
</html>