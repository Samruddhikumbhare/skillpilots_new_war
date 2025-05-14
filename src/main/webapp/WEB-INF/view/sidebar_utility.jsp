<aside class="main-sidebar">
	<!--logo-->
	<a href="#" class="logo">
		<span class="logo-lg"><img id="po_logo" src="${pageContext.request.contextPath}/style/dist/img/finallogo.png"/></span>
	</a>
	<div class="slimScrollDiv">
		<section class="sidebar">
			<!--start main menu left side-->
			<ul class="sidebar-menu">
				<c:forEach items="${sidebar}" var="nbar">
					<li class="${nbar.value.cssClass}">
						<a href="<c:url value="${nbar.value.link}"/>">
							<i class="${nbar.value.navigationIcon}"></i>
							<span>${nbar.value.title}</span>
						</a>
					</li>
				</c:forEach>
			</ul>
			<!--End main menu left side-->
		</section>
	</div>
</aside>