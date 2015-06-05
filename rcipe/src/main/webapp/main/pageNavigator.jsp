<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
			�� ����
	</c:if>
	<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
			<a href="javascript:fncGetList('currentPage=${resultPage.currentPage - 1}&searchCondition=${search.searchCondition}&searchKeyword=${search.searchKeyword}')">�� ����</a>
	</c:if>
	
	<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
		<a href="javascript:fncGetList('currentPage=${i}&searchCondition=${search.searchCondition}&searchKeyword=${search.searchKeyword}');">${ i+1 }</a>
	</c:forEach>
	
	<c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
			���� ��
	</c:if>
	<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
			<a href="javascript:fncGetList('currentPage=${resultPage.currentPage + 1}&searchCondition=${search.searchCondition}&searchKeyword=${search.searchKeyword}')">���� ��</a>
	</c:if>