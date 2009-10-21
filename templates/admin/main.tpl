<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <title>phpLinkDirectory v{$smarty.const.CURRENT_VERSION} Admin{if !empty($title)} - {$title|escape|trim}{/if}</title>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
     
	{* CSS Style file *}
   <link rel="stylesheet" type="text/css" href="{$smarty.const.DOC_ROOT}/../templates/admin/style.css" />
</head>
<body>
<div id="body-container">
<div id="navigation">
	<div class="">
		<div id="page-nav">
			<ul class="menu">
			{foreach from=$menu item=mm key=mk}
				<li>
				<a class="button" href="{if is_array($mm)}javascript:void(0){else}{$mk}.php{/if}">
					<!-- #TODO <img src="images/m_{$mk}.gif" border="0" alt="" /> -->
					{if is_array($mm)}
						{$mm.label}
					{else}
						{$mm}
					{/if}
				</a>
				{include file="admin/menu.tpl" m=$mm}
				</li>
			{/foreach}
			</ul>
		</div>
	</div>
</div>
<div id="header-container">
	<div id="header">

   {if !empty($title)}
      <h1 id="site-title">{$title|escape|trim}</h1>
   {/if}
   </div>
</div>
<div id="container">
   <div id="content">
      {$content}
   </div>
</div>
<div id="footer-container">
	<div id="footer">
		<p class="copyright">
&copy; 2009 Directory
</p>
<p class="credit">
Powered by <a href="http://www.gplld.com" title="GPL Link Directory Script">gplLD</a>
</p>

	</div>
</div>
</div>
</body>
</html>