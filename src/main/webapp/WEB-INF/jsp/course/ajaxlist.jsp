<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">

</script>
<style>
.star{
width:80px;
height:16px; 
background:url('/resources/img/star.jpg') no-repeat -80px 0;
}

.star span{
display:block;
height:16px; 
background:url('/resources/img/star.jpg') no-repeat left top;
text-indent:-9999em;
}
</style>
</head>
<body>
<!-- 페이지 이동을 위한 옵션들 -->
<input type="hidden" id=hiddensearchOption value="${searchOption}">
<input type="hidden" id=hiddenkeyword value="${keyword}">

<div>

				<c:choose>
					<c:when test="${searchOption == 'coscategory2'}">
						<h3>카테고리 "${keyword}" 검색 결과</h3>
					</c:when>
					<c:when test="${searchOption == 'coscategory1'}">
						<h3>카테고리 "${keyword}" 검색 결과</h3>
					</c:when>
					<c:when test="${empty keyword}">
						<h3>모든 강좌 검색 결과</h3>
					</c:when>
					<c:otherwise>
						<h3>"${keyword}" 검색 결과</h3>	
					</c:otherwise>
				</c:choose>				

				<div class="row">
					<c:forEach var="coslist" items="${courselist}">
						<div class="col-md-4 col-sm-4 portfolio-item">
				              <div class="card h-100">
				                <a href="/course/intro/${coslist.cosno}"><img class="card-img-top" src="/resources/courseImage/${coslist.cospicture}" alt=""></a>
				                <div class="card-body">
				                  <h4 class="cardZ-title">
				                    <a href="/course/intro/${coslist.cosno}">${coslist.cosname}</a>
				                  </h4>
				                  
				                  <c:choose>
				                  	  <c:when test="${coslist.coseval == 0}">
										  <div class='star'>
						                  	<span style="width:0%"></span>
						                  </div>
									  </c:when>
					                  <c:when test="${coslist.coseval == 1}">
										  <div class='star'>
						                  	<span style="width:20%"></span>
						                  </div>
									  </c:when>
					                  <c:when test="${coslist.coseval == 2}">
										  <div class='star'>
						                  	<span style="width:40%"></span>
						                  </div>
									  </c:when>
					                  <c:when test="${coslist.coseval == 3}">
										  <div class='star'>
						                  	<span style="width:60%"></span>
						                  </div>
									  </c:when>
					                  <c:when test="${coslist.coseval == 4}">
										  <div class='star'>
						                  	<span style="width:80%"></span>
						                  </div>
									  </c:when>
									  <c:when test="${coslist.coseval == 5}">
										  <div class='star'>
						                  	<span style="width:100%"></span>
						                  </div>
									  </c:when>               
				                  </c:choose>
				                  
				                </div>
				              </div>
				        </div>
				        <div class="col-md-8 col-sm-8 portfolio-item" style="border-top: 2px solid gray">
				        	${coslist.cosintro}
				        </div>
					</c:forEach>
				</div>
			</div>
			<br><br><br>

			<ul class="pagination justify-content-center">
		            <li class="page-item">
			            <c:if test="${Page.curPage > 1}">
			              <a class="page-link" href="javascript:pagelist('1')" aria-label="Previous">
			                <span aria-hidden="true">&laquo;</span>
			                <span class="sr-only">처음</span>  		
			              </a>
			            </c:if>
		            </li>
			        <c:if test="${Page.curBlock > 1}">
			        	<li class="page-item">
			              	<a class="page-link" href="javascript:pagelist('${Page.prevPage}')">
			                	<span aria-hidden="true">&hellip;</span>
			                	<span class="sr-only">이전블록</span>
			            	</a>
		            	</li>			        
		            </c:if>

	                <c:forEach var="num" begin="${Page.blockBegin}" end="${Page.blockEnd}">

	                    <c:choose>
	                        <c:when test="${num == Page.curPage}">
								<li class="page-link" style="color: red">${num}
	                            </li>
	                        </c:when>
	                        <c:otherwise>
	                        <li class="page-item">		            
	                            <a class="page-link" href="javascript:pagelist('${num}')">${num}</a>
	                        </li>
	                        </c:otherwise>
	                    </c:choose>
	                </c:forEach>

	                <c:if test="${Page.curBlock < Page.totBlock}">
	                	<li class="page-item">
			              	<a class="page-link" href="javascript:pagelist('${Page.nextPage}')">
			                	<span aria-hidden="true">&hellip;</span>
			                	<span class="sr-only">다음블록</span>
			            	</a>
		            	</li>
		            </c:if>

	                <c:if test="${Page.curPage < Page.totPage}">
	                <li class="page-item">
		              <a class="page-link" href="javascript:pagelist('${Page.totPage}')">
		                <span aria-hidden="true">&raquo;</span>
		                <span class="sr-only">끝</span>
		              </a>
		            </li>
	                </c:if>
		          </ul>
		</body>
		</html>
		