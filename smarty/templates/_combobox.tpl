<select name="{$NAME}">
{foreach item=option from=$options}
    {if $option[0] eq {$SELECTEDITEM}}
        {$selected="SELECTED"}
    {else}
        {$selected=""}
    {/if}
    <option value="{$option[0]}" {$selected}>{$option[1]}</option>
{/foreach}    
</select>