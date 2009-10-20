   {* Error and confirmation messages *}
   {include file="admin/messages.tpl"}

{strip}
{if $posted}
   <div class="msg">
      {l}Profile updated.{/l}
   </div>
{/if}

<form method="post" action="">
<table border="0" class="formPage">
   <tr>
      <td class="label"><span class='req'>*</span>{l}Login{/l}:</td>
      <td class="smallDesc">
         <input type="text" name="LOGIN" value="{$LOGIN}" size="30" maxlength="100" class="text" />
         {validate form="conf_profile" id="v_LOGIN" message=$smarty.capture.invalid_username}
      </td>
   </tr>
   <tr>
      <td class="label"><span class='req'>*</span>{l}Name{/l}:</td>
      <td class="smallDesc">
         <input type="text" name="NAME" value="{$NAME}" size="30" maxlength="100" class="text" />
         {validate form="conf_profile" id="v_NAME" message=$smarty.capture.field_char_required}
      </td>
   </tr>
   <tr>
      <td class="label">{l}Password{/l}:</td>
      <td class="smallDesc">
         <input type="password" name="PASSWORD" value="" size="30" maxlength="100" class="text" />
         {validate form="conf_profile" id="v_PASSWORD" message=$smarty.capture.field_pass_required}
      </td>
   </tr>
   <tr>
      <td class="label">{l}Confirm Password{/l}:</td>
      <td class="smallDesc">
         <input type="password" name="PASSWORDC" value="" size="30" maxlength="100" class="text" />
         {validate form="conf_profile" id="v_PASSWORDC" message=$smarty.capture.password_not_match}
      </td>
   </tr>
   <tr>
      <td class="label"><span class='req'>*</span>{l}Email{/l}:</td>
      <td class="smallDesc">
         <input type="text" name="EMAIL" value="{$EMAIL}" size="30" maxlength="255" class="text" />
         {validate form="conf_profile" id="v_EMAIL" message=$smarty.capture.invalid_email}
      </td>
   </tr>
   <tr>
      <td class="label">{l}Link Submit Notification{/l}:</td>
      <td class="smallDesc">
         <input type="checkbox" name="SUBMIT_NOTIF" value="1"{if $SUBMIT_NOTIF} checked="checked"{/if} />
      </td>
   </tr>
   <tr>
      <td class="label">{l}Link Payment Notification{/l}:</td>
      <td class="smallDesc">
         <input type="checkbox" name="PAYMENT_NOTIF" value="1" {if $PAYMENT_NOTIF}checked="checked"{/if} />
      </td>
   </tr>
   <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="submit" value="Save" class="btn" /></td>
   </tr>
</table>
</form>
{/strip}