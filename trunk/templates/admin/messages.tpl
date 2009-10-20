{strip}
{php}
$this->assign('yes_no', array( 1 => $this->translate('Yes'), 0 => $this->translate('No')));
{/php}
{capture name='field_char_required'}<span class="errForm">{l}This field is required.{/l}</span>{/capture}
{capture name='field_pass_required'}<span class="errForm">{l}This field is required.{/l}</span>{/capture}
{capture name='field_num_required'}<span class="errForm">{l}Required numeric field.{/l}</span>{/capture}
{capture name='field_integer_required'}<span class="errForm">{l}Required integer field.{/l}</span>{/capture}
{capture name='invalid_username'}<span class="errForm">{l}The user name must have minimum 4 characters, maximum 10 characters and must contain only letters and digits.{/l}</span>{/capture}
{capture name='invalid_password'}<span class="errForm">{l}The password must have minimum 6 characters and maximum 10 characters.{/l}</span>{/capture}
{capture name='password_not_match'}<span class="errForm">{l}Password confirmation does not match. Please type again.{/l}</span>{/capture}
{capture name='invalid_email'}<span class="errForm">{l}Invalid email address format.{/l}</span>{/capture}
{capture name='invalid_url_path'}<span class="errForm">{l}Invalid URL path. Allowed symbols are: a-z, A-Z, 0-9, _, -{/l}</span>{/capture}
{capture name='invalid_url'}<span class="errForm">{l}Invalid URL.{/l}</span>{/capture}
{capture name='url_not_online'}<span class="errForm">{l}The URL could not be validated. Either the page does not exist or the server cound not be contacted.{/l}</span>{/capture}
{capture name='title_not_unique'}<span class="errForm">{l}Title is not unique in the parent category.{/l}</span>{/capture}
{capture name='url_title_not_unique'}<span class="errForm">{l}URL title is not unique in the parent category.{/l}</span>{/capture}
{capture name='url_not_unique'}<span class="errForm">{l}URL already exists in the directory.{/l}</span>{/capture}
{capture name='email_not_unique'}<span class="errForm">{l}Sorry, but that e-mail address is already registered to a user.{/l}</span>{/capture}
{capture name='no_url_in_top'}<span class="errForm">{l}Please select a category.{/l}</span>{/capture}
{capture name='invalid_code'}<span class="errForm">{l}Invalid code.{/l}</span>{/capture}
{capture name='invalid_date'}<span class="errForm">{l}Invalid date format.{/l}</span>{/capture}
{capture name='field_link_type'}<span class="errForm">{l}Please select a pricing option.{/l}</span>{/capture}
{capture name='recpr_not_found'}<span class="errForm">{l}A link to #SITE_URL# could not be found at the specified URL.{/l}</span>{/capture}
{capture name='email_template_already_defined'}<span class="errForm">{l}Only 1 template for Email And Add Link can be defined.{/l}</span>{/capture}
{capture name='invalid_symbolic_category'}<span class="errForm">{l}Location of symbolic category cannot be parent category.{/l}</span>{/capture}
{capture name='symbolic_category_exist'}<span class="errForm">{l}A symbolic category already exists for this category and parent category.{/l}</span>{/capture}
{capture name='invalid_symbolic_parent'}<span class="errForm">{l}Symbolic category cannot have the same parent as the reference category.{/l}</span>{/capture}
{capture name='login_not_unique'}<span class="errForm">{l}The login name entered already exists.{/l}</span>{/capture}
{capture name='permission_not_unique'}<span class="errForm">{l}Permission already granted for this category.{/l}</span>{/capture}
{capture name='permission_is_sub_cat'}<span class="errForm">{l}User already has permission for the parent(s) of this category.{/l}</span>{/capture}

{if $email_send_errors and not $posted}
<div class="err">
<b>Warning!</b>
{if count($email_send_errors.dir)>0}
<h2>Directory</h2>
<ul>
{foreach from=$email_send_errors.dir item=row}
<li>{if $row eq 'URL'}{l}a link with this URL already exists in the directory;{/l}{else}{l}a link with this title already exists in the directory;{/l}{/if}</li>
{/foreach}
</ul>
{/if}
{if count($email_send_errors.email)>0}
<h2>Emails</h2>
<ul>
{foreach from=$email_send_errors.email item=row}
<li>{if $row.TYPE eq 'EMAIL'}{l}an email was already sent to this recipient on {$row.DATE} with link URL <i>{$row.URL}</i> and link title <i>{$row.TITLE}</i>;{/l}
{elseif $row.TYPE eq 'URL'}{l}an email with the same link URL was already sent to <i>{$row.EMAIL}</i> on {$row.DATE} with link title <i>{$row.TITLE}</i>;{/l}
{elseif $row.TYPE eq 'TITLE'}{l}an email with the same link title was already sent to <i>{$row.EMAIL}</i> on {$row.DATE} with link URL <i>{$row.URL}</i>;{/l}
{/if}</li>
{/foreach}
</ul>
{/if}
{l}Ignore the warning(s)?{/l}{html_radios options=$yes_no name="IGNORE" checked=$IGNORE separator="&nbsp;"}
</div>
{/if}
{/strip}