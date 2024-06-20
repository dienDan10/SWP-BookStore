<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">

<c:set var="context" value="${pageContext.request.contextPath}"/>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Home Page</title>
    <link rel="icon" href="img/favicon.jpeg" type="image/x-icon">
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
    <link rel="stylesheet" href="css/toast.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
</head>

<body>
<!--::header part start::-->
<%@ include file="components/header.jsp"%>
<!-- Header part end-->

<!-- banner part start-->
<section class="banner_part">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-5">
                <div class="banner_text">
                    <div class="banner_text_iner" style="font-family: 'Inter', sans-serif">
                        <h1>Sách Trending 
                            <br/>Hiện Nay</h1>
                        <p>Những quyển sách chứa nhiều thông tin giá trị nhưng cũng không kém phần giải trí</p>
                        <a href="${context}/product-list" class="btn_1">truy cập ngay</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="banner_img">
        <img src="img/banner-1.jpg" alt="#" class="img-fluid">
        <img src="img/banner_pattern.png" alt="#" class="pattern_img img-fluid">
    </div>
</section>
<!-- banner part start-->

<!-- product list start-->
<section class="single_product_list">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="single_product_iner">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-lg-6 col-sm-6">
                            <div class="single_product_img">
                                <img src="img/4.jpg" class="img-fluid" alt="#">
                                <img src="img/product_overlay.png" alt="#" class="product_overlay img-fluid">
                            </div>
                        </div>
                        <div class="col-lg-5 col-sm-6">
                            <div class="single_product_content">
                                <h5>Chỉ từ 70.000đ</h5>
                                <h2> <a href="#" onclick="return false">Lựa chọn ngay quyển sách
                                    phù hợp với bạn</a> </h2>
                                <a href="${context}/product-list" class="btn_3">khám phá</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="single_product_iner">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-lg-6 col-sm-6">
                            <div class="single_product_img">
                                <img src="img/main-product-1.jpg" class="img-fluid" alt="#">
                                <img src="img/product_overlay.png" alt="#" class="product_overlay img-fluid">
                            </div>
                        </div>
                        <div class="col-lg-5 col-sm-6">
                            <div class="single_product_content">
                                <h5>Với 300.000đ trở lên</h5>
                                <h2> <a href="#" onclick="return false">Sở hữu ngay bộ sách kinh điển
                                    trong lịch sử văn học Việt Nam cũng như toàn thế giới
                                </a> </h2>
                                <a href="${context}/product-list" class="btn_3">Sở hữu ngay</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="single_product_iner">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-lg-6 col-sm-6">
                            <div class="single_product_img">
                                <img src="img/main-product-2.jpg" class="img-fluid" alt="#">
                                <img src="img/product_overlay.png" alt="#" class="product_overlay img-fluid">
                            </div>
                        </div>
                        <div class="col-lg-5 col-sm-6">
                            <div class="single_product_content">
                                <h5>Với tất cả số tiền của bạn</h5>
                                <h2> <a href="#" onclick="return false">Tri thức là
                                    vô giá vì bạn không biết trước được bạn cần dùng khi nào</a> </h2>
                                <a href="${context}/product-list" class="btn_3">Đồng ý và truy cập</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- product list end-->


<!-- trending item start-->
<section class="trending_items">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section_tittle text-center">
                    <h2>Sản phẩm bán chạy</h2>
                </div>
            </div>
        </div>
        <div class="row" style="font-family: 'Inter', sans-serif;">
            <c:forEach var="book" items="${bestSellers}">
                <div class="col-lg-4 col-sm-6">
                    <div class="single_product_item">
                        <div class="single_product_item_thumb">
                            <img src="${book.imageFront}"
                                 alt="#" class="img-fluid">
                        </div>
                        <h3> <a href="${context}/book-detail?id=${book.id}">${book.name}</a> </h3>
                        <h5>Tác giả: ${book.author.name}</h5>
                        <div class="d-inline-block" style="font-size: 10px;">
                            <c:forEach var="i" begin="1" end="${book.averageRating}">
                                <i class="fa-solid fa-star text-warning"></i>
                            </c:forEach>
                        </div>
                        <p>Chỉ với
                            <fmt:formatNumber type = "number" minFractionDigits = "0" value = "${book.price}" />đ
                        </p>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>
</section>
<!-- trending item end-->

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
                    <p>Seamlessly empower fully researched growth strategies and interoperable internal or “organic”
                        sources credibly innovate granular internal .</p>
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

<!--::footer_part start::-->
<%@ include file="components/footer.jsp"%>
<!--::footer_part end::-->

<!--Toast box here-->
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
<!--Toast box end here-->

<script src="js/toast.js"></script>
<!-- jquery plugins here-->
<script src="js/jquery-1.12.1.min.js"></script>
<!-- popper js -->
<script src="js/popper.min.js"></script>
<!-- bootstrap js -->
<script src="js/bootstrap.min.js"></script>
<!-- magnific popup js -->
<script src="js/jquery.magnific-popup.js"></script>
<!-- carousel js -->
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<!-- slick js -->
<script src="js/slick.min.js"></script>
<script src="js/jquery.counterup.min.js"></script>
<script src="js/waypoints.min.js"></script>
<script src="js/contact.js"></script>
<script src="js/jquery.ajaxchimp.min.js"></script>
<script src="js/jquery.form.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/mail-script.js"></script>
<!-- custom js -->
<script src="js/custom.js"></script>
</body>

</html>