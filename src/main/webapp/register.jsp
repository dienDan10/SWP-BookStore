
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Register</title>
    <link rel="icon" type="image/x-icon" href="image/favicon.png">
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/logins/login-12/assets/css/login-12.css">
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>
<body>
<!-- Login 12 - Bootstrap Brain Component -->
<section class="py-3 py-md-5 py-xl-8">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="mb-5">
                    <h2 class="display-5 fw-bold text-center">Register</h2>

                </div>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-12 col-lg-10 col-xl-8">
                <div class="row gy-5 justify-content-center">
                    <div class="col-12 col-lg-5">
                        <form action="/register" method="POST" class="myform">
                            <div class="row gy-3 overflow-hidden">
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control border-0 border-bottom rounded-0"
                                               name="name" id="name" placeholder="name" value="${param.name}" required>
                                        <label for="name" class="form-label">Name</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="email" class="form-control border-0 border-bottom rounded-0 ${not empty emailExist ? "is-invalid" : ""}"
                                               name="email" id="email" value="${param.email}" placeholder="Email" required>
                                        <label for="email" class="form-label">Email</label>
                                        <c:if test="${not empty emailExist}">
                                            <div class="fst-italic text-danger">${emailExist}</div>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="password" class="form-control border-0 border-bottom rounded-0 password-1"
                                               name="password" id="password" value="" placeholder="Password" required>
                                        <label for="password" class="form-label">Password</label>
                                        <div class="fst-italic text-danger password-constraint"></div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="password" class="form-control border-0 border-bottom rounded-0 password-2"
                                                id="re-password" value="" placeholder="Password" required>
                                        <label for="re-password" class="form-label">Re-enter password</label>
                                        <p class="msg fst-italic text-danger mb-0"></p>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-check mb-3">
                                        <input class="form-check-input" type="checkbox" value="" name="remember_me" id="display-password">
                                        <label class="form-check-label text-secondary" for="display-password">
                                            See password
                                        </label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="g-recaptcha" data-sitekey="6LePUuwpAAAAANteno4UNkHQ-IWcK6KwiGLH3QAD"></div>
                                    <div class="fst-italic text-danger captcha-msg" ></div>
                                </div>
                                <div class="col-12">
                                    <div class="d-grid">
                                        <button class="btn btn-lg btn-dark rounded-0 fs-6"
                                                type="submit" disabled>Register</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="js/re-enter-password.js"></script>
<script>
    const constraint = document.querySelector('.password-constraint');
    p1.onfocus = function() {
        constraint.textContent = 'For your safety, password should contains at least 8 character, text and number included';
    };
    p1.onblur = function() {
        constraint.textContent = '';
    };

    const form = document.querySelector('.myform');
    form.addEventListener('submit', (event) => {
        event.preventDefault();
        const isValid = validateRecaptcha();
        if (isValid) {
            form.submit();
        } else {

        }
    })
    function validateRecaptcha() {
        const response = grecaptcha.getResponse();
        if (response.length === 0) {
            document.querySelector('.captcha-msg').textContent = "Please finish the captcha";
            return false;
        }
        return true;
    }
</script>
</body>
</html>
