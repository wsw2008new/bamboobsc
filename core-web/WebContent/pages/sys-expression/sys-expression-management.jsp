<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="gs" uri="http://www.gsweb.org/controller/tag" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!doctype html>
<html itemscope="itemscope" itemtype="http://schema.org/WebPage">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <base href="<%=basePath%>">
    
    <title>bambooCORE</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="bambooCORE">
	<meta http-equiv="description" content="bambooCORE">
	
<style type="text/css">

</style>

<script type="text/javascript">

function CORE_PROG003D0002Q_GridFieldStructure() {
	return [
			{ name: "${action.getText('CORE_PROG003D0002Q_grid_01')}", field: "oid", formatter: CORE_PROG003D0002Q_GridButtonClick, width: "10%" },  
			{ name: "${action.getText('CORE_PROG003D0002Q_grid_02')}", field: "exprId", width: "15%" },
			{ name: "${action.getText('CORE_PROG003D0002Q_grid_03')}", field: "type", width: "10%" },
			{ name: "${action.getText('CORE_PROG003D0002Q_grid_04')}", field: "name", width: "30%" },
			{ name: "${action.getText('CORE_PROG003D0002Q_grid_05')}", field: "description", width: "35%" }
		];	
}

function CORE_PROG003D0002Q_GridButtonClick(itemOid) {
	var rd="";
	rd += "<img src=\"" + _getSystemIconUrl('PROPERTIES') + "\" border=\"0\" alt=\"edit\" onclick=\"CORE_PROG003D0002Q_edit('" + itemOid + "');\" />";	
	rd += "&nbsp;&nbsp;&nbsp;&nbsp;";	
	rd += "<img src=\"" + _getSystemIconUrl('TEXT_SOURCE') + "\" border=\"0\" alt=\"edit expression\" onclick=\"CORE_PROG003D0002Q_editExpression('" + itemOid + "');\" />";
	rd += "&nbsp;&nbsp;&nbsp;&nbsp;";				
	rd += "<img src=\"" + _getSystemIconUrl('REMOVE') + "\" border=\"0\" alt=\"delete\" onclick=\"CORE_PROG003D0002Q_confirmDelete('" + itemOid + "');\" />";
	return rd;	
}

function CORE_PROG003D0002Q_clear() {
	dijit.byId('CORE_PROG003D0002Q_type').set('value', _gscore_please_select_id);	
	dijit.byId('CORE_PROG003D0002Q_exprId').set('value', '');
	dijit.byId('CORE_PROG003D0002Q_name').set('value', '');	
	clearQuery_${programId}_grid();	
}

function CORE_PROG003D0002Q_edit(oid) {
	CORE_PROG003D0002E_TabShow(oid);
}

function CORE_PROG003D0002Q_editExpression(oid) {
	document.getElementById("CORE_PROG003D0002Q_expressionContent").value = "";
	xhrSendParameter(
			'core.systemExpressionCopy2UpdateAction.action',
			{ 'fields.oid' : oid }, 
			'json', 
			_gscore_dojo_ajax_timeout,
			_gscore_dojo_ajax_sync, 
			true, 
			function(data) {
				alertDialog(_getApplicationProgramNameById('${programId}'), data.message, function(){}, data.success);
				if ( 'Y' != data.success ) {
					return;
				}
				openCommonCodeEditorWindow(
						data.uploadOid, 
						"CORE_PROG003D0002Q_expressionContent", 
						"CORE_PROG003D0002Q_updateExpression('" + oid + "')",
						"java");			
			}, 
			function(error) {
				alert(error);
			}
	);	
}

function CORE_PROG003D0002Q_updateExpression(oid) {
	var content = document.getElementById("CORE_PROG003D0002Q_expressionContent").value;
	if ( null == content ) {
		return;
	}
	xhrSendParameter(
			'core.systemExpressionContentUpdateAction.action',
			{ 
				'fields.oid' 		: oid,
				'fields.content'	: content
			}, 
			'json', 
			_gscore_dojo_ajax_timeout,
			_gscore_dojo_ajax_sync, 
			true, 
			function(data) {
				alertDialog(_getApplicationProgramNameById('${programId}'), data.message, function(){}, data.success);
				getQueryGrid_${programId}_grid();
				if ( 'Y' == data.success ) {
					CORE_PROGCOMM0004Q_DlgHide();
				}	
			}, 
			function(error) {
				alert(error);
			}
	);		
}

