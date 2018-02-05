    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#"><img src="<c:url value='/static/images/diulogo.png' />" style="margin-top: -4px;"  height="33" width="120"></a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav navbar-right">
          	<sec:authorize access="isAuthenticated()">
            	<li class="active"><a href="${pageContext.request.contextPath}">Home</a></li>
            
            	<li><a href="#contact">Contact</a></li>
            
	            <li class="dropdown">
	              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true">Configuration <span class="caret"></span></a>
	              <ul class="dropdown-menu">
	              	<li class="dropdown-header">Entry Forms</li>
	                <li><a href="${pageContext.request.contextPath}/welcome">Show welcome page</a></li>
	                <li><a href="${pageContext.request.contextPath}/employee/show">Employee Info</a></li>
	                <li><a href="${pageContext.request.contextPath}/student">Student Info</a></li>
	                <li><a href="${pageContext.request.contextPath}/chartofacc">Chart of Accounts</a></li>
	                <li><a href="${pageContext.request.contextPath}/accountinggroup">Accounts Group</a></li>
	                <li><a href="${pageContext.request.contextPath}/journal">Journal</a></li>
	                <li><a href="${pageContext.request.contextPath}/fixedasset">Fixed Asset</a></li>
	                <li role="separator" class="divider"></li>
	                <li class="dropdown-header">Reports</li>
	                
	              </ul>
	            </li>
            </sec:authorize>
            <sec:authorize access="!isAuthenticated()">
					<li>
						<a href="<c:url value='/login' />">Log in</a>
					</li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li>
						<a href="<c:url value='/logout' />">Log out</a>
					</li>
				</sec:authorize>
          </ul>
          
          	<ul class="nav navbar-nav navbar-right">
				
				
			</ul>
			
        </div><!--/.nav-collapse -->
      </div>
    </nav>
