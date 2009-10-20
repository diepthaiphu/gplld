{strip}
<a href="dir_categs_edit.php?action=N" class="btn"><img src="images/a_new.gif" width="16" height="13" border="0" alt="Edit" /> New Category</a> <a href="dir_categs_edit.php?action=N&s=1" class="btn"><img src="images/a_new.gif" width="16" height="13" border="0" alt="Edit" /> New Symbolic Category</a><br /><br />
<table border="0" cellpadding="0" cellspacing="0" class="list">
  <tr>
  {foreach from=$columns key=col item=name}
  {if $ENABLE_REWRITE or $col ne 'TITLE_URL'}
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
  {/if}
  {/foreach}
  	<td class="listHeader" colspan="2">{l}Action{/l}</td>
  </tr>
 {foreach from=$list item=row key=id}
  <tr class="{cycle values="odd,even"}">
  {foreach from=$columns key=col item=name}
  {if $ENABLE_REWRITE or $col ne 'TITLE_URL'}
  <td>
  	{if $col eq 'STATUS'}
  		{assign var="s" value=$row.$col}
  		<img src="images/stat_{$s}.gif" width="9" height="9" style="vertical-align: middle"/> {$stats[$s]}
  	{elseif $col eq 'TITLE'}
  		<a href="dir_links.php?c={if $row.SYMBOLIC ne 1}{$id}{else}{$row.SYMBOLIC_ID}{/if}">{$row.$col}</a>
	{elseif $col eq 'SYMBOLIC'}
  		{assign var="sy" value=$row.$col}
  		{$symb[$sy]}
    {elseif $col eq 'DATE_ADDED'}
      {$row.$col|date_format:$date_format}
  	{else}
  		{$row.$col}&nbsp;
  	{/if}
  </td>
  {/if}
  {/foreach}
    <td align="center"><a href="dir_categs_edit.php?s={$row.SYMBOLIC}&action=E:{$id}"><img src="images/a_edit.gif" width="16" height="13" border="0" alt="Edit" /></a></td>
    <td align="center"><a href="javascript:if(confirm ('Are you sure you want to delete the category?'))window.location.href='dir_categs_edit.php?action=D:{$id}';"><img src="images/a_delete.gif" width="16" height="13" border="0" alt="Delete" /></a></td>
 {foreachelse}
 <tr>
 	<td colspan="{if $ENABLE_REWRITE}10{else}9{/if}" class="norec">{l}No records found.{/l}</td>
 </tr>
 {/foreach}
 <tr>
 	<td colspan="{if $ENABLE_REWRITE}10{else}9{/if}" class="norec">{include file="admin/list_pager.tpl"}</td>
 </tr>
</table>
<script type="text/javascript" src="files/table.js"></script>
<script>
tableInit();
</script>
{/strip}