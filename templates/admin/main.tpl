{php}
$isExplorer = false;
$isMozilla = false;
$agent = strtolower($HTTP_USER_AGENT);
if ((strpos ($agent, "ie")  !== false)) { $isExplorer = true; } else { $isMozilla = true; }
if ((strpos ($agent, "jig") !== false)) { $isExplorer = false; $isMozilla = false; }

$this->assign('isExplorer', $isExplorer);
$this->assign('isMozilla', $isMozilla);
{/php}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <title>phpLinkDirectory v{$smarty.const.CURRENT_VERSION} Admin{if !empty($title)} - {$title|escape|trim}{/if}</title>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
   <link rel="stylesheet" type="text/css" href="files/main.css" />
   <link rel="stylesheet" type="text/css" href="files/menu.css" />
   {if $isExplorer}
      <link rel="stylesheet" type="text/css" href="files/explorer.css" /><!-- IExplorer specific features enabled -->
   {elseif $isMozilla}
      <link rel="stylesheet" type="text/css" href="files/mozilla.css" /><!-- Mozilla specific features enabled -->
   {/if}

   <script type="text/javascript" src="files/admin.js"></script>
   <script type="text/javascript" src="files/ie5.js"></script>
   <script type="text/javascript" src="files/XulMenu.js"></script>
   <script type="text/javascript" src="files/browser.js"></script>
   <script type="text/javascript" src="files/tooltip.js"></script>
   <script type="text/javascript" src="files/pop-list.js"></script>
</head>
<body>

<script type="text/javscript">
   /* <![CDATA[ */
   /* preload images */
   var arrow1 = new Image(4, 7);
   arrow1.src = "images/arrow1.gif";
   var arrow2 = new Image(4, 7);
   arrow2.src = "images/arrow2.gif";
   /* ]]> */
</script>
{strip}
<div id="page">
   <div class="menugradient">
      <div id="bar" class="bar">
         <table cellspacing="0" cellpadding="0" id="mainMenu" class="XulMenu" border="0">
         <tr>
            <td>
               <img src="images/nubs.gif" alt="" style="margin-top:5px;"/>
            </td>
            {foreach from=$menu item=mm key=mk}
            <td>
               <a class="button" href="{if is_array($mm)}javascript:void(0){else}{$mk}.php{/if}"><img src="images/m_{$mk}.gif" border="0" alt="" />{if is_array($mm)}{$mm.label}{else}{$mm}{/if}</a>
               {include file="admin/menu.tpl" m=$mm}
            </td>
            {/foreach}
            <td width="100%" align="right">
               <img src="images/logo.gif" border="0" alt="" />
            </td>
         </tr>
        </table>
      </div>
   </div>

   <script type="text/javascript">
   /* <![CDATA[ */
      var mainMenu = new XulMenu("mainMenu");
      mainMenu.arrow1 = "images/arrow1.gif";
      mainMenu.arrow2 = "images/arrow2.gif";
      mainMenu.init();
   /* ]]> */
   </script>

   {if !empty($title)}
      <h1>{$title|escape|trim}</h1>
   {/if}

   <div id="content">
      <img src="images/spacer.gif" height="32" width="1" alt="" style="float:left;"/>
      {$content}
   </div>
</div>
{/strip}
</body>
</html>