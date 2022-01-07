<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>

</head>
<body>

<a href="<%=request.getContextPath() %>/prlist.do">P_REVIEW 보러가는길</a>
<a href="<%=request.getContextPath() %>/arlist.do">A_REVIEW 보러가는길</a>
<a href="<%=request.getContextPath() %>/frlist.do">F_REVIEW 보러가는길</a>
<a href="<%=request.getContextPath() %>/nrlist.do">N_REVIEW 보러가는길</a>

</body>
</html>
