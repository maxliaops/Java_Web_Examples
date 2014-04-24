<#if (actionErrors?exists && actionErrors?size > 0)>
<#list actionErrors as error>
${error}
</#list> 
</#if>