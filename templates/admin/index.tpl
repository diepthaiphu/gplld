   {* Error and confirmation messages *}
   {include file="admin/messages.tpl"}

{strip}
<div class="{if $update_available ne 1}version{else}err{/if}">{$version|escape|trim}</div>

{foreach from=$security_warnings item=warning}
   <div class="err">{$warning|trim}</div>
{/foreach}

<table border="0" cellpadding="0" cellspacing="0" class="list">
  <tr>
     <td class="listHeader"><img src="images/th_rb.gif" class="rb" alt="" />{l}Statistic{/l}</td>
     <td class="listHeader" colspan="2">{l}Value{/l}</td>
  </tr>
  <tr class="odd">
     <td>{l}Active Links{/l}</td>
     <td>{$stats[0]}</td>
  </tr>
  <tr class="even">
     <td>{l}Pending Links{/l}</td>
     <td>{$stats[1]}</td>
  </tr>
  <tr class="odd">
     <td>{l}Inactive Links{/l}</td>
     <td>{$stats[2]}</td>
  </tr>
  <tr class="even">
     <td>{l}Categories{/l}</td>
     <td>{$stats[3]}</td>
  </tr>
  <tr class="odd">
     <td>{l}Sent Emails{/l}</td>
     <td>{$stats[4]}</td>
  </tr>
  <tr class="even">
     <td>{l}Email Templates{/l}</td>
     <td>{$stats[5]}</td>
  </tr>
</table>

{foreach from=$news item=item}
<table border="0" cellpadding="0" cellspacing="0" class="news">
   <tr>
      <td class="title"><span class="date">{$item.date}</span>{$item.title|escape|trim}</td>
   </tr>
   <tr>
      <td class="body">{$item.body|trim}</td>
   </tr>
</table>
{/foreach}
{/strip}