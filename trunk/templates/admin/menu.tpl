{if is_array($m.menu)}
	<div class="section">
	{foreach from=$m.menu item=l key=k}
		{if is_array($l.menu)}
			<a class="item" href="javascript:void(0)">{$l.label} <img class="arrow" src="images/arrow1.gif" width="4" height="7" alt="" /></a>
			{include file="admin/menu.tpl" m=$l}
		{elseif is_array($l)}
			{if $l.disabled}
			<span class="disabled">{$l.label}</span>
			{else}
			<a class="item" href="{$l.url}{if strpos($l.url, '?')!== false}&r=1{else}?r=1{/if}">{$l.label}</a>
			{/if}
		{else}
		<a class="item" href="{$mk}_{$k}.php?r=1">{$l}</a>
		{/if}
	{/foreach}
    </div>
{/if}
