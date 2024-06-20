<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Sản phẩm</title>
    <link rel="icon" href="img/favicon.jpeg">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="css/all.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="css/magnific-popup.css">
    <!-- swiper CSS -->
    <link rel="stylesheet" href="css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    <style>
        #scrollToTopBtn {
            position: fixed; /* Fixed position */
            bottom: 20px; /* Place the button 20px from the bottom */
            right: 30px; /* Place the button 30px from the right */
            z-index: 99; /* Make sure it does not overlap */
            outline: none; /* Remove outline */
            color: #4B3049; /* Text color */
            cursor: pointer; /* Add a mouse pointer on hover */
            padding: 15px; /* Some padding */
            border-radius: 10px; /* Rounded corners */
            font-size: 18px; /* Increase font size */
            width: 50px;
            height: 50px;
            border: 1px solid #4B3049;
            background-color: transparent;
            opacity: 0; /* Set initial opacity to 0 */
            visibility: hidden; /* Set initial visibility to hidden */
            transition: opacity 0.2s, visibility 0.2s, background-color 0.2s, color 0.2s; /* Add transition effects */
        }

        .fa-arrow-up {
            transform: translateY(-3px);
        }

        #scrollToTopBtn.show {
            opacity: 1; /* Make the button fully visible */
            visibility: visible; /* Set visibility to visible */
        }

        #scrollToTopBtn:hover {
            background-color: #4B3049;
            color: #fff;
            cursor: pointer;
        }

        @media screen and (max-width: 450px) {
            #scrollToTopBtn {
                bottom: 10px; /* Place the button 20px from the bottom */
                right: 10px;
            }
        }

    </style>
</head>

<body>
<!--::header part start::-->
<%@ include file="components/header.jsp"%>
<!-- Header part end-->

<!-- breadcrumb part start-->
<section class="breadcrumb_part">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb_iner">
                    <h2>Sản phẩm</h2>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- breadcrumb part end-->

<!-- product list part start-->
<section class="product_list section_padding">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="product_sidebar">
                    <div class="single_sedebar">
                        <form action="#" class="search-form">
                            <input type="text" name="searchValue" placeholder="Tìm kiếm" class="search-input h6" style="font-family: 'Inter','Helvetica Neue', sans-serif" required>
                            <i class="ti-search"></i>
                        </form>
                    </div>
                    <div class="single_sedebar">
                        <div class="select_option">
                            <div class="select_option_list h6" style="font-family: 'Inter','Helvetica Neue', sans-serif">Thể loại <i class="right fas fa-caret-down"></i> </div>
                            <div class="select_option_dropdown">
                                <c:forEach var="category" items="${categories}">
                                    <p><a href="#" class="btn_filter_category h6" category-id="${category.id}">${category.name}</a></p>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="single_sedebar">
                        <div class="select_option">
                            <div class="select_option_list h6" style="font-family: 'Inter','Helvetica Neue', sans-serif">Nhà Xuất bản<i class="right fas fa-caret-down"></i> </div>
                            <div class="select_option_dropdown">
                                <c:forEach var="publisher" items="${publishers}">
                                    <p><a href="#" class="btn_filter_publisher h6" publisher-id="${publisher.id}">${publisher.name}</a></p>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="product_list">
                    <div class="row product-list">
                        <c:forEach var="book" items="${books}">
                            <div class="col-lg-6 col-sm-6">
                                <div class="single_product_item">
                                    <img src="${book.imageFront}" alt="#" class="img-fluid">
                                    <h3 class="px-4"> <a href="${context}/book-detail?id=${book.id}">${book.name}</a> </h3>
                                    <h5 class="px-4">Tác giả: ${book.author.name}</h5>
                                    <div class="d-inline-block px-4" style="font-size: 10px;">
                                        <c:forEach var="i" begin="1" end="${book.averageRating}">
                                            <i class="fa-solid fa-star text-warning"></i>
                                        </c:forEach>
                                    </div>
                                    <p  class="px-4">Giá
                                        <span class="book-price">${book.price}</span>đ
                                    </p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="load_more_btn text-center">
                        <a href="#" class="btn_3 btn_loadMore">Xem Thêm</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- product list part end-->

