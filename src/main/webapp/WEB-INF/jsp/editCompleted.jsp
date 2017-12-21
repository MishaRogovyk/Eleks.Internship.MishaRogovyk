<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 40%;
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
<h1 align="center">Done Tasks</h1><br/>
<table align="center">
    <tr>
        <th>Change</th>
        <th>ID</th>
        <th>Done</th>
        <th>Back</th>
    </tr>


    <form method="post" action="/editCompleted">
        <tr>
            <td><button class="glyphicon glyphicon-plus"></button></td>
            <td><input type="text" name="id" class="size"></td>
            <td><select name="done">
                <option value="false" selected>false</option>
                <option value="true">true</option>
            </select></td>
            <td><a href="/tasks">Back</a></td>
    </form>
</table>

</body>
</html>