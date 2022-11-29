<%-- 
    Document   : Footter
    Created on : Oct 25, 2022, 1:20:39 AM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<section class="page-section" id="contact">
    <div class="container">
        <div class="text-center">
            <h2 class="section-heading text-uppercase">Phản hồi</h2>
            <h3 class="section-subheading text-muted" style="color: white;">Chúng tôi luôn đón nhận phản hồi của bạn.</h3>
        </div> 
        <form id="contactForm" class="needs-validation" novalidate>
            <div class="row align-items-stretch mb-5">
                <div class="col-md-6 ">
                    <div class="form-group position-relative">
                        <!-- Name input-->
                        <input class="form-control" id="name" type="text" placeholder="Họ Tên" required />
                        <div class="invalid-tooltip">
                            Hãy điền tên của bạn.
                        </div>
                    </div>
                    <div class="form-group position-relative">
                        <!-- Email address input-->
                        <input name="gmail" type="email" class="form-control" id="email" placeholder="Gmail của bạn"
                               pattern="[A-Za-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required>
                        <div class="invalid-tooltip">
                            Gmail không đúng chuẩn.
                        </div>
                    </div>
                    <div class="form-group mb-md-0 position-relative">
                        <!-- Phone number input-->
                        <input name="mobile" type="tel" class="form-control" id="phone" placeholder="Số điện thoại"
                               value="" pattern="[0-9]{10,11}" required>
                        <div class="invalid-tooltip">
                            Hãy điền số điện thoại đúng dạng.
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group form-group-textarea mb-md-0 position-relative">
                        <!-- Message input-->                        
                        <textarea class="form-control" id="message" placeholder="Phản hồi"
                                  required></textarea>
                        <div class="invalid-tooltip">
                            Hãy điền phản hồi của bạn.
                        </div>
                    </div>
                </div>
            </div>
            <!-- Submit Button-->
            <div class="text-center"><button class="btn btn-primary btn-xl text-uppercase"
                                             id="submitButton" type="submit">Gửi phản hồi</button></div>
        </form>
    </div>
</section>
