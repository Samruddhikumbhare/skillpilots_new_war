<%
// Check if user attribute is present in session
if(null!=session.getAttribute("user")){
    // If user is present, do nothing
}else{
    // If user is not present, redirect to "/redirect:logout"
    response.sendRedirect("${pageContext.request.contextPath}/skillpilot/logout");
}
%>