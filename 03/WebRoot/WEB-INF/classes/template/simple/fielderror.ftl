<#if fieldErrors?exists><#t/>
<#assign eKeys = fieldErrors.keySet()><#t/>
<#assign eKeysSize = eKeys.size()><#t/>
<#assign doneStartUlTag=false><#t/>
<#assign doneEndUlTag=false><#t/>
<#assign haveMatchedErrorField=false><#t/>
<#if (fieldErrorFieldNames?size > 0) ><#t/>
	<#list fieldErrorFieldNames as fieldErrorFieldName><#t/>
		<#list eKeys as eKey><#t/>
		<#if (eKey = fieldErrorFieldName)><#t/>
			<#assign haveMatchedErrorField=true><#t/>
			<#assign eValue = fieldErrors[fieldErrorFieldName]><#t/>
			<#if (haveMatchedErrorField && (!doneStartUlTag))><#t/>		
			
				
<#assign doneStartUlTag=true><#t/>
</#if><#t/>
<#list eValue as eEachValue><#t/>
   ${eEachValue}
</#list><#t/>			
</#if><#t/>
</#list><#t/>
</#list><#t/>
	
	
	
	
	
	
	
	
	<#if (haveMatchedErrorField && (!doneEndUlTag))><#t/>
				<#assign doneEndUlTag=true><#t/>
	</#if><#t/>
<#else><#t/>
	<#if (eKeysSize > 0)><#t/>
	
	
	
			<#list eKeys as eKey><#t/>
				<#assign eValue = fieldErrors[eKey]><#t/>
				<#list eValue as eEachValue><#t/>
					${eEachValue}</span>
				</#list><#t/>
			</#list><#t/>
	
		
		
		
	</#if><#t/>
</#if><#t/>
</#if><#t/>