<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<header class="main_menu home_menu">
    <div class="container">
        <div class="row align-items-center justify-content-center">
            <div class="col-lg-12">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="navbar-brand" href="${context}/home-page"> <img src="img/bb.jpg" alt="logo"> </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="menu_icon"><i class="fas fa-bars"></i></span>
                    </button>

                    <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="${context}/home-page">Trang chủ</a>
                            </li>
                            <c:if test="${not empty user}">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown_2"
                                       role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Điều hướng
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
                                        <a class="dropdown-item" href="${context}/view-cart">Giỏ hàng</a>
                                        <a class="dropdown-item" href="${context}/view-address">Sổ địa chỉ</a>
                                        <a class="dropdown-item" href="${context}/view-profile">Tài khoản</a>
                                        <a class="dropdown-item" href="${context}/view-order">Đơn hàng</a>
                                    </div>
                                </li>
                            </c:if>
                            <li class="nav-item">
                                <a class="nav-link" href="${context}/product-list">Sản phẩm</a>
                            </li>
                            <c:choose>
                                <c:when test="${not empty user}">
                                    <li class="nav-item">
                                        <a class="nav-link" href="${context}/logout">Đăng xuất</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="nav-item">
                                        <a class="nav-link" href="${context}/login">Đăng nhập</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>



                            <!--                            <li class="nav-item dropdown">-->
                            <!--                                <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown_2"-->
                            <!--                                   role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">-->
                            <!--                                    blog-->
                            <!--                                </a>-->
                            <!--                                <div class="dropdown-menu" aria-labelledby="navbarDropdown_2">-->
                            <!--                                    <a class="dropdown-item" href="blog.html"> blog</a>-->
                            <!--                                    <a class="dropdown-item" href="single-blog.html">Single blog</a>-->
                            <!--                                </div>-->
                            <!--                            </li>-->

                            <c:if test="${user.hasRole('SELLER')}">
                                <li class="nav-item">
                                    <a class="nav-link" href="${context}/view-dashboard">Dashboard</a>
                                </li>
                            </c:if>
<%--                            <li class="nav-item">--%>
<%--                                <a class="nav-link" href="/view-dashboard">Dashboard</a>--%>
<%--                            </li>--%>
                        </ul>
                    </div>
                    <div class="hearer_icon d-flex align-items-center">
                        <a href="${context}/view-cart">
                            <i class="flaticon-shopping-cart-black-shape"></i>
                        </a>
                        <div class="d-flex align-items-center" >
                                <!--  USER IMAGE   -->
                                <c:if test="${not empty user}">
                                    <div class="rounded-circle overflow-hidden ml-2 ml-md-4"
                                         style="width: 35px; height: 35px">
                                        <img src="${context}/img/user-image/${user.imageURL}"
                                             class="w-100 h-100" style="object-position: center; object-fit: cover"
                                             alt="">
                                    </div>
                                    <h5 style="margin-bottom: 0" class="ml-2 d-none d-md-block">${user.name}</h5>
                                </c:if>
                            </div>

                </nav>
            </div>
        </div>
    </div>

</header>