<!-- client review part here -->
<section class="client_review">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="client_review_slider owl-carousel">
                    <div class="single_client_review">
                        <div class="client_img">
                            <img src="https://hips.hearstapps.com/hmg-prod/images/e-b-white-9529308-1-402.jpg" alt="#">
                        </div>
                        <p>"Sách là bạn đồng hành tốt trong những lúc buồn cũng như vui,
                            vì sách là con người – những người đã cố gắng sống sót bằng cách ẩn mình dưới bìa sách."</p>
                        <h5>- E.B. White</h5>
                    </div>
                    <div class="single_client_review">
                        <div class="client_img">
                            <img src="https://i.guim.co.uk/img/media/56be7b100f9704b507dbac33715297ae2f5bd11e/0_491_4024_2414/master/4024.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=67b671ed36500300ac0b275a00007f79"
                                 alt="#">
                        </div>
                        <p>"Sách là phép màu độc nhất và diệu kỳ trong đời thực."</p>
                        <h5>- Stephen King</h5>
                    </div>
                    <div class="single_client_review">
                        <div class="client_img">
                            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/President_Barack_Obama_%28square%29.jpg/480px-President_Barack_Obama_%28square%29.jpg" alt="#">
                        </div>
                        <p>"Đọc sách rất quan trọng. Nếu biết cách đọc cả thế giới sẽ mở ra với bạn"</p>
                        <h5>- Barack Obama</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- client review part end -->

<!-- feature part here -->
<section class="feature_part section_padding">
    <div class="container">
        <div class="row justify-content-between">
            <div class="col-lg-6">
                <div class="feature_part_tittle">
                    <h3>Những cảm xúc đặc biệt khi đọc một cuốn sách hay là mô tả chính xác nhất về bạn</h3>
                </div>
            </div>
            <div class="col-lg-5">
                <div class="feature_part_content">
                    <p>Thông thường khi ta đọc sách, ta thường sử dụng trí tưởng tượng,
                        tự tạo nên những khung cảnh, hàng động của nhân vật.
                        Và trong một lúc vô tình nào đó,
                        ta thấy mình như đang sống trong trang sách cùng với tác giả và cả nhân vật của y</p>
                </div>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-lg-3 col-sm-6">
                <div class="single_feature_part">
                    <img src="img/icon/feature_icon_1.svg" alt="#">
                    <h4>Hỗ trợ thẻ tín dụng</h4>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="single_feature_part">
                    <img src="img/icon/feature_icon_2.svg" alt="#">
                    <h4>Đặt hàng trực tuyến</h4>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="single_feature_part">
                    <img src="img/icon/feature_icon_3.svg" alt="#">
                    <h4>Miễn phí vận chuyển</h4>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="single_feature_part">
                    <img src="img/icon/feature_icon_4.svg" alt="#">
                    <h4>Kèm theo quà tặng</h4>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- feature part end -->

<!-- subscribe part here -->
<section class="subscribe_part section_padding">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="subscribe_part_content">
                    <h2>Get promotions & updates!</h2>
                    <p>Seamlessly empower fully researched growth strategies and interoperable internal or “organic” sources credibly innovate granular internal .</p>
                    <div class="subscribe_form">
                        <input type="email" placeholder="Enter your mail">
                        <a href="#" class="btn_1">Subscribe</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- subscribe part end -->

<!--Current page-->
<p style="display: none" class="current-page" page="${currentPage}"></p>
<p style="display: none" class="filter" filter-by="none" ></p>
<button id="scrollToTopBtn" title="Go to top"><i class="fa-solid fa-arrow-up"></i></button>

<!--::footer_part start::-->
<%@ include file="components/footer.jsp"%>
<!--::footer_part end::-->

