<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl " id="navbarBlur"
     data-scroll="false">
    <div class="container-fluid py-1 px-3">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
                <li class="breadcrumb-item text-sm"><a class="opacity-5 text-white" href="#">Pages</a></li>
                <li class="breadcrumb-item text-sm text-white active" aria-current="page">Dashboard</li>
            </ol>
            <h6 class="font-weight-bolder text-white mb-0">Dashboard</h6>
        </nav>
        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
            <ul class="navbar-nav  justify-content-end ms-md-auto">
                <li class="nav-item d-flex align-items-center">
                    <c:choose>
                        <c:when test="${not empty user}">
                            <div class="rounded-circle overflow-hidden ml-2 ml-md-4"
                                 style="width: 35px; height: 35px">
                                <img src="${context}/img/user-image/${user.imageURL}"
                                     class="w-100 h-100" style="object-position: center; object-fit: cover"
                                     alt="">
                            </div>
                            <span class="text-white ms-2 d-inline-block">${user.name}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="${context}/login" class="nav-link text-white font-weight-bold px-0">
                                <i class="fa fa-user me-sm-1"></i>
                                <span class="d-sm-inline d-none">Đăng nhập</span>
                            </a>
                        </c:otherwise>
                    </c:choose>
                </li>
                <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
                    <a href="javascript:;" class="nav-link text-white p-0" id="iconNavbarSidenav">
                        <div class="sidenav-toggler-inner">
                            <i class="sidenav-toggler-line bg-white"></i>
                            <i class="sidenav-toggler-line bg-white"></i>
                            <i class="sidenav-toggler-line bg-white"></i>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
