{strip}
<a href="email_message_edit.php?action=N" class="btn"><img src="images/a_new.gif" width="16" height="13" border="0" alt="New" /> New Email Template</a><br /><br />
<table border="0" cellpadding="0" cellspacing="0" class="list">
  <tr>
  {foreach from=$columns key=col item=name}
  <td class="listHeader" id="{$col}"><img src="images/th_rb.gif" class="rb"/>
  {if $SORT_FIELD eq $col}
  	{if $SORT_ORDER eq 'ASC'}
  		<img src="images/sort_a.gif" width="16" height="9" class="order"/>
  	{else}
  		<img src="images/sort_d.gif" width="16" height="9" class="order"/>
  	{/if}
  {else}
  	<img src="images/spacer.gif" width="16" height="9" class="order"/>
  {/if}
  {$name}
  </td>
  {/foreach}
  	<td class="listHeader" colspan="2">{l}Action{/l}</td>
  </tr>
 {foreach from=$list item=row key=id}
  <tr class="{cycle values="odd,even"}">
  {foreach from=$columns key=col item=name}
  {assign var="val" value=$row.$col}
    <td>
  	{if $col eq 'TPL_TYPE'}
  	{$tpl_types.$val}
  	{else}
  	{$row.$col}&nbsp;
  	{/if}
  	</td>
  {/foreach}
    <td align="center"><a href="email_message_edit.php?action=E:{$id}"><img src="images/a_edit.gif" width="16" height="13" border="0" alt="Edit" /></a></td>
    <td align="center"><a href="javascript:if(confirm ('Are you sure you want to delete the message template?'))window.location.href='email_message_edit.php?action=D:{$id}';"><img src="images/a_delete.gif" width="16" height="13" border="0" alt="Delete" /></a></td>
 {foreachelse}
 <tr>
 	<td colspan="10" class="norec">{l}No records found.{/l}</td>
 </tr>
 {/foreach}
 <tr>
 	<td colspan="10" class="norec">{include file="admin/list_pager.tpl"}</td>
 </tr>
</table>
<script type="text/javascript" src="files/table.js"></script>
<script>
tableInit();
</script>
{/strip}