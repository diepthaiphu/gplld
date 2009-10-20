{strip}
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
  	<td class="listHeader" colspan="2">{l}Action (link){/l}</td>
  </tr>
 {foreach from=$list item=row key=id}
 {assign var="link_id" value=$row.ID}
  <tr class="{cycle values="odd,even"}">
  {foreach from=$columns key=col item=name}
  {assign var="val" value=$row.$col}
  	{if $col eq 'P_UM'}
  	<td>{$payment_um.$val}
  	{elseif $col eq 'STATUS'}
  		<td>
  		<a href="javascript:void(0);" class="pop" id="S{$link_id}" ><img src="images/stat_{$val}.gif" width="9" height="9" border="0"/> {$stats[$val]}</a>
  		<div class="pop-list" id="pS{$link_id}">
  			<h2>Set new status:</h2>
  			{foreach from=$stats item=v key=k}
  			{if $k ne $val and $k ne 1}
  				<a href="dir_links_edit.php?action=S:{$link_id}:{$k}"><img src="images/stat_{$k}.gif" width="9" height="9" border="0"/> {$stats[$k]}</a><br />
  			{/if}
  			{/foreach}
  		</div>
  	{elseif $col eq 'TITLE'}
  	<td><a class="htt" id="T{$row.LINK_ID}" href="javascript:void(0);">{$row.$col}</a>
  		{include file="admin/link_details.tpl" id=$row.LINK_ID link=$link}
  	{elseif $col eq 'LINK_TYPE'}
  	<td>{$link_type_str.$val}
  	{elseif $col eq 'P_CONFIRMED'}
  	 <td><img src="images/stat_{if $val eq -1}1{elseif $val eq 1}2{else}0{/if}.gif" width="9" height="9" border="0"/>
  	 {if $val eq -1} {l}Pending{/l}{elseif $val eq 1} {l}Payed{/l}{else} {l}Canceled{/l}{/if}
  	{elseif $col eq 'P_AMOUNT' || $col eq 'P_QUANTITY' || $col eq 'P_TOTAL' || $col eq 'P_PAYED_TOTAL'}
  	<td align="right">{$row.$col}&nbsp;
  	{else}
  	<td>{$row.$col}&nbsp;
  	{/if}
  	</td>
  {/foreach}
    <td align="center"><a href="dir_links_edit.php?action=E:{$link_id}"><img src="images/a_edit.gif" width="16" height="13" border="0" alt="Edit Link" /></a></td>
    <td align="center"><a href="conf_payment.php?action=D:{$id}" onclick="return payment_rm_confirm('{l}Are you sure you want to remove this payment?{/l}\n{l}Note: payment listings can not be restored after removal!{/l}');" title="{l}Remove Payment{/l}: {$row.TITLE|escape|trim}"><img src="images/a_delete.gif" width="16" height="13" border="0" alt="Delete" /></td>
 {foreachelse}
 <tr>
 	<td colspan="13" class="norec">{l}No records found.{/l}</td>
 </tr>
 {/foreach}
 <tr>
 	<td colspan="13" class="norec">{include file="admin/list_pager.tpl"}</td>
 </tr>
</table>
<script type="text/javascript" src="files/table.js"></script>
<script type="text/javascript">
/* <![CDATA[ */
   tableInit();
   tooltip_init();
   pop_list_init();
/* ]]> */
</script>
{/strip}