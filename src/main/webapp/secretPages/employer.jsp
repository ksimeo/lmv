<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ page isELIgnored="false" %>

<html>

<script type="text/javascript" src="jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="taskDescription.js"></script>
<link rel="stylesheet" type="text/css" href="../../content/style.css"/>

<head>
    <title></title>

    <script>
        $(document).ready(
                function(){
                    $("#tasktitle").click(clickAction())
                });
    </script>


</head>

<body>
Employer: <%= request.getAttribute("username")%>


<form action="/logout" method="post">
    <input type="submit" value="LogOut"/>
</form>

<script type="text/javascript">
    function pressButtonAllTasks()
    {
        document.location ="/secretPages/allTasks?page=1";
    }

</script>

 <hr/>
<div style="background-color: #ededed; border: 1px solid #aaacb2; border-radius: 10px">
    <form name=creatTask method="post" action="/creattask">


        </select>


        <table border="0" style="font-family: sans-serif">
            <tr align="center">
                <td><b>Workers</b></td>
                <td><b>Tasks titles</b></td>
                <td><b>Priority</b></td>
                <td><b>Tasks description</b></td>
            </tr>
            <tr>
                <td>
                    <select size="10" name="username">

                            <%
            Iterator iter;
            List users;
            users = (List)request.getAttribute("users");
            iter = users.iterator();

            while (iter.hasNext())
            {
                String tmp = (String)iter.next();
        %>
                        <option value="<%= tmp%>"><%= tmp%>
                        </option>

                            <%

            }
        %>
                </td>
                <td>
                    <select size="10" id="tasktitle" name="tasktitle">


                            <%
            List tasks;
            tasks = (List)request.getAttribute("tasks");
            iter = tasks.iterator();

            while (iter.hasNext())
            {
                String tmp = (String)iter.next();
        %>
                        <option value="<%= tmp%>"><%= tmp%>
                        </option>

                            <%
            }
        %>
                </td>
                <td>
                    <select size="10" name="priority">
                        <option value="LOW">LOW</option>
                        <option value="MIDDLE">MIDDLE</option>
                        <option value="HEIGHT">HEIGHT</option>
                    </select>
                </td>
                <td>
                    <form name="description">
                        <textarea id="ansver" rows="10" cols="60" style="font-family: sans-serif"></textarea>
                    </form>
                </td>

            </tr>

            <tr>
                <td colspan="3" align="right"><input type="submit" value="Create"></td>
                <td>
            </tr>
            <tr>
                <td>
                    <input type="button" value="All tasks" onclick="pressButtonAllTasks()">
                </td>
            </tr>
        </table>
    </form>
</div>

<div style="background-color: #ededed; border: 1px solid #aaacb2; border-radius: 10px; padding: 5px; margin-top: 5px; font-family: sans-serif">
<center><b>New current tasks</b></center>
    <%
    List newCurTasks = (List) request.getAttribute("ctasks");
    iter = newCurTasks.iterator();
    while (iter.hasNext()) {
%>
<%= iter.next()%>
<br/>
<%
    }
%>
</div>
</body>
</html>
