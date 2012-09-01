{config_load file="colors.conf"}

{if $settings.depth > -1}
<tr><td bgcolor="{cycle values="{#TREE_LINECOLOR_ODD#},{#TREE_LINECOLOR_EVEN#}"}">

{for $var=0 to $settings.depth}
<img src='../../images/spacer.gif' height='22' width='22' alt='' valign='bottom' />
{/for}
 
{if $settings.subexpand}
<a href='index.php?collapse={$data.ID}#{$data.ID}'><img src='../../images/minus.gif' valign='bottom' height='22' width='22' alt='Collapse Thread' border='0' /></a>
{elseif $settings.subnoexpand}
<a href='index.php?expand={$data.ID}#{$data.ID}'><img src='../../images/plus.gif' valign='bottom' height='22' width='22' alt='Expand Thread' border='0' /></a>
{else}
<img src='../../images/spacer.gif' height='22' width='22' alt='' valign='bottom' />
{/if}
{* return_values.php?tree={$data.tree}&ID={$data.EQNUM}&ID_DESC={$data.EQNUM_DESCRIPTION} *}
<a name="{$data.ID}"><a href="{$data.function}">{$data.KEY}</a><td><td class="{$data.KEY_TYPE}">{$data.KEY_DESCRIPTION}</td></tr>

{/if} 