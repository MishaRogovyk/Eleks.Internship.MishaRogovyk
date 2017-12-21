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
        .size{
            width: 25px;
        }
        .color{
            background: #B7EF70;
        }
    </style>
</head>
<body class="color">
<h1 align="center">Edit Tasks</h1><br/>
<table>
    <tr>
        <th>Change</th>
        <th>ID</th>
        <th>Name</th>
        <th>Description</th>
        <th>Priority</th>
        <th>Create</th>
        <th>Back</th>
    </tr>
    <form method="post" action="/addTask">
        <tr>
            <td><button class="glyphicon glyphicon-plus"></button></td>
            <td><input type="text" name="id" class="size"></td>
            <td><input type="text" name="task_name"></td>
            <td><input type="text" name="description" ></td>
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
            <td><a href="/tasks">Back</a></td>
    </form>
</table>
</body>
</html>