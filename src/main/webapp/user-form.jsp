<%@ page import="net.usermanagement2.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Form</title>

    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%
    User user = (User) request.getAttribute("user");
    boolean isEdit = user != null;
%>

<div class="container mt-5">
    <h2 class="mb-4 text-center"><%= isEdit ? "Edit User" : "Add User" %></h2>

    <form action="<%= isEdit ? "update" : "insert" %>" method="post" class="card p-4 shadow-sm">
        <% if (isEdit) { %>
            <input type="hidden" name="id" value="<%= user.getId() %>"/>
        <% } %>

        <div class="mb-3">
            <label for="name" class="form-label">Name:</label>
            <input type="text" name="name" class="form-control" id="name" value="<%= isEdit ? user.getName() : "" %>" required>
        </div>

        <div class="mb-3">
            <label for="email" class="form-label">Email:</label>
            <input type="email" name="email" class="form-control" id="email" value="<%= isEdit ? user.getEmail() : "" %>" required>
        </div>

        <div class="mb-3">
            <label for="country" class="form-label">Country:</label>
            <input type="text" name="country" class="form-control" id="country" value="<%= isEdit ? user.getCountry() : "" %>" required>
        </div>

        <button type="submit" class="btn btn-primary w-100">
            <%= isEdit ? "Update" : "Save" %>
        </button>
    </form>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
