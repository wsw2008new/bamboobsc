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
	
	<script src="<%=basePath%>/codemirror-5.0/lib/codemirror.js" type="text/javascript"></script>
	<script src="<%=basePath%>/codemirror-5.0/addon/edit/matchbrackets.js"></script>
	<script src="<%=basePath%>/codemirror-5.0/addon/hint/show-hint.js"></script>	
	<script src="<%=basePath%>/codemirror-5.0/clike.js"></script>	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/codemirror-5.0/doc/docs.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/codemirror-5.0/lib/codemirror.css" />		
	<link rel="stylesheet" href="<%=basePath%>/codemirror-5.0/addon/hint/show-hint.css">	
	
	
<style type="text/css">

.flat {
    border: 1px;
    background: #222;
    color: #FFF;
    padding: 2px 20px;
    font-size: 12px;
    font-family: Palatino;    
}

.lighter {
    background: #666;
}
</style>


</head>
<body bgcolor="#ffffff">

<!-- CORE_PROGCOMM0004Q -->

<div style="border-top: 1px solid black; border-bottom: 1px solid black;">
	<textarea id="code">${codeContent}</textarea>
</div>	

<script type="text/javascript">
var javaEditor = CodeMirror.fromTextArea(document.getElementById("code"), {
	lineNumbers: true,
	matchBrackets: true,
	mode: "text/x-java"
});

function getValue() {
	return javaEditor.getValue();
}

function clear() {
	return javaEditor.setValue("");
}

function setCbFieldValue() {
	window.opener.document.getElementById("${valueFieldId}").value = getValue();
	window.close();
	<s:if test=" null != okFn && \"\" != okFn && \" \" != okFn ">
	window.opener.${okFn}
	</s:if>	
}

</script>
<s:if test=" \"Y\" == cbMode ">
<hr color="#585858" size="1">
<input type="button" name="okBtn" id="okBtn" value="OK" class="flat lighter" onClick="setCbFieldValue();">
<input type="button" name="clBtn" id="clBtn" value="Close" class="flat lighter" onClick="window.close();">
</s:if>

</body>
</html>
