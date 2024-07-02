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
    <link rel="stylesheet" href="css/toast.css">
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

        .book-detail-link {
            display: inline-block;
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }

        .single_product_item {
            transition: 0.1s linear;
        }

        .single_product_item:hover {
            box-shadow: rgba(17, 17, 26, 0.1) 0px 8px 24px, rgba(17, 17, 26, 0.1) 0px 16px 56px, rgba(17, 17, 26, 0.1) 0px 24px 80px;
            transform: translateY(-10px);
        }

        @media screen and (max-width: 450px) {
            #scrollToTopBtn {
                bottom: 10px; /* Place the button 20px from the bottom */
                right: 10px;
            }

            div > h3 {
                font-size: 18px;
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
<section class="product_list section_padding" style="padding-top: 50px">
    <div class="container">
        <div class="row">
            <div class="col-12 mb-5">
                <h3 class="text-center">Tác giả: ${author.name}</h3>
            </div>
            <div class="col-md-12">
                <div class="product_list">
                    <div class="row product-list">
                        <c:forEach var="book" items="${books}">
                            <div class="col-12 col-sm-12 col-md-6 col-lg-3">
                                <div class="single_product_item">
                                    <img src="${context}/img/book-image/${book.imageFront}" alt="#" class="img-fluid">
                                    <h3 class="px-4"> ${book.name} </h3>
                                    <h5 class="px-4">Tác giả: ${book.author.name}</h5>
                                    <div class="d-inline-block px-4" style="font-size: 10px;">
                                        <c:forEach var="i" begin="1" end="${book.averageRating}">
                                            <i class="fa-solid fa-star text-warning"></i>
                                        </c:forEach>
                                        <c:forEach var="i" begin="1" end="${5 - book.averageRating}">
                                            <i class="fa-solid fa-star text-black-50"></i>
                                        </c:forEach>
                                    </div>
                                    <p  class="px-4 pb-2">Giá
                                        <span class="book-price">${book.price}</span>đ
                                    </p>
                                    <a class="book-detail-link" href="${context}/book-detail?id=${book.id}"></a>
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

<!--Current page-->
<p style="display: none" class="current-page" page="${currentPage}"></p>
<button id="scrollToTopBtn" title="Go to top"><i class="fa-solid fa-arrow-up"></i></button>
<div id="toastBox"></div>
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
        // get next 12 product
        $.ajax({
            url: '${context}/search-by-author',
            type: 'post',
            data: {
                page: currentPage,
                authorId: ${author.id}
            },
            success: function (data) {
                if (data === '') {
                    showToast();
                    return;
                }
                $('.product-list').append(data);
                document.querySelector('.current-page').setAttribute('page', Number(currentPage) + 1);
                formatItemPrice();
                console.log('Load page success');
            },
            error: function (dd) {

            }
        });
    });

    // format book price
    function formatItemPrice() {
        document.querySelectorAll('.book-price').forEach(item => {
            const price = item.textContent;
            if (price.includes('.')) return;
            item.textContent = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
        })
    }
    formatItemPrice();

    // scroll to top btn
    // Get the button
    const mybutton = document.getElementById("scrollToTopBtn");

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

    const toastBox = document.querySelector('#toastBox');
    const invalidIcon = '<i class="fa-solid fa-circle-exclamation"></i>';
    const msg = 'Không còn sản phẩm nào!';


    function showToast() {
        const toast = document.createElement('div');
        toast.classList.add('toastItem');
        let content = 'Hello';
        toast.classList.add('invalid');
        content = invalidIcon + msg;

        toast.innerHTML = content;
        toastBox.appendChild(toast);

        setTimeout(() => {
            toast.remove();
        }, 3000);
    }

</script>
</body>

</html>