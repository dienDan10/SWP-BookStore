
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home Page</title>
    <link rel="icon" type="image/x-icon" href="image/favicon.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    <style>
        @media (min-width: 992px) {
            .search-form {
                margin-left: -200px !important;
            }
        }

        .book-link {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 999;
        }

        .books>.book-card:hover {
            transform: translate(0, -5px);
            box-shadow: 0 1rem 3rem rgba(0, 0, 0, 0.175) !important;
            transition: 0.3s ease;
        }
    </style>
    <link rel="stylesheet" href="css/toast.css"/>
</head>
<body>
<!-- Nav bar -->
<nav class="navbar navbar-expand-lg bg-body-tertiary shadow">
    <div class="container">
        <div class="row w-100">
            <div class="col col-12">
                <div class="w-100 d-flex justify-content-between align-items-center flex-wrap">
                    <!-- Banner -->
                    <a class="navbar-brand order-0 fs-3 text-success" href="#"><i
                            class="fa-solid fa-book-open me-2 text-success"></i>BookStore</a>
                    <!-- Search box -->
                    <form class="d-flex order-last order-lg-1 mx-auto" style="flex-basis: 400px;" role="search">
                        <select class="form-select" style="width: 150px;" aria-label="Default select example">
                            <option selected>Select</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                    <!-- Navigation -->
                    <ul class="navbar-nav mb-2 mb-lg-0 flex-row gap-3 order-3 align-items-center">
                        <li class="nav-item">
                            <a class="nav-link active text-success fs-4" aria-current="page" href="#"><i
                                    class="fa-solid fa-cart-shopping"></i></a>
                        </li>
                        <li class="nav-item">
                            <c:choose>
                                <c:when test="${not empty user}">
                                    <div class="dropdown">
                                        <button
                                                class="btn btn-secondary dropdown-toggle d-flex align-items-center bg-transparent border-0"
                                                type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            <div class="me-2 rounded-circle overflow-hidden"
                                                 style="width: 35px; height: 35px">
                                                <img src="${user.imageURL}"
                                                     class="w-100 h-100 object-fit-cover" style="object-position: center;"
                                                     alt="">
                                            </div>
                                            <div class="text-body-secondary">
                                                ${user.name}
                                            </div>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#">Thông tin tài khoản</a></li>
                                            <li><a class="dropdown-item" href="#">Thông tin đơn hàng</a></li>
                                            <li><a class="dropdown-item" href="/logout">Logout</a></li>
                                        </ul>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <a class="nav-link active text-success fs-5" aria-current="page" href="/login">
                                        Login
                                    </a>
                                </c:otherwise>
                            </c:choose>

                        </li>
                    </ul>


                </div>
            </div>
        </div>

    </div>
</nav>




<!-- Main Page -->

