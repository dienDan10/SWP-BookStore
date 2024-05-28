
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Reset Password</title>
    <link rel="icon" type="image/x-icon" href="image/favicon.png">
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <div class="row">
        <div class="col col-12 col-sm-10 col-md-8 col-lg-6 col-xl-4 mx-auto">
            <div class="card shadow rounded-0">
                <div class="card-body">
                    <form action="/reset-password" class="form" method="POST">
                        <div class="form-group mb-3">
                            <label>Enter your password:</label>
                            <input type="password" class="form-control password-1" name="password" required>
                        </div>
                        <div class="form-group mb-3">
                            <label>Re-enter your password:</label>
                            <input type="password" class="form-control password-2" required>
                            <p class="mb-0 fst-italic text-danger msg"></p>
                        </div>
                        <button class="btn btn-dark rounded-0" disabled>Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="js/re-enter-password.js"></script>
</body>
</html>
