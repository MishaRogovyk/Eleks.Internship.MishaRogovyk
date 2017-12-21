<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
            background-color:#D0FF00;
        }

        td, th {
            border: 1px solid white;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #333;
        }

        li {
            float: left;
        }

        li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        li a:hover:not(.active) {
            background-color: #D0FF00;
        }

        .active {
            background-color: #4CAF50;
        }

        #myInput {
            background-position: 10px 10px;
            background-repeat: no-repeat;
            width: 15%;
        }
        .color{
            background: #B7EF70;
        }
        .size{
            width: 20px;
        }
    </style>
    <script>
        function myFunction() {
            var input, filter, table, tr, td, i;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1];
                if (td) {
                    if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>
</head>
<body class="color">
<ul>
    <li><a class="active">Todoshka</a></li>
    <li><a href="/completed">Complete tasks</a></li>
    <li><a href="/deleted">Deleted tasks</a></li>
</ul>
<h1 align="center">Tasks</h1><br/>
<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for name.." title="Type in a name">
<table id="myTable">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Description</th>
        <th>Priority</th>
        <th>Create</th>
        <th>Done</th>
        <th>Delete</th>
        <th>Edit</th>
    </tr>

    <c:forEach var = "tasks" items = "${task}">
        <tr>
            <td>${tasks.id}</td>
            <td>${tasks.taskName}</td>
            <td>${tasks.description}</td>
            <td>${tasks.priority}</td>
            <td>${tasks.dataCreate}</td>
            <td><a href="/completed/${tasks.id}"><button class="glyphicon glyphicon-ok"></button></a></td>
            <td><a href="/deleted/${tasks.id}"><button class="glyphicon glyphicon-trash"></button></a></td>
            <td><a href="/update/${tasks.id}"><button class="glyphicon glyphicon-erase"></button></a></td>
        </tr>
    </c:forEach>

    <form method="post" action="/addTask">
        <tr>
            <td><button class="glyphicon glyphicon-plus"></button><input type="hidden" name="id" value=""/></td>
            <td> <input type="text" name="task_name"></td>
            <td> <input type="text" name="description" ></td>
            <td><select name="priority">
                <option value="none" selected></option>
                <option value="LOW">LOW</option>
                <option value="MEDIUM">MEDIUM</option>
                <option value="HIGH">HIGH</option>
                <option value="IMPORTANT">IMPORTANT</option>
            </select></td>
            <td><input type="text" name="data_create" placeholder="YYYY-MM-DD" required
                       pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))"
                       title="Enter a date in this format YYYY-MM-DD"/></td>
    </form>
    <td><button class="glyphicon glyphicon-ok"></button></td>
    <td><button class="glyphicon glyphicon-trash"></button></td>
    <td><button class="glyphicon glyphicon-erase"></button></td>
    </tr>
</table>
</body>
</html>