<!-- jquery plugins here-->
<script src="js/jquery-1.12.1.min.js"></script>
<!-- popper js -->
<script src="js/popper.min.js"></script>
<!-- bootstrap js -->
<script src="js/bootstrap.min.js"></script>
<!-- easing js -->
<script src="js/jquery.magnific-popup.js"></script>
<!-- swiper js -->
<script src="js/swiper.min.js"></script>
<!-- swiper js -->
<script src="js/mixitup.min.js"></script>
<!-- particles js -->
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<!-- slick js -->
<script src="js/slick.min.js"></script>
<script src="js/jquery.counterup.min.js"></script>
<script src="js/waypoints.min.js"></script>
<script src="js/jquery.ajaxchimp.min.js"></script>
<script src="js/jquery.form.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/mail-script.js"></script>
<!-- custom js -->
<script src="js/custom.js"></script>
<script>
    const btnLoadMore = document.querySelector('.btn_loadMore');
    btnLoadMore.addEventListener('click', function(event) {
       event.preventDefault();
       // get current page
        const currentPage = document.querySelector('.current-page').getAttribute('page');
        // get filter by action
        const filterBy = $('.filter').attr('filter-by');
        if (filterBy === 'none') {
            loadMoreDefault(currentPage);
        } else if (filterBy === 'category') {
            const filterId = $('.filter').attr('filter-id');
            loadMoreCategory(filterId, currentPage);
        } else if (filterBy === 'publisher') {
            const filterId = $('.filter').attr('filter-id');
            loadMorePublisher(filterId, currentPage);
        } else if (filterBy === 'search') {
            const input = $('.filter').attr('filter-id');
            loadMoreSearch(input, currentPage);
        }

    });

    // load more without filter option
    function loadMoreDefault(currentPage) {
        $.ajax({
            url: '${context}/next-page',
            type: 'get',
            data: {
                page: currentPage,
            },
            success: function (data) {
                $('.product-list').append(data);
                document.querySelector('.current-page').setAttribute('page', Number(currentPage) + 1);
                formatItemPrice();
                console.log('Load page success');
            },
            error: function (dd) {

            }
        });
    }
    // click event for btn category
    const btnFilterCategory = document.querySelectorAll('.btn_filter_category');
    btnFilterCategory.forEach(btn => btn.addEventListener('click', function(event) {
        event.preventDefault();
        const categoryId = this.getAttribute('category-id');
        loadMoreCategory(categoryId, 0);
    }));
    // load more with category filter
    function loadMoreCategory(categoryId, currentPage) {
        $.ajax({
            url: '${context}/filter-category',
            type: 'get',
            data: {
                categoryId: categoryId,
                currentPage: currentPage
            },
            success: function (data) {
                if (currentPage === 0) {
                    $('.product-list').empty();
                }
                $('.product-list').append(data);
                document.querySelector('.current-page').setAttribute('page', Number(currentPage) + 1);
                $('.filter').attr('filter-by', 'category');
                $('.filter').attr('filter-id', categoryId);
                formatItemPrice();
                console.log('Load page by category success');
            },
            error: function (dd) {

            }
        });
    }
    // click event for btn publisher
    const btnFilterPublisher = document.querySelectorAll('.btn_filter_publisher');
    btnFilterPublisher.forEach(btn => btn.addEventListener('click',function(event) {
       event.preventDefault();
       const publisherId = this.getAttribute('publisher-id');
        loadMorePublisher(publisherId, 0);
    }));
    // load more with publisher filter
    function loadMorePublisher(publisherId, currentPage) {
        $.ajax({
            url: '${context}/filter-publisher',
            type: 'get',
            data: {
                publisherId: publisherId,
                currentPage: currentPage
            },
            success: function (data) {
                if (currentPage === 0) {
                    $('.product-list').empty();
                }
                $('.product-list').append(data);
                document.querySelector('.current-page').setAttribute('page', Number(currentPage) + 1);
                $('.filter').attr('filter-by', 'publisher');
                $('.filter').attr('filter-id', publisherId);
                formatItemPrice();
                console.log('Load page by publisher success');
            },
            error: function (dd) {

            }
        });
    }

    // submit event for search book
    const searchForm = document.querySelector('.search-form');
    searchForm.addEventListener('submit', function(event) {
       event.preventDefault();
       // get form input
        const input = document.querySelector('.search-input').value;
        const currentPage = 0;
        // send to server to get data
        loadMoreSearch(input, currentPage);
    });

    function loadMoreSearch(input, currentPage) {
        $.ajax({
            url: '${context}/search-book',
            type: 'GET',
            data: {
                searchInput: input,
                currentPage: currentPage
            },
            success: function (data) {
                if (currentPage === 0) {
                    $('.product-list').empty();
                }
                $('.product-list').append(data);
                document.querySelector('.current-page').setAttribute('page', Number(currentPage) + 1);
                $('.filter').attr('filter-by', 'search');
                $('.filter').attr('filter-id', input);
                formatItemPrice();
                console.log('Load page by search success');
            },
            error: function (dd) {

            }
        });
    }

    // format book price
    function formatItemPrice() {
        document.querySelectorAll('.book-price').forEach(item => {
            const price = parseInt(item.textContent);
            item.textContent = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
        })
    }
    formatItemPrice();

    // scroll to top btn
    // Get the button
    let mybutton = document.getElementById("scrollToTopBtn");

    // When the user scrolls down 20px from the top of the document, show the button
    window.onscroll = function() {scrollFunction()};

    function scrollFunction() {
        if (document.body.scrollTop > 500 || document.documentElement.scrollTop > 500) {
            mybutton.classList.add("show");
        } else {
            mybutton.classList.remove("show");
        }
    }

    // When the user clicks on the button, scroll to the top of the document
    mybutton.onclick = function() {
        window.scrollTo({top: 200, behavior: 'smooth'});
    }

</script>
</body>

</html>