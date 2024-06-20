<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">

<c:set var="context" value="${pageContext.request.contextPath}"/>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Single Product</title>
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
    <!-- font-awesome star -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
    <link rel="stylesheet" href="css/single-product.css">

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
                    <h3 class="book-title">${book.name}</h3>
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
                            <tr>
                                <td>Số lượng</td>
                                <td>${book.quantity}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-lg-6">
                        <div class="card_area" style="margin-top: 30px">
                            <form action="${context}/add-to-cart" method="GET" class="add_to_cart_form">
                                <input type="hidden" name="id" class="item_id" value="${book.id}">
                                <div class="product_count_area">
                                    <p>Quantity</p>
                                    <div class="product_count d-inline-block">
                                        <span class="product_count_item number-decrement hover-pointer"> <i class="ti-minus"></i></span>
                                        <input name="amount" class="product_count_item input-number" style="height: fit-content;" type="text" value="1" min="1" max="${book.quantity}" readonly>
                                        <span class="product_count_item number-increment hover-pointer"> <i class="ti-plus"></i></span>
                                    </div>
                                    <p class="book-price">${book.price}đ</p>
                                </div>
                                <div class="add_to_cart text-center">
                                    <c:choose>
                                        <c:when test="${book.quantity > 0}">
                                            <button class="btn_3 btn_add_to_cart">add to cart</button>
                                        </c:when>
                                        <c:otherwise>
                                            <h5>Sản phẩm hiện đang hết hàng</h5>
                                        </c:otherwise>
                                    </c:choose>

                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
<%--================= KHACH HANG DANH GIA ====================--%>
            <div class="col-12 mb-5" style="background-color: #F4EDF278;">
                <h4 style="margin-bottom: 20px; padding: 20px; padding-left: 0px">Khách hàng đánh giá</h4>
                <c:forEach var="rating" items="${ratings}">
                    <div class="d-flex flex-column mb-5 flex-sm-row">
                        <div class="user-info mr-3 mr-lg-5 w-25" style="min-width: 180px">
                            <h5>${rating.user.name}</h5>
                            <p class="font-italic my-0 rating-date" style="font-size: 14px">${rating.createTime}</p>
                        </div>
                        <div class="user-comment">
                            <h5>${rating.title}</h5>
                            <div class="d-inline-block" style="font-size: 10px;">
                                <c:forEach var="i" begin="1" end="${rating.ratingScore}">
                                    <i class="fa-solid fa-star text-warning"></i>
                                </c:forEach>
                            </div>
                            <p>
                                ${rating.content}
                            </p>
                        </div>
                    </div>
                </c:forEach>
                <c:choose>
                    <c:when test="${ratings.size() == 0}">
                        <h5 class="mb-5 text-center">Sản phẩm hiện chưa có đánh giá</h5>
                    </c:when>
                    <c:otherwise>
                        <div class="text-center">
                            <button class="btn_1 mb-5 mt-3">Load more</button>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
<%--================= KHACH HANG DANH GIA END HERE ====================--%>
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
<div class="share" data-toggle="modal" data-target="#share-modal">
    <i class="fa-solid fa-share-nodes"></i>
</div>

<!-- MODAL FOR BUTTON SHARE  -->
<div class="modal fade" id="share-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content rounded-0">
            <div class="modal-header">
                <h3 id="exampleModalLabel">Chia sẻ</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="input-group mb-3">
                    <input type="text" class="form-control share-link" aria-label="Recipient's username" aria-describedby="basic-addon2">
                    <div class="input-group-append btn_copy">
                        <span class="input-group-text" id="basic-addon2">Copy</span>
                    </div>
                </div>
            </div>
            <div class="modal-footer justify-content-start">
                <div class="facebook-share">
                    <a class="facebook text-decoration-none" target="_blank"><i class="fa-brands fa-facebook-f"></i></a>
                </div>
                <div class="twitter-share">
                    <a class="twitter text-decoration-none" target="_blank"><i class="fa-brands fa-x-twitter"></i></a>
                </div>
                <div class="messenger-share">
                    <a class="messenger text-decoration-none" target="_blank"><i class="fa-brands fa-facebook-messenger"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>
<!--MODAL FOR BUTTON SHARE END HERE -->
<!-- subscribe part end -->
<div id="toastBox"></div>
<div style="display: none" class="user-check" user="${not empty user ? "yes" : "no"}"></div>
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
        // check for user login
        const user = document.querySelector('.user-check');
        const status = user.getAttribute('user');
        if (status === 'no') {
            showToast("invalid","Please login to add to cart!");
            return;
        }
        // get input value
        const itemNum = Number(document.querySelector('.input-number').value);
        const itemId = Number(document.querySelector('.item_id').value);
        // send to server
        $.ajax({
            url: '${context}/add-to-cart',
            type: 'get',
            data: {
                amount: itemNum,
                id: itemId
            },
            success: function (data) {
                showToast('success' ,data.successMsg);
            },
            error: function (dd) {

            }
        });
    })

    // JavaScript function to show the toast
    const toastBox = document.querySelector('#toastBox');
    const successIcon = '<i class="fa-solid fa-circle-check"></i>';
    const invalidIcon = '<i class="fa-solid fa-circle-exclamation"></i>';

    function showToast(action, message) {
        const toast = document.createElement('div');
        toast.classList.add('toastItem');
        if (action === 'success') {
            content = successIcon +  message;
        } else if (action === 'invalid') {
            toast.classList.add('invalid');
            content = invalidIcon + message;
        }


        toast.innerHTML = content;
        toastBox.appendChild(toast);

        setTimeout(() => {
            toast.remove();
        }, 3000);
    }

    // format money
    function formatMoney() {
        const item = document.querySelector('.book-price');
        const money = parseInt(item.textContent.slice(0, -1));
        item.textContent = money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".") + 'đ';
    }
    formatMoney();

    // share button function
    const shareLink = encodeURI(window.location.href);
    const msg = encodeURIComponent("Quyển sách này thực sự rất thú vị!");
    const title = encodeURIComponent(document.querySelector('.book-title').textContent);
    function setShareLink() {
        document.querySelector('.share-link').value = shareLink;
    }
    setShareLink();

    // copy share link function
    document.querySelector('.btn_copy').addEventListener('click', function() {
        const link = document.querySelector('.share-link');
        link.select();
        navigator.clipboard.writeText(link.value);
    });

    const fb = document.querySelector('.facebook');
    fb.href= `https://www.facebook.com/sharer/sharer.php?u=` + 'https://github.com/dienDan10';

    const twitter = document.querySelector('.twitter');
    twitter.href = `http://twitter.com/share?&url=${'https://github.com/dienDan10'}&text=${msg}&hashtags=book,interesting,awesome`;

    const messenger = document.querySelector('.messenger');
    messenger.href = `https://www.facebook.com/dialog/send?app_id=372609458675989&link=https://github.com/dienDan10&redirect_uri=https://github.com/dienDan10`;

    function convertDateFormat(dateString) {
        // Split the input date string into its components
        let parts = dateString.split("-");

        // Rearrange the components into dd-MM-yyyy format
        let newDateString = parts[2] + "-" + parts[1] + "-" + parts[0];

        return newDateString;
    }

    const date = document.querySelector('.rating-date');
    if (date.textContent !== null && date.textContent.trim() !== "") {
        date.textContent = convertDateFormat(date.textContent.trim());
    }
</script>
</body>

</html>