<div class="container-fluid mt-5 mb-5">
    <div class="row">
        <div class="col col-12 col-xxl-10 mx-auto">
            <div class="d-flex flex-row gap-4 align-items-start">
                <!-- Filter section -->
                <div class="filter shadow" style="width: 250px">
                    <div class="accordion accordion-flush" id="accordionFlushExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#flush-collapseOne" aria-expanded="false"
                                        aria-controls="flush-collapseOne">
                                    Category
                                </button>
                            </h2>
                            <div id="flush-collapseOne" class="accordion-collapse collapse">
                                <div class="accordion-body">
                                    <div class="form-check mb-2">
                                        <input class="form-check-input" type="checkbox" value=""
                                               name="category">
                                        <label class="form-check-label">
                                            Sách văn học
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value=""
                                                name="category">
                                        <label class="form-check-label">
                                            Tiểu Thuyết
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#flush-collapseTwo" aria-expanded="false"
                                        aria-controls="flush-collapseTwo">
                                    Author
                                </button>
                            </h2>
                            <div id="flush-collapseTwo" class="accordion-collapse collapse">
                                <div class="accordion-body">
                                    <div class="form-check mb-2">
                                        <input class="form-check-input" type="checkbox" value=""
                                                name="author">
                                        <label class="form-check-label">
                                            Trần Đình Tú
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value=""
                                                name="author">
                                        <label class="form-check-label">
                                            Lí Bạch
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#flush-collapseThree" aria-expanded="false"
                                        aria-controls="flush-collapseThree">
                                    Publisher
                                </button>
                            </h2>
                            <div id="flush-collapseThree" class="accordion-collapse collapse">
                                <div class="accordion-body">
                                    <div class="form-check mb-2">
                                        <input class="form-check-input" type="checkbox" value=""
                                                name="publisher">
                                        <label class="form-check-label" >
                                            Nhã Nam
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value=""
                                               id="" name="publisher">
                                        <label class="form-check-label">
                                            Thái Hà
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- Book section -->
                <div class="books d-flex gap-2 flex-wrap">

                    <div class="book-card position-relative shadow border-1" style="width: 250px;">
                        <a href="#" class="book-link"></a>
                        <div class="image-box w-100 h-auto">
                            <img src="image/book-image/namiya.jpeg" class="w-100 object-fit-cover" style="object-position: center;"
                                 alt="">
                        </div>
                        <div class="book-card-content mt-3 p-3">
                            <p class="price position-relative" style="font-size: 18px; font-weight: 600;">99.350
                                <span class="position-absolute" style="font-size: 14px;">đ</span>
                            </p>
                            <p class="text-uppercase text-body-secondary mb-0" style="font-size: 14px;">higashino
                                keigo
                            </p>
                            <p style="font-size: 17px;" class="mb-1">Điều kỳ diệu của tiệm tạp hóa NAMIYA</p>
                            <div class="d-inline-block" style="font-size: 10px;">
                                <i class="fa-solid fa-star text-warning"></i>
                                <i class="fa-solid fa-star text-warning"></i>
                                <i class="fa-solid fa-star text-warning"></i>
                                <i class="fa-solid fa-star text-warning"></i>
                                <i class="fa-solid fa-star text-warning"></i>
                            </div>
                            <span class="text-body-secondary">|</span>
                            <div class="d-inline-block text-body-secondary"
                                 style="font-size: 14px; font-weight: 400;">Đã bán <span>115</span></div>
                        </div>
                    </div>

                    <div class="book-card shadow position-relative border-1" style="width: 250px;">
                        <a href="#" class="book-link"></a>
                        <div class="image-box w-100 h-auto">
                            <img src="image/book-image/namiya.jpeg" class="w-100 object-fit-cover" style="object-position: center;"
                                 alt="">
                        </div>
                        <div class="book-card-content mt-3 p-3">
                            <p class="price position-relative" style="font-size: 18px; font-weight: 600;">99.350
                                <span class="position-absolute" style="font-size: 14px;">đ</span>
                            </p>
                            <p class="text-uppercase text-body-secondary mb-0" style="font-size: 14px;">higashino
                                keigo
                            </p>
                            <p style="font-size: 17px;" class="mb-1">Điều kỳ diệu của tiệm tạp hóa NAMIYA</p>
                            <div class="d-inline-block" style="font-size: 10px;">
                                <i class="fa-solid fa-star text-warning"></i>
                                <i class="fa-solid fa-star text-warning"></i>
                                <i class="fa-solid fa-star text-warning"></i>
                                <i class="fa-solid fa-star text-warning"></i>
                                <i class="fa-solid fa-star text-warning"></i>
                            </div>
                            <span class="text-body-secondary">|</span>
                            <div class="d-inline-block text-body-secondary"
                                 style="font-size: 14px; font-weight: 400;">Đã bán <span>115</span></div>
                        </div>
                    </div>

                    <div class="book-card shadow position-relative border-1" style="width: 250px;">
                        <a href="#" class="book-link"></a>
                        <div class="image-box w-100 h-auto">
                            <img src="image/book-image/namiya.jpeg" class="w-100 object-fit-cover" style="object-position: center;"
                                 alt="">
                        </div>
                        <div class="book-card-content mt-3 p-3">
                            <p class="price position-relative" style="font-size: 18px; font-weight: 600;">99.350
                                <span class="position-absolute" style="font-size: 14px;">đ</span>
                            </p>
                            <p class="text-uppercase text-body-secondary mb-0" style="font-size: 14px;">higashino
                                keigo
                            </p>
                            <p style="font-size: 17px;" class="mb-1">Điều kỳ diệu của tiệm tạp hóa NAMIYA</p>
                            <div class="d-inline-block" style="font-size: 10px;">
                                <i class="fa-solid fa-star text-warning"></i>
                                <i class="fa-solid fa-star text-warning"></i>
                                <i class="fa-solid fa-star text-warning"></i>
                                <i class="fa-solid fa-star text-warning"></i>
                                <i class="fa-solid fa-star text-warning"></i>
                            </div>
                            <span class="text-body-secondary">|</span>
                            <div class="d-inline-block text-body-secondary"
                                 style="font-size: 14px; font-weight: 400;">Đã bán <span>115</span></div>
                        </div>
                    </div>

                    <div class="book-card shadow position-relative border-1" style="width: 250px;">
                        <a href="#" class="book-link"></a>
                        <div class="image-box w-100 h-auto">
                            <img src="image/book-image/namiya.jpeg" class="w-100 object-fit-cover" style="object-position: center;"
                                 alt="">
                        </div>
                        <div class="book-card-content mt-3 p-3">
                            <p class="price position-relative" style="font-size: 18px; font-weight: 600;">99.350
                                <span class="position-absolute" style="font-size: 14px;">đ</span>
                            </p>
                            <p class="text-uppercase text-body-secondary mb-0" style="font-size: 14px;">higashino
                                keigo
                            </p>
                            <p style="font-size: 17px;" class="mb-1">Điều kỳ diệu của tiệm tạp hóa NAMIYA</p>
                            <div class="d-inline-block" style="font-size: 10px;">
                                <i class="fa-solid fa-star text-warning"></i>
                                <i class="fa-solid fa-star text-warning"></i>
                                <i class="fa-solid fa-star text-warning"></i>
                                <i class="fa-solid fa-star text-warning"></i>
                                <i class="fa-solid fa-star text-warning"></i>
                            </div>
                            <span class="text-body-secondary">|</span>
                            <div class="d-inline-block text-body-secondary"
                                 style="font-size: 14px; font-weight: 400;">Đã bán <span>115</span></div>
                        </div>
                    </div>

                    <div class="book-card shadow position-relative border-1" style="width: 250px;">
                        <a href="#" class="book-link"></a>
                        <div class="image-box w-100 h-auto">
                            <img src="image/book-image/namiya.jpeg" class="w-100 object-fit-cover" style="object-position: center;"
                                 alt="">
                        </div>
                        <div class="book-card-content mt-3 p-3">
                            <p class="price position-relative" style="font-size: 18px; font-weight: 600;">99.350
                                <span class="position-absolute" style="font-size: 14px;">đ</span>
                            </p>
                            <p class="text-uppercase text-body-secondary mb-0" style="font-size: 14px;">higashino
                                keigo
                            </p>
                            <p style="font-size: 17px;" class="mb-1">Điều kỳ diệu của tiệm tạp hóa NAMIYA</p>
                            <div class="d-inline-block" style="font-size: 10px;">
                                <i class="fa-solid fa-star text-warning"></i>
                                <i class="fa-solid fa-star text-warning"></i>
                                <i class="fa-solid fa-star text-warning"></i>
                                <i class="fa-solid fa-star text-warning"></i>
                                <i class="fa-solid fa-star text-warning"></i>
                            </div>
                            <span class="text-body-secondary">|</span>
                            <div class="d-inline-block text-body-secondary"
                                 style="font-size: 14px; font-weight: 400;">Đã bán <span>115</span></div>
                        </div>
                    </div>

                    <div class="book-card shadow position-relative border-1" style="width: 250px;">
                        <a href="#" class="book-link"></a>
                        <div class="image-box w-100 h-auto">
                            <img src="image/book-image/namiya.jpeg" class="w-100 object-fit-cover" style="object-position: center;"
                                 alt="">
                        </div>
                        <div class="book-card-content mt-3 p-3">
                            <p class="price position-relative" style="font-size: 18px; font-weight: 600;">99.350
                                <span class="position-absolute" style="font-size: 14px;">đ</span>
                            </p>
                            <p class="text-uppercase text-body-secondary mb-0" style="font-size: 14px;">higashino
                                keigo
                            </p>
                            <p style="font-size: 17px;" class="mb-1">Điều kỳ diệu của tiệm tạp hóa NAMIYA</p>
                            <div class="d-inline-block" style="font-size: 10px;">
                                <i class="fa-solid fa-star text-warning"></i>
                                <i class="fa-solid fa-star text-warning"></i>
                                <i class="fa-solid fa-star text-warning"></i>
                                <i class="fa-solid fa-star text-warning"></i>
                                <i class="fa-solid fa-star text-warning"></i>
                            </div>
                            <span class="text-body-secondary">|</span>
                            <div class="d-inline-block text-body-secondary"
                                 style="font-size: 14px; font-weight: 400;">Đã bán <span>115</span></div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->





<c:if test="${not empty successMsg}">
    <div class="hidden" id="msg" type="success">${successMsg}</div>
    <c:remove var="successMsg" scope="session"></c:remove>
</c:if>
<c:if test="${not empty errMsg}">
    <div class="hidden" id="msg" type="error">${errMsg}</div>
    <c:remove var="errMsg" scope="session"></c:remove>
</c:if>
<c:if test="${not empty invalidMsg}">
    <div class="hidden" id="msg" type="invalid">${invalidMsg}</div>
    <c:remove var="invalidMsg" scope="session"></c:remove>
</c:if>
<div id="toastBox"></div>

<script src="js/toast.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
