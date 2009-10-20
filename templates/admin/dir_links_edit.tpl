   {* Error and confirmation messages *}
   {include file="admin/messages.tpl"}

{strip}
{if $sql_error}
   <div class="err">
      <img src="images/no_22.gif" alt="" />
      <p>{l}An error occured while saving.{/l}</p>
      <p>{l}The database server returned the following message:{/l}</p>
      <p>{$sql_error}</p>
   </div>
{/if}

{if $posted}
   <div class="msg">
      {l}Link saved.{/l}
   </div>
{/if}

{if isset($AllowedFeat) and $AllowedFeat ne 1}
   <div class="err">
      <img src="images/no_22.gif" alt="" />
      <p>{l}Maximum number of featured links for this category exceeded!{/l}</p>
      <p>{l}Please review link preferences.{/l}</p>
   </div>
{/if}

<form method="post" action="">
<table border="0" class="formPage">
{if $posted}
  <tr><td colspan="2"><h2>{l}Create new link{/l}</h2></td></tr>
{/if}
  <tr>
   <td class="label"><span class='req'>*</span>{l}Title{/l}:</td>
   <td class="smallDesc">
      <input type="text" name="TITLE" value="{$TITLE|escape|trim}" size="30" maxlength="255" class="text" />
      {validate form="dir_links_edit" id="v_TITLE" message=$smarty.capture.field_char_required}
      {validate form="dir_links_edit" id="v_TITLE_U" message=$smarty.capture.title_not_unique}
   </td>
  </tr>
  <tr>
   <td class="label"><span class='req'>*</span>{l}URL{/l}:</td>
   <td class="smallDesc">
      <input type="text" name="URL" value="{$URL|escape|trim}" size="40" maxlength="255" class="text"/>
      {validate form="dir_links_edit" id="v_URL" message=$smarty.capture.invalid_url}
      {validate form="dir_links_edit" id="v_URL_U" message=$smarty.capture.url_not_unique}
   </td>
  </tr>
  <tr>
   <td class="label">{l}Description{/l}:</td>
   <td class="smallDesc">
      <textarea name="DESCRIPTION" rows="6" cols="50" class="text" wrap="yes">{$DESCRIPTION|trim|escape}</textarea>
   </td>
  </tr>
   <tr>
      <td class="label">{l}Owner Name{/l}:</td>
      <td class="smallDesc">
         <input type="text" name="OWNER_NAME" value="{$OWNER_NAME|escape|trim}" size="30" maxlength="255" class="text" />
      </td>
   </tr>
   <tr>
      <td class="label">{l}Owner Email{/l}:</td>
      <td class="smallDesc">
         <input type="text" name="OWNER_EMAIL" value="{$OWNER_EMAIL|escape|trim}" size="30" maxlength="255" class="text" />
         {validate form="dir_links_edit" id="v_OWNER_EMAIL" message=$smarty.capture.invalid_email}
      </td>
   </tr>
  <tr>
   <td class="label"><span class='req'>*</span>{l}Category{/l}:</td>
   <td class="smallDesc">
      {html_options options=$categs selected=$CATEGORY_ID name="CATEGORY_ID"}
      {validate form="dir_links_edit" id="v_CATEGORY_ID" message=$smarty.capture.no_url_in_top}
   </td>
  </tr>
   {if $smarty.const.FTR_ENABLE}
   <tr>
      <td class="label"><span class='req'>*</span>{l}Featured{/l}:</td>
      <td class="smallDesc">
         <input type="checkbox" name="FEATURED" value="1" {if $FEATURED}checked="checked"{/if} />
      </td>
   </tr>
   {/if}
  <tr>
   <td class="label"><span class='req'>*</span>{l}NoFollow{/l}:</td>
   <td class="smallDesc">
   <input type="checkbox" name="NOFOLLOW" value="1" {if $NOFOLLOW}checked="checked"{/if} />
   </td>
  </tr>
  <tr>
   <td class="label"><span class='req'>*</span>{l}Require Reciprocal Link{/l}:</td>
   <td class="smallDesc">
      <input type="checkbox" name="RECPR_REQUIRED" value="1" {if $RECPR_REQUIRED}checked="checked"{/if} />
   </td>
  </tr>
  <tr>
   <td class="label">{l}Reciprocal Link URL{/l}:</td>
   <td class="smallDesc">
      <input type="text" name="RECPR_URL" value="{$RECPR_URL|escape|trim}" size="40" class="text" />
      {validate form="dir_links_edit" id="v_RECPR_URL" message=$smarty.capture.invalid_url}
      {if !empty ($RECPR_URL)}
         <p><a style="margin:1px 1em;" href="{$RECPR_URL|escape|trim}" title="{l}Visit{/l}: {$RECPR_URL|escape|trim}" class="btn" target="_blank">{l}Visit reciprocal page{/l}</a></p>
      {/if}
   </td>
  </tr>
  <tr>
   <td class="label"><span class='req'>*</span>{l}Status{/l}:</td>
   <td class="smallDesc">
      {html_options options=$stats selected=$STATUS name="STATUS"}
   </td>
  </tr>
  <tr>
   <td class="label">{l}Link Expires{/l}:</td>
   <td class="smallDesc">
      <input type="text" name="EXPIRY_DATE" value="{$EXPIRY_DATE}" size="20" maxlength="40" class="text"/>
      {validate form="dir_links_edit" id="v_EXPIRY_DATE" message=$smarty.capture.invalid_date}
   </td>
  </tr>

  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" name="submit" value="Save" class="btn" /></td>
  </tr>
</table>
</form>
{/strip}