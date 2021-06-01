<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- Импортировать JSTL-библиотеки --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- Импортировать собственную библиотеку тегов --%>
<%@taglib prefix="ad" uri="http://lab9.by/tags"%>
<%@taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%-- Получить bean требуемого объявления по переданному параметру id --%>
<ad:getAds id="${param.id}" var="ad" />
<html>
<head>
<%-- Вывести тему объявления как заголовок страницы --%>
<title><c:out value="${ad.subject}" /></title>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
</head>
<body>
	<%-- Подключить заголовок страницы --%>
	<jsp:include page="/static/header.jsp"></jsp:include>
	<%-- Вставить разметку 1-колоночной страницы --%>
	<my:layout1Column>
		<%-- Вывести тему объявления крупными буквами как заголовок --%>
		<h1>
			<c:out value="${ad.subject}" />
		</h1>
		<%-- Вывести служебную информацию об объявлении - кто автор? когда изменено? --%>
		<div style="text-decoration: underline ; font-size: 10px">
			Автор:
			<c:out value="${ad.author.name}" />
			, последняя дата редактирования:
			<fmt:formatDate pattern="hh:mm:ss dd-MM-yyyy"
				value="${ad.lastModifiedDate}" />
			
		</div>
		<%-- Отобразить текст объявления в отдельной рамке --%>
		<div style="border: 1px solid black; padding: 20px;">
			<c:out value="${ad.body}" />
		</div>
	</my:layout1Column>
	<%-- Вставить нижний заголовок страницы --%>
	<%@ include file="/static/footer.jsp"%>
</body>
</html>