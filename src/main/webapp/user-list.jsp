<%@ page import="java.util.List" %>
<%@ page import="net.usermanagement2.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>User List</title>

    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center mb-4">List of Users</h2>

    <!-- ✅ Button -->
    <a href="new" class="btn btn-success mb-3">Add New User</a>

  
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Country</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <%
            List<User> list = (List<User>) request.getAttribute("listUser");
            for(User u : list) {
        %>
        <tr>
            <td><%= u.getId() %></td>
            <td><%= u.getName() %></td>
            <td><%= u.getEmail() %></td>
            <td><%= u.getCountry() %></td>
            <td>
                <a href="edit?id=<%= u.getId() %>" class="btn btn-warning btn-sm">Edit</a>
                <a href="delete?id=<%= u.getId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this user?');">Delete</a>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
