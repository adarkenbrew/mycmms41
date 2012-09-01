<div class="information"><p><a href="{$wiki}" target="new">WIKI documentation for module {$smarty.server.SCRIPT_NAME}</a></p></div>
{if $smarty.session.PDO_ERROR}
<div class="error">DATABASE ERROR:&nbsp{$smarty.session.PDO_ERROR}</div>
{/if}
{foreach from=$errors item=error}
<div class='error'>{$error}</div>
{/foreach}
</body>
</html>
