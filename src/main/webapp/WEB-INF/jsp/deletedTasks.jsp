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
    </style>
    <style>
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

        .color{
            background: #B7EF70;
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
    <li><a href="/tasks">Tasks</a></li>
    <li><a href="/completed">Completed tasks</a></li>
</ul>
<h1 align="center">Deleted tasks</h1><br/>
<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for name.." title="Type in a name">
<table id="myTable">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Description</th>
        <th>Priority</th>
        <th>Create</th>
        <th>Delete</th>
    </tr>

    <c:forEach var = "tasks" items = "${taskDeleted}">
    <tr>
        <td>${tasks.id}</td>
        <td>${tasks.taskName}</td>
        <td>${tasks.description}</td>
        <td>${tasks.priority}</td>
        <td>${tasks.dataCreate}</td>
        <td><a href="/deleteDeleted/${tasks.id}"><button class="glyphicon glyphicon-trash"></button></a></td>
        </c:forEach>
</table>
</body>
</html>