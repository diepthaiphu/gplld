{strip}
{if $posted}
<div class="msg">
{l}Email was sent.{/l}
</div>
<table border="0" class="formPage" width="100%">
  <tr>
  	<td class="label">{l}Site Name{/l}</td>
  	<td>{$sent.TITLE}</td>
  </tr>
  <tr>
  	<td class="label">{l}Site Owner Name{/l}</td>
  	<td>{$sent.NAME}</td>
  </tr>
  <tr>
  	<td class="label">{l}Link URL{/l}</td>
  	<td>{$sent.URL}</td>
  </tr>
   <tr>
  	<td class="label">{l}Email{/l}</td>
  	<td>{$sent.EMAIL}</td>
  </tr>
  <tr>
  	<td class="label">{l}Message Template{/l}</td>
  	<td>{$tpls.$EMAIL_TPL_ID}</td>
  </tr>
</table>
{/if}
<form method="post" action="">
{include file="admin/messages.tpl"}
{if $send_error}
<div class="err">
<image src="images/no_22.gif"/>
<p>{l}An error occured while sending email.{/l}</p>
<p>{l}The message was not sent.{/l}</p>
</div>
{/if}
{if $sql_error}
<div class="err">
<image src="images/no_22.gif"/>
<p>{l}An error occured while saving.{/l}</p>
<p>{l}The database server returned the following message:{/l}</p>
<p>{$sql_error}</p>
</div>
{/if}
{validate id="v_check_email" message=$smarty.capture.email_send_error}
<table border="0" class="formPage">
{if $posted}
  <tr><td colspan="2"><h2>Send new email</h2></td></tr>
{/if}
  <tr>
  	<td class="label"><span class='req'>*</span>{l}Site Name{/l}:</td>
  	<td class="smallDesc">
  		<input type="text" name="TITLE" value="{$TITLE}" size="40" maxlength="100" class="text"/>{validate id="v_TITLE" message=$smarty.capture.field_char_required}
  	</td>
  </tr>
  <tr>
  	<td class="label">{l}Site Owner Name{/l}:</td>
  	<td class="smallDesc">
  		<input type="text" name="NAME" value="{$NAME}" size="40" maxlength="100" class="text"/>
  	</td>
  </tr>
  <tr>
  	<td class="label"><span class='req'>*</span>{l}Link URL{/l}:</td>
  	<td class="smallDesc">
  		<input type="text" name="URL" value="{$URL}" size="40" maxlength="255" class="text"/>{validate id="v_URL" message=$smarty.capture.invalid_url}
  	</td>
  </tr>
   <tr>
  	<td class="label"><span class='req'>*</span>{l}Email{/l}:</td>
  	<td class="smallDesc">
  		<input type="text" name="EMAIL" value="{$EMAIL}" size="40" maxlength="100" class="text"/>{validate id="v_EMAIL" message=$smarty.capture.invalid_email}
  	</td>
  </tr>
  <tr>
  	<td class="label"><span class='req'>*</span>{l}Message Template{/l}:</td>
  	<td class="smallDesc">
  		{html_options options=$tpls selected=$EMAIL_TPL_ID name="EMAIL_TPL_ID"}
  	</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" name="submit" value="Send" class="btn"/></td>
  </tr>
</table>
</form>
{/strip}