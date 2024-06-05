<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Single Product</title>
    <link rel="icon" href="img/favicon.png">
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
    <!-- font-awesome star -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    <style>
        .hover-pointer:hover{
            cursor: pointer;
        }
        #toast {
            visibility: hidden;
            min-width: 250px;
            margin-left: -125px;
            background-color: #333;
            color: #fff;
            text-align: center;
            border-radius: 2px;
            position: fixed;
            z-index: 1;
            right: 5%;
            bottom: 50px;
            font-size: 17px;
            white-space: nowrap;
            padding: 16px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        #toast.show {
            visibility: visible;
            -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
            animation: fadein 0.5s, fadeout 0.5s 2.5s;
        }

        @-webkit-keyframes fadein {
            from {bottom: 0; opacity: 0;}
            to {bottom: 30px; opacity: 1;}
        }

        @keyframes fadein {
            from {bottom: 0; opacity: 0;}
            to {bottom: 30px; opacity: 1;}
        }

        @-webkit-keyframes fadeout {
            from {bottom: 30px; opacity: 1;}
            to {bottom: 0; opacity: 0;}
        }

        @keyframes fadeout {
            from {bottom: 30px; opacity: 1;}
            to {bottom: 0; opacity: 0;}
        }
    </style>
</head>

<body>
<!--::header part start::-->
<%@ include file="components/header.jsp"%>
<!-- Header part end-->

<!-- breadcrumb part start-->
<section class="breadcrumb_part single_product_breadcrumb">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb_iner">
                </div>
            </div>
        </div>
    </div>
</section>
<!-- breadcrumb part end-->

