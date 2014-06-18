<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>


<html>
<script src="http://code.jquery.com/jquery-1.9.0.js"></script>
<link rel="stylesheet" type="text/css" href="../../content/style.css" />
<head>
    <title></title>
</head>
<script type="text/javascript">
    var currentPage = ${page};
    function changePage(increment)
    {
        var tmp = currentPage + increment;
        if(tmp >= 0)
        {
            currentPage += increment;
            document.location ="/secretPages/allTasks?page="+ currentPage;
        }
    }
    function pressButtonEmployer() {
        document.location = "/secretPages/employer";
    }

</script>
<body>
<tr>
    <td>
    <input type="button" value="&lt;--PAGE EMPLOYER" onclick="pressButtonEmployer()"  style="margin-top: 35; margin-left: 50;">
    </td>
</tr>
<div class="table-userdata">
    <table style="border:3px solid black; border-collapse: collapse; margin-left: 50px;">
        <tr>
        <tr class="column-view"><td colspan="9" style="text-align: center; border: 3px solid;"><h3>List all the tasks </h3></td></tr>
        </tr>
        <tr class="column-view" style="background-color: goldenrod">
            <td class="column-view">Creator</td>
            <td class="column-view">Recipient</td>
            <td class="column-view">Date create</td>
            <td class="column-view">Title</td>
            <td class="column-view">Description</td>
            <td class="column-view">Priority</td>
            <td class="column-view">State</td>
            <td class="column-view">Start date</td>
            <td class="column-view">End date</td>
        </tr>
        <c:forEach var="item" items="${allUserTasks}">
            <tr class="column-view">
                <td class="column-view">${item.creator.name}</td>
                <td class="column-view">${item.recipient.name}</td>
                <td class="column-view">
                    <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.currentTask.createDate}"/>
                </td>
                <td class="column-view">${item.task.taskTitle}</td>
                <td class="column-view">${item.task.description}</td>
                <td class="column-view">${item.currentTask.priority}</td>
                <td class="column-view">${item.currentTask.state}</td>
                <td class="column-view">
                    <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.currentTask.startDate}"/>
                </td>
                <td class="column-view">
                    <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.currentTask.endDate}"/>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <p align="center">
                <input type="button" value="&lt;--PREV" onclick="changePage(-1)">
                <input type="button" value="NEXT --&gt;" onclick="changePage(1)">
            </p>
        </tr>
    </table>
</div>
</body>
</html>
