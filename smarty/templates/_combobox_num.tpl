<select name="{$NAME}">
{foreach item=option from=$options}
    {if $option eq {$SELECTEDITEM}}
        {$selected="SELECTED"}
    {else}
        {$selected=""}
    {/if}
    <option value="{$option}" {$selected}>{$option}</option>
{/foreach}    
</select>