<!--================Single Product Area =================-->
<div class="product_image_area">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="product_img_slide owl-carousel">
                    <div class="single_product_img">
                        <img src="${book.imageFront}" alt="#" class="img-fluid">
                    </div>
                    <div class="single_product_img">
                        <img src="${book.imageBack}" alt="#" class="img-fluid">
                    </div>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="single_product_text text-center" style="margin-bottom:100px">
                    <h3>${book.name}</h3>
                    <div class="d-flex flex-row align-items-center justify-content-between flex-row">
                        <div> </div><div> </div>
                        <h5 class="mb-0 mr-lg-5">${book.author.name}</h5>
                        <div class="d-inline-block" style="font-size: 10px;">
                            <span style="font-size: 12px;">Đánh giá: </span>
                            <c:forEach var="i" begin="1" end="${book.averageRating}">
                                <i class="fa-solid fa-star text-warning"></i>
                            </c:forEach>
                        </div>
                        <div> </div><div> </div>
                    </div>

                    <p>
                        ${book.summary}
                    </p>

                </div>
            </div>
            <div class="col-lg-12 mb-5">
                <div class="row">
                    <div class="col-lg-6">
                        <h4 style="margin-left: 15px">Thông tin chi tiết</h4>
                        <table class="table">
                            <tbody>
                            <tr>
                                <td>Nhà Xuất Bản</td>
                                <td>${book.publisher.name}</td>
                            </tr>
                            <tr>
                                <td>Ngày xuất bản</td>
                                <td>${book.publishedDate}</td>
                            </tr>
                            <tr>
                                <td>Thể loại</td>
                                <td>${book.category.name}</td>
                            </tr>
                            <tr>
                                <td>Mô tả</td>
                                <td>${book.description}</td>
                            </tr>
                            <tr>
                                <td>Số trang</td>
                                <td>${book.pageCount}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-lg-6">
                        <div class="card_area" style="margin-top: 30px">
                            <form action="/add-to-cart" method="GET" class="add_to_cart_form">
                                <input type="hidden" name="id" class="item_id" value="${book.id}">
                                <div class="product_count_area">
                                    <p>Quantity</p>
                                    <div class="product_count d-inline-block">
                                        <span class="product_count_item number-decrement hover-pointer"> <i class="ti-minus"></i></span>
                                        <input name="amount" class="product_count_item input-number" style="height: fit-content;" type="text" value="1" min="1" max="10" readonly>
                                        <span class="product_count_item number-increment hover-pointer"> <i class="ti-plus"></i></span>
                                    </div>
                                    <p><fmt:formatNumber type = "number" minFractionDigits = "0" value = "${book.price}" />đ</p>
                                </div>
                                <div class="add_to_cart text-center">
                                    <button class="btn_3 btn_add_to_cart">add to cart</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12" style="background-color: #F4EDF278;">
                <h4 style="margin-bottom: 20px; padding: 20px; padding-left: 0px">Khách hàng đánh giá</h4>
                <div class="d-flex flex-column mb-5 flex-sm-row">
                    <div class="user-info mr-3 mr-lg-5 w-25" style="min-width: 180px">
                        <h5>UsernameTaVietHoang</h5>
                        <p class="font-italic my-0" style="font-size: 14px">31-05-2024</p>
                    </div>
                    <div class="user-comment">
                        <h5>Vận chuyển nhanh chóng!</h5>
                        <div class="d-inline-block" style="font-size: 10px;">
                            <i class="fa-solid fa-star text-warning"></i>
                            <i class="fa-solid fa-star text-warning"></i>
                            <i class="fa-solid fa-star text-warning"></i>
                            <i class="fa-solid fa-star text-warning"></i>
                            <i class="fa-solid fa-star text-warning"></i>
                        </div>
                        <p>
                            Một đêm vội vã lẩn trốn sau phi vụ khoắng đồ nhà người, Atsuya, Shota và Kouhei đã rẽ vào lánh tạm trong một căn nhà hoang bên con dốc vắng người qua lại. Căn nhà có vẻ khi xưa là một tiệm tạp hóa với biển hiệu cũ kỹ bám đầy bồ hóng, khiến người ta khó lòng đọc được trên đó viết gì. Định bụng nghỉ tạm một đêm rồi sáng hôm sau chuồn sớm, cả ba
                        </p>
                    </div>
                </div>
                <div class="d-flex flex-column mb-5 flex-sm-row">
                    <div class="user-info mr-3 mr-lg-5 w-25" style="min-width: 180px">
                        <h5>UsernameTaVietHoang</h5>
                        <p class="font-italic my-0" style="font-size: 14px">31-05-2024</p>
                    </div>
                    <div class="user-comment">
                        <h5>Vận chuyển nhanh chóng!</h5>
                        <div class="d-inline-block" style="font-size: 10px;">
                            <i class="fa-solid fa-star text-warning"></i>
                            <i class="fa-solid fa-star text-warning"></i>
                            <i class="fa-solid fa-star text-warning"></i>
                            <i class="fa-solid fa-star text-warning"></i>
                            <i class="fa-solid fa-star text-warning"></i>
                        </div>
                        <p>
                            Một đêm vội vã lẩn trốn sau phi vụ khoắng đồ nhà người, Atsuya, Shota và Kouhei đã rẽ vào lánh tạm trong một căn nhà hoang bên con dốc vắng người qua lại. Căn nhà có vẻ khi xưa là một tiệm tạp hóa với biển hiệu cũ kỹ bám đầy bồ hóng, khiến người ta khó lòng đọc được trên đó viết gì. Định bụng nghỉ tạm một đêm rồi sáng hôm sau chuồn sớm, cả ba
                        </p>
                    </div>
                </div>
                <div class="d-flex flex-column mb-5 flex-sm-row">
                    <div class="user-info mr-3 mr-lg-5 w-25" style="min-width: 180px">
                        <h5>UsernameTaVietHoang</h5>
                        <p class="font-italic my-0" style="font-size: 14px">31-05-2024</p>
                    </div>
                    <div class="user-comment">
                        <h5>Vận chuyển nhanh chóng!</h5>
                        <div class="d-inline-block" style="font-size: 10px;">
                            <i class="fa-solid fa-star text-warning"></i>
                            <i class="fa-solid fa-star text-warning"></i>
                            <i class="fa-solid fa-star text-warning"></i>
                            <i class="fa-solid fa-star text-warning"></i>
                            <i class="fa-solid fa-star text-warning"></i>
                        </div>
                        <p>
                            Một đêm vội vã lẩn trốn sau phi vụ khoắng đồ nhà người, Atsuya, Shota và Kouhei đã rẽ vào lánh tạm trong một căn nhà hoang bên con dốc vắng người qua lại. Căn nhà có vẻ khi xưa là một tiệm tạp hóa với biển hiệu cũ kỹ bám đầy bồ hóng, khiến người ta khó lòng đọc được trên đó viết gì. Định bụng nghỉ tạm một đêm rồi sáng hôm sau chuồn sớm, cả ba
                        </p>
                    </div>
                </div>

                <div class="text-center">
                    <button class="btn_1 mb-5 mt-3">Load more</button>
                </div>
            </div>

        </div>
    </div>
</div>
<!--================End Single Product Area =================-->
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
<div id="toast"></div>
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
    const formAddToCart = document.querySelector('.add_to_cart_form');
    formAddToCart.addEventListener('submit', function(event) {
        event.preventDefault();
        // get input value
        const itemNum = Number(document.querySelector('.input-number').value);
        const itemId = Number(document.querySelector('.item_id').value);
        // send to server
        $.ajax({
            url: '/add-to-cart',
            type: 'get',
            data: {
                amount: itemNum,
                id: itemId
            },
            success: function (data) {
                showToast(data.successMsg);
            },
            error: function (dd) {

            }
        });
    })

    // JavaScript function to show the toast
    function showToast(message) {
        var toast = document.getElementById("toast");
        toast.className = "show";
        toast.textContent = message;
        setTimeout(function() { toast.className = toast.className.replace("show", ""); }, 3000);
    }
</script>
</body>

</html>