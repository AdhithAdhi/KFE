<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="KFE.Index" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <link rel="shortcut icon" type="image/x-icon" href="~/KFE_128.ico" />
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet"/>

    <title>KFE</title>

    <link rel="stylesheet" type="text/css" href="template/user/assets/css/bootstrap.min.css"/>

    <link rel="stylesheet" type="text/css" href="template/user/assets/css/font-awesome.css"//>

    <link rel="stylesheet" href="template/user/assets/css/templatemo-breezed.css"/>

    <link rel="stylesheet" href="template/user/assets/css/owl-carousel.css"/>

    <link rel="stylesheet" href="template/user/assets/css/lightbox.css"/>
    
    <link rel="stylesheet" type="text/css" href="template/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="template/slick/slick-theme.css"/>
</head>
<body>
    
    <form id="form1" runat="server">
    
    <!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  
    <!-- ***** Preloader End ***** -->
    
    
    <!-- ***** Header Area Start ***** -->
    <header class="header-area header-sticky">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="main-nav">
                        <!-- ***** Logo Start ***** -->
                        <a href="/" class="logo">

                            <img src="/Images/KFE_128.png" />
                        </a>
                        <!-- ***** Logo End ***** -->
                        <!-- ***** Menu Start ***** -->
                        <ul class="nav">
                            <li class="scroll-to-section"><a href="#top" class="active">Home</a></li>
                            <li class="scroll-to-section"><a href="#about">About</a></li>
                            <li class="scroll-to-section"><a href="#testimonials">Products</a></li>
                            <li class="scroll-to-section"><a href="#projects">Gallery</a></li>

                            <li class="scroll-to-section"><a href="#contact-us">Contact Us</a></li>
                            <!--<div class="search-icon">
                                <a href="#search"><i class="fa fa-search"></i></a>
                            </div>-->
                        </ul>
                        <a class='menu-trigger'>
                            <span>Menu</span>
                        </a>
                        <!-- ***** Menu End ***** -->
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ***** Header Area End ***** -->
    
    <!-- ***** Main Banner Area Start ***** -->
    <div class="main-banner header-text" id="top">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <%="" %>
                <%  for (int i = 0; i < Sliders.Count; i++)
                    {
                        if (i == 0)
                        {
                        %>
                            <li data-target="#carouselExampleIndicators" data-slide-to="<%:i %>" class="active"></li>
                        <%
                            }
                            else
                            {
                        %>
                            <li data-target="#carouselExampleIndicators" data-slide-to="<%:i %>"></li>
                        <%
                                }

                            }
                %>
            </ol>
            <div class="carousel-inner">
                <% for (int i = 0; i < Sliders.Count; i++)
                    {
                        if (i == 0)
                        {
                        %>
                            <div class="carousel-item active">
                                <img class="d-block w-100" src="/Images/Sliders/<%:Sliders[i].ImagePath %>" alt="" />
                            </div>
                        <%
                            }
                            else
                            {
                        %>
                            <!-- Item -->
                            <div class="carousel-item">
                                <img class="d-block w-100" src="/Images/Sliders/<%:Sliders[i].ImagePath %>" alt="" />
                            </div>
                            <!-- // Item -->
                        <%
                                }
                            }
                 %>

            </div>
        </div>
    </div>
    <div class="scroll-down scroll-to-section"><a href="#about"><i class="fa fa-arrow-down"></i></a></div>
    <!-- ***** Main Banner Area End ***** -->

    <!-- ***** About Area Starts ***** -->
    <section class="section" id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-xs-12">
                    <div class="left-text-content">
                        <div class="section-heading">
                            <h6>About Us</h6>
                            <h2>Fresh fish at your doorstep</h2>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <div class="service-item">
                                    <img src="template/user/assets/images/service-item-01.png" alt=""/>
                                    <h4>Fresh</h4>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="service-item">
                                    <img src="template/user/assets/images/service-item-01.png" alt=""/>
                                    <h4>Clean</h4>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="service-item">
                                    <img src="template/user/assets/images/contact-info-03.png" alt=""/>
                                    <h4>Reliable</h4>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="service-item">
                                    <img src="template/user/assets/images/contact-info-03.png" alt=""/>
                                    <h4>Quality
                                    </h4>
                                </div>
                            </div>
                            <%--<div class="col-md-12">
                                <a href="#" class="main-button-icon">
                                    Learn More <i class="fa fa-arrow-right"></i>
                                </a>
                            </div>--%>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-xs-12">
                   <div class="right-text-content">
                        <p>
                            <a rel="nofollow noopener" href="/" class="text-bold" target="_parent">KFE' s</a> aim is to provide fresh fish at your doorstep. We collect freshly catched fish directly from the local fisherman and sells them at resaonable prices to our customers.
                            <br/>
                            <br/>

                        </p>
                        <p>
                            We ensure that all our fish are <label class="text-danger">ammonia</label> and <label class="text-danger">formaline</label> free beacuse customer satisfaction is our <label class="text-primary">happiness</label>.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** About Area Ends ***** -->

    <!-- ***** Testimonials Starts ***** -->
    <section class="section" id="testimonials">
        <div class="container">
            <div class="col-lg-12">
                <div class="section-heading">
                    <h6>Book Now</h6>
                    <h2>Our Products</h2>
                </div>
            </div>
            
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="slider responsive">
                    
                    <% for (int i = 0; i < Products.Count; i++)
                        {

                        %> <div class="item author-item">
                            <div class="member-thumb">
                                <img src="/Images/Products/<%:Products[i].ImagePath %>" alt="" width="360" height="300" />
                                <div class="hover-effect">
                                    <div class="hover-content">

                                        <span><%:Products[i].Description %></span>
                                    </div>
                                </div>
                            </div>
                            <h4><%:Products[i].Title %></h4>
                            <button class="main-button-icon">
                                Order Now
                            </button>
                        </div>

                    <%  } %>
                </div>
            
        </div>
            </div>
    </section>
    <!-- ***** Testimonials Ends ***** -->
    <!-- ***** Projects Area Starts ***** -->
    <section class="section" id="projects">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="section-heading">
                        <h6>Our Gallery</h6>
                        <h2>Some of our latest images</h2>
                    </div>
                    <div class="filters">
                        <ul>
                            <li class="active" data-filter="*">All</li>
                            <%for (int i = 0; i < GalleryTags.Tags.Length; i++)
                            { %>
                            <li data-filter=".<%:GalleryTags.Tags[i].Tag %>"><%:GalleryTags.Tags[i].ImageName %></li>
                            <%}%>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="filters-content">
                        <div class="row grid">
                            <%for (int i = 0; i < galleryWithTags.Count; i++)
                            { %>

                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 all <%:galleryWithTags[i].Tag %>">
                                <div class="item">
                                    <a href="/Images/Gallery/<%:galleryWithTags[i].ImageName %>" data-lightbox="image-1" data-title="Our Projects">
                                        <div class="img-fill">
                                            <img src="/Images/Gallery/<%:galleryWithTags[i].ImageName %>" alt="" />
                                        </div>
                                    </a>
                                </div>
                            </div>

                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Projects Area Ends ***** -->

    <!-- ***** Contact Us Area Starts ***** -->
    <section class="section" id="contact-us">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-xs-12">
                    <div class="left-text-content">
                        <div class="section-heading">
                            <h6>Contact Us</h6>
                            <h2>Feel free to keep in touch with us!</h2>
                        </div>
                        <ul class="contact-info">
                            <li><img src="template/user/assets/images/contact-info-01.png" alt=""/><label>+91 81138 11177</label></li>
                            <li><img src="template/user/assets/images/contact-info-01.png" alt=""/><label>+91 95261 80763</label></li>
                            <li><img src="template/user/assets/images/contact-info-02.png" alt=""/>kfefresh@gmail.com</li>
                            <li><img src="template/user/assets/images/contact-info-03.png" alt=""/>www.kfefresh.com</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-8 col-md-8 col-xs-12">
                    <div class="contact-form">
                            <div class="row">
                                <div class="col-md-6 col-sm-12">
                                    <fieldset>
                                        <input name="name" type="text" id="name" placeholder="Your Name *" required="">
                                    </fieldset>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <fieldset>
                                        <input name="phone" type="text" id="phone" placeholder="Your Phone" required="">
                                    </fieldset>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <fieldset>
                                        <input name="email" type="email" id="email" placeholder="Your Email *" required="">
                                    </fieldset>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <fieldset>
                                        <input name="subject" type="text" id="subject" placeholder="Subject">
                                    </fieldset>
                                </div>
                                <div class="col-lg-12">
                                    <fieldset>
                                        <textarea name="message" rows="6" id="message" placeholder="Message" required=""></textarea>
                                    </fieldset>
                                </div>
                                <div class="col-lg-12">
                                    <fieldset>
                                        <button type="submit" id="form-submit" class="main-button-icon">Send Message Now <i class="fa fa-arrow-right"></i></button>
                                    </fieldset>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Contact Us Area Ends ***** -->

    <!-- ***** Footer Start ***** -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-xs-12">
                    <div class="left-text-content">
                        <p>
                            Copyright &copy; 2020

                           <a rel="nofollow noopener" href="/">KFE</a>
                        </p>
                    </div>
                </div>
                <div class="col-lg-6 col-xs-12">
                    <div class="right-text-content">
                        <ul class="social-icons">
                            <li><p>Follow Us</p></li>
                            <li><a rel="nofollow" href="https://fb.com/kfefresh" target="_blank"><i class="fa fa-facebook"></i></a></li>
                            <li><a rel="nofollow" href="https://fb.com/kfefresh" target="_blank"><i class="fa fa-twitter"></i></a></li>
                            <li><a rel="nofollow" href="https://fb.com/kfefresh" target="_blank"><i class="fa fa-linkedin"></i></a></li>
                            <li><a rel="nofollow" href="https://fb.com/kfefresh" target="_blank"><i class="fa fa-dribbble"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    
    <!-- jQuery -->
    <script src="template/user/assets/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="template/user/assets/js/popper.js"></script>
    <script src="template/user/assets/js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="template/user/assets/js/owl-carousel.js"></script>
    <script src="template/user/assets/js/scrollreveal.min.js"></script>
    <script src="template/user/assets/js/waypoints.min.js"></script>
    <script src="template/user/assets/js/jquery.counterup.min.js"></script>
    <script src="template/user/assets/js/imgfix.min.js"></script> 
    <script src="template/user/assets/js/slick.js"></script> 
    <script src="template/user/assets/js/lightbox.js"></script> 
    <script src="template/user/assets/js/isotope.js"></script> 
    
    <!-- Global Init -->
    <script src="template/user/assets/js/custom.js"></script>

    <script src="template/slick/slick.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
        $(function () {
            var selectedClass = "";
            $("p").click(function () {
                selectedClass = $(this).attr("data-rel");
                $("#portfolio").fadeTo(50, 0.1);
                $("#portfolio div").not("." + selectedClass).fadeOut();
                setTimeout(function () {
                    $("." + selectedClass).fadeIn();
                    $("#portfolio").fadeTo(50, 1);
                }, 500);

            }); $('.responsive').slick({
                dots: false,
                infinite: false,
                speed: 300,
                slidesToShow: 3,
                slidesToScroll: 3,
                responsive: [
                    {
                        breakpoint: 1024,
                        settings: {
                            slidesToShow: 3,
                            slidesToScroll: 3,
                            infinite: true,
                            dots: true
                        }
                    },
                    {
                        breakpoint: 600,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 2
                        }
                    },
                    {
                        breakpoint: 480,
                        settings: {
                            slidesToShow: 1,
                            slidesToScroll: 1
                        }
                    }
                    // You can unslick at a given breakpoint now by adding:
                    // settings: "unslick"
                    // instead of a settings object
                ]
            });
        });

    </script>
    </form>
</body>
</html>
