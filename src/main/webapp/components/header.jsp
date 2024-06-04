<header class="main_menu home_menu">
    <div class="container">
        <div class="row align-items-center justify-content-center">
            <div class="col-lg-12">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="navbar-brand" href="/home-page"> <img src="img/bb.jpg" alt="logo"> </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="menu_icon"><i class="fas fa-bars"></i></span>
                    </button>

                    <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="/home-page">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/home-page">about</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/product-list">Product</a>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown_3"
                                   role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    pages
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
                                    <c:choose>
                                        <c:when test="${not empty user}">
                                            <a class="dropdown-item" href="/logout">
                                                logout
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="dropdown-item" href="/login">
                                                login
                                            </a>
                                        </c:otherwise>
                                    </c:choose>

                                    <a class="dropdown-item" href="/view-cart">shopping cart</a>
                                    <a class="dropdown-item" href="confirmation.html">confirmation</a>
                                </div>
                            </li>

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

                            <li class="nav-item">
                                <a class="nav-link" href="/view-dashboard">Dashboard</a>
                            </li>
                        </ul>
                    </div>
                    <div class="hearer_icon d-flex align-items-center">
                        <a id="search_1" href="javascript:void(0)"><i class="ti-search"></i></a>
                        <a href="/view-cart">
                            <i class="flaticon-shopping-cart-black-shape"></i>
                        </a>
                        <!--  USER IMAGE   -->
                        <c:if test="${not empty user}">
                            <div class="rounded-circle overflow-hidden ml-2 ml-md-4"
                                 style="width: 35px; height: 35px">
                                <img src="${user.imageURL}"
                                     class="w-100 h-100 object-fit-cover" style="object-position: center;"
                                     alt="">
                            </div>
                        </c:if>

                    </div>
                </nav>
            </div>
        </div>
    </div>
    <div class="search_input" id="search_input_box">
        <div class="container ">
            <form class="d-flex justify-content-between search-inner">
                <input type="text" class="form-control" id="search_input" placeholder="Search Here">
                <button type="submit" class="btn"></button>
                <span class="ti-close" id="close_search" title="Close Search"></span>
            </form>
        </div>
    </div>
</header>