function CORE_PROG003D0002Q_confirmDelete(oid) {
	confirmDialog(
			"${programId}_managementDialogId000", 
			_getApplicationProgramNameById('${programId}'), 
			"${action.getText('CORE_PROG003D0002Q_confirmDelete')}", 
			function(success) {
				if (!success) {
					return;
				}	
				xhrSendParameter(
						'core.systemExpressionDeleteAction.action', 
						{ 'fields.oid' : oid }, 
						'json', 
						_gscore_dojo_ajax_timeout,
						_gscore_dojo_ajax_sync, 
						true, 
						function(data) {
							alertDialog(_getApplicationProgramNameById('${programId}'), data.message, function(){}, data.success);
							getQueryGrid_${programId}_grid();
						}, 
						function(error) {
							alert(error);
						}
				);	
			}, 
			(window.event ? window.event : null) 
	);	
}

//------------------------------------------------------------------------------
function ${programId}_page_message() {
	var pageMessage='<s:property value="pageMessage" escapeJavaScript="true"/>';
	if (null!=pageMessage && ''!=pageMessage && ' '!=pageMessage) {
		alert(pageMessage);
	}	
}
//------------------------------------------------------------------------------

</script>

</head>

<body class="flat" bgcolor="#EEEEEE" >

	<gs:toolBar
		id="${programId}" 
		cancelEnable="Y" 
		cancelJsMethod="${programId}_TabClose();" 
		createNewEnable="Y"
		createNewJsMethod="CORE_PROG003D0002A_TabShow()"		 
		saveEnabel="N" 
		saveJsMethod=""
		refreshEnable="Y" 		 
		refreshJsMethod="${programId}_TabRefresh();" 		
		></gs:toolBar>
	<jsp:include page="../header.jsp"></jsp:include>	
	
	<input type="hidden" name="CORE_PROG003D0002Q_expressionContent" id="CORE_PROG003D0002Q_expressionContent">
	
	<table border="0" width="100%" height="55px" cellpadding="1" cellspacing="0" >
		<tr>
    		<td height="30px" width="10%"  align="right"><s:property value="getText('CORE_PROG003D0002Q_type')"/>:</td>
    		<td height="30px" width="40%"  align="left"><gs:select name="CORE_PROG003D0002Q_type" dataSource="typeMap" id="CORE_PROG003D0002Q_type"></gs:select></td>
    		<td height="30px" width="10%"  align="right"><s:property value="getText('CORE_PROG003D0002Q_exprId')"/>:</td>
    		<td height="30px" width="40%"  align="left"><gs:textBox name="CORE_PROG003D0002Q_exprId" id="CORE_PROG003D0002Q_exprId" value="" width="200" maxlength="20"></gs:textBox></td>    		  					
    	</tr>
    	<tr>
    		<td height="30px" width="10%"  align="right"><s:property value="getText('CORE_PROG003D0002Q_name')"/>:</td>
    		<td height="30px" width="90%"  align="left" colspan="3"><gs:textBox name="CORE_PROG003D0002Q_name" id="CORE_PROG003D0002Q_name" value="" width="400" maxlength="100"></gs:textBox></td>
    	</tr>
    	<tr>
    		<td  height="25px" width="100%"  align="center" colspan="4">
    			<gs:button name="CORE_PROG003D0002Q_query" id="CORE_PROG003D0002Q_query" onClick="getQueryGrid_${programId}_grid();"
    				handleAs="json"
    				sync="N"
    				xhrUrl="core.systemExpressionManagementGridQueryAction.action"
    				parameterType="postData"
    				xhrParameter=" 
    					{ 
    						'searchValue.parameter.type'		: dijit.byId('CORE_PROG003D0002Q_type').get('value'), 
    						'searchValue.parameter.exprId'		: dijit.byId('CORE_PROG003D0002Q_exprId').get('value'),
    						'searchValue.parameter.name'		: dijit.byId('CORE_PROG003D0002Q_name').get('value'),
    						'pageOf.size'						: getGridQueryPageOfSize_${programId}_grid(),
    						'pageOf.select'						: getGridQueryPageOfSelect_${programId}_grid(),
    						'pageOf.showRow'					: getGridQueryPageOfShowRow_${programId}_grid()
    					} 
    				"
    				errorFn="clearQuery_${programId}_grid();"
    				loadFn="dataGrid_${programId}_grid(data);" 
    				programId="${programId}"
    				label="${action.getText('CORE_PROG003D0002Q_query')}" 
    				iconClass="dijitIconSearch"
    				cssClass="alt-primary"></gs:button>
    			<gs:button name="CORE_PROG003D0002Q_clear" id="CORE_PROG003D0002Q_clear" onClick="CORE_PROG003D0002Q_clear();" 
    				label="${action.getText('CORE_PROG003D0002Q_clear')}" 
    				iconClass="dijitIconClear"
    				cssClass="alt-primary"></gs:button>
    		</td>
    	</tr>     	    	
    </table>	
    
    <gs:grid gridFieldStructure="CORE_PROG003D0002Q_GridFieldStructure()" clearQueryFn="" id="_${programId}_grid" programId="${programId}"></gs:grid>	
	
<script type="text/javascript">${programId}_page_message();</script>	
</body>
</html>
