<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		button > a {
			text-decoration:none;
		}
</style>
</head>
<body>
<div>
	<div><c:import url="/view/include/topMenu.jsp"></c:import> </div>

	<div>
	
		<form name="rankchange" action="rankChange" method="post" >
			
			
			<table>
				<thead>
					<tr>
						<th>회원ID</th>
						<th>닉네임</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>가입일</th>
						<th>등급</th>
					</tr>
				</thead>
					
				
				<c:forEach var="memberList" items="${memberList}">
					member:	${memSelId}
					list: ${memberList.memberId}
					<c:choose>
						<c:when test="${memberSelId.memberId eq memberList.memberId}">
						member:	${memSelId}
						list: ${memberList.memberId}
						<tr>
							<td><c:out value='${memberList.memberId}'/>
								<input type="hidden" name="memId" value="${memberList.memberId}" />
								</td>
							<td><c:out value='${memberList.nickName}'/></td>
							<td><c:out value='${memberList.email}'/></td>
							<td><c:out value='${memberList.phoneNum}'/></td>
							<td><fmt:formatDate value='${memberList.regDate}' pattern="yyyy-MM-dd"/></td>
							<td colspan="4">
										<c:if test="${memberList.rank == '운영자'}">
											<select name="rank" >
												<option value='운영자' selected="selected">-- 운영자 --</option>
												<option value='일반회원'>일반회원</option>
												<option value='병원장'>병원장</option>
											</select>
										</c:if>
										<c:if test="${memberList.rank == '일반회원'}">
											<select name="rank" >
												<option value='운영자'>운영자</option>
												<option value='일반회원' selected="selected">-- 일반회원 --</option>
												<option value='병원장'>병원장</option>
											</select>
										</c:if>
										<c:if test="${memberList.rank == '병원장'}">
											<select name="rank" >
												<option value='운영자'>운영자</option>
												<option value='일반회원'>일반회원</option>
												<option value='병원장' selected="selected">-- 병원장 --</option>
											</select>
										</c:if>
								
							</td>
							<td><button type="submit">수정</button><td>
						</tr>
						</c:when>
						<c:otherwise>
						member:	${memberId}
						list: ${memberList.memberId}
							<tr>
							<td><c:out value='${memberList.memberId}'/></td>
							<td><c:out value='${memberList.nickName}'/></td>
							<td><c:out value='${memberList.email}'/></td>
							<td><c:out value='${memberList.phoneNum}'/></td>
							<td><fmt:formatDate value='${memberList.regDate}' pattern="yyyy-MM-dd"/></td>
							<td colspan="4">
										<c:if test="${memberList.rank == '운영자'}">
											<select name="rank" >
												<option value='운영자' selected="selected">-- 운영자 --</option>
												<option value='일반회원'>일반회원</option>
												<option value='병원장'>병원장</option>
											</select>
										</c:if>
										<c:if test="${memberList.rank == '일반회원'}">
											<select name="rank" >
												<option value='운영자'>운영자</option>
												<option value='일반회원' selected="selected">-- 일반회원 --</option>
												<option value='병원장'>병원장</option>
											</select>
										</c:if>
										<c:if test="${memberList.rank == '병원장'}">
											<select name="rank" >
												<option value='운영자'>운영자</option>
												<option value='일반회원'>일반회원</option>
												<option value='병원장' selected="selected">-- 병원장 --</option>
											</select>
										</c:if>
								
							</td>
							<td><a href="memberControl?memberId=${memberId}memId=${memberList.memberId}&rank=${memberList.rank}">등급 수정</a><td>
						</tr>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</table>
		</form>
		
		
		
	</div>	
	
	<div><c:import url="/view/include/footer.jsp"/> </div>
	
</div>

<script>

</script>

</body>
</html>