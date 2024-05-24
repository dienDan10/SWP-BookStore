
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>OTP Verification</title>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" >
</head>
<body>

<div class="container mt-md-5 mt-sm-3">
    <div class="row">
        <div class="col-12 col-md-8 col-lg-6 col-xl-4 mx-auto">
            <div class="card shadow bordered rounded-0">
                <div class="card-body">
                    <c:if test="${not empty sendMailErr}">
                        <div class="alert alert-danger" role="alert">
                            ${sendMailErr}
                        </div>
                    </c:if>
                    <div class="my-3">
                        An authentication code had been sent to your email (${userdto.email}).
                        <br />
                        This code will expired soon.
                        <br />
                        Please enter the code in the form below to complete your registration.
                    </div>

                    <form action="/otp-verification" class="form" method="POST">
                        <div class="form-group mt-3 mb-3">
                            <input type="text" class="form-control ${not empty otpErr ? "is-invalid" : ""}" name="otp" />
                            <c:if test="${not empty otpErr}">
                                <div class="fst-italic text-danger">${otpErr}</div>
                            </c:if>
                            <button class="btn btn-dark rounded-0 mt-3">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
