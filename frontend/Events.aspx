<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Events.aspx.cs" Inherits="EventForm" EnableEventValidation="false" %>
<!DOCTYPE html>
<html>
	<head>

		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="">
	    <meta name="author" content="">
	    <title>General Election 15</title>
	    
	    <link rel="shortcut icon" href="https://staging.thestar.com.my/ge15/images/favicon.ico" type="images/x-icon">

	    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css">
	    <link rel="stylesheet" href="/css/css.css">
	    <link rel="stylesheet" href="/css/tsol2017.css" type="text/css">
	    <link rel="stylesheet" href="/css/story2017.css" type="text/css">
	    <link rel="stylesheet" href="/css/election.css" type="text/css">
	    <link rel="stylesheet" href="/css/main.min.css" type="text/css">
	    <link rel="stylesheet" href="/css/responsive.css" type="text/css" media="only screen and (max-width:767px)">
	    <link rel="stylesheet" href="/css/icon.css">
	    <link rel="stylesheet" href="/css/font-awesome.min.css">
	    <link rel="stylesheet" href="/css/bootstrap-select.min.css">

	    <link rel="stylesheet" href="https://cdn.thestar.com.my/GlobalBar/css/global-bar.min.css">
	    <script src="https://cdn.thestar.com.my/GlobalBar/config.min.js?v=20200703" charset="utf-8"></script>
    	<script src="https://cdn.thestar.com.my/GlobalBar/global-bar.min.js" charset="utf-8"></script>
	    <!--
	    <script type="text/javascript" src="/js/config.min.js.download"></script>
	    <script type="text/javascript" src="/js/bar.min.js.download"></script>
	    -->
	    <script type="text/javascript" src="/js/jquery.min.js"></script>
	    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
	    <script type="text/javascript" src="/js/jsapi.js"></script>
	    <script type="text/javascript" src="/js/loader.js"></script>
	    <script type="text/javascript" src="/js/highcharts.js"></script>
	    <script type="text/javascript" src="/js/exporting.js"></script>
	    <style type="text/css">
    	.gallery-img-wrap .img-wrap img {
		  min-height: 267px;
		  object-fit: cover;
		}

		.img-sticker {
		    width: 100%;
		    padding-bottom: 67%;
		    overflow: hidden;
		}

		.img-sticker img {
			position: absolute;
		    height: 100%;
		    width: 100%;
		    object-fit: cover;
		    object-position: center 10%;
		}

        .fixImg{
            max-height: 230px;
        }

		@media  only screen and (max-width : 767px) {
		   .gallery-img-wrap .img-wrap img {
		       min-height:auto;
		}
	    </style>
	</head>
<body>

	<div class="wrapper-maincontent">
	    <header id="page-header" class="mobile-hide">
	        <div class="branding">
	            <div class="container masthead">
	                <a class="navbar-brand brand-prime" href="https://www.thestar.com.my/">
	                    <svg class="icon" width="164" height="55" role="img" aria-label="the star online">
                    		<image xlink:href="https://cdn.thestar.com.my/Themes/img/logo-tsol-full.svg" src="https://cdn.thestar.com.my/Themes/img/logo-tsol-logo.png" width="164" height="55" border="0"></image>
                		</svg>

	                    <h1 class="site-brand">GE 15</h1>
	                </a>

	                <ul class="social-branding right">
	                    <li class="share-news"><a href="https://staging.thestar.com.my/ge15/default.asp#" class="share">
	                    	<img src="/images/share-button.jpg">
	                    </li>
	                    <a href="https://staging.thestar.com.my/ge15/default.asp#" class="share"> </a>
	                </ul>
	            	<a href="https://staging.thestar.com.my/ge15/default.asp#" class="share"></a>
	         	</div>
	            <a href="https://staging.thestar.com.my/ge15/default.asp#" class="share"></a>
	        </div>
	        <a href="https://staging.thestar.com.my/ge15/default.asp#" class="share"></a>
	        <nav id="navbar-main" class="navbar navbar-custom affix" data-spy="affix" data-offset-top="197">
	        	<a href="https://staging.thestar.com.my/ge15/default.asp#" class="share"></a>
	        	<div class="container">
	        		<a href="https://staging.thestar.com.my/ge15/default.asp#" class="share"></a>
	        		<div class="back-link">
	        			<a href="https://staging.thestar.com.my/ge15/default.asp#" class="share"></a>
	                    <a href="https://www.thestar.com.my/" target="_blank">The Star Online <i class="fa fa-chevron-circle-right" aria-hidden="true" style="font-size:16px"></i></a>
	                    <a href="/" target="_blank">GE News <i class="fa fa-chevron-circle-right" aria-hidden="true" style="font-size:16px"></i></a>
	                </div>
	                <div class="mainNav">
	                    <ul class="nav navbar-nav navbar-left">
	                        <li><a href="/">GE15 News</a></li>
	                        <li><a href="https://election.thestar.com.my/candidates.html">Candidates</a></li>
	                        <li><a href="/Events.aspx">Events</a></li>
	                        <li><a href="https://election.thestar.com.my/infographics.html">Infographics</a></li>
	                        <li><a href="https://election.thestar.com.my/parties.html">Parties</a></li>
	                    </ul>
	                </div>
	            </div>
	        </nav>
	    </header>

	    <header id="page-header" class="mobile-show">
	        <div class="branding">
	            <div class="container masthead">
	                <a class="navbar-brand brand-prime" href="https://www.thestar.com.my/">
	                   <svg class="icon" role="img" aria-label="the star online" height="26" width="70">
	                        <image width="70" height="26" border="0" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="https://cdn.thestar.com.my/Themes/img/logo-tsol-full.svg" src="https://cdn.thestar.com.my/Themes/img/logo-tsol-mobile.png"></image>
	                    </svg>
	                    <h1 class="site-brand">GE 15</h1>
	                </a>
	                <ul class="social-branding right">
	                    <li class="share-news-res"><a href="https://staging.thestar.com.my/ge15/default.asp#" class="share"><img src="/images/share-button-mobile.jpg"></a>
	                    </li>
	                </ul>
	            </div>
	        </div>

	        <nav id="navbar-main" class="navbar navbar-custom" data-spy="affix" data-offset-top="197">
	            <div class="container forNav">
	                <div class="back-link">
	                    <a href="/" target="_blank"><i class="fa fa-arrow-circle-o-left" aria-hidden="true" style="font-size:22px"></i>GE News</a>
	                </div>

	                <div class="mainNav">
	                    <ul class="nav navbar-nav navbar-left">
	                        <li><a href="https://staging.thestar.com.my/ge15/default.asp">GE15 News</a></li>
	                        <li><a href="https://staging.thestar.com.my/ge15/default.asp#" id="button-state">State Results <i class="fa fa-caret-down"></i> </a></li>
	                        <li><a href="https://staging.thestar.com.my/ge15/default.asp#" id="button-more">More <i class="fa fa-caret-down"></i></a></li>
	                    </ul>
	                </div>

	                <div class="subNav for-state-results content-state">
	                    <ul>
	                        <li><a href="https://election.thestar.com.my/ft.html">Federaaal Territories</a></li>
	                        <li><a href="https://election.thestar.com.my/johor.html">Johor</a></li>
	                        <li><a href="https://election.thestar.com.my/kedah.html">Kedah</a></li>
	                        <li><a href="https://election.thestar.com.my/kelantan.html">Kelantan</a></li>
	                        <li><a href="https://election.thestar.com.my/malacca.html">Melaka</a></li>
	                        <li><a href="https://election.thestar.com.my/negerisembilan.html">Negri Sembilan</a></li>
	                        <li><a href="https://election.thestar.com.my/pahang.html">Pahang</a></li>
	                        <li><a href="https://election.thestar.com.my/penang.html">Penang</a></li>
	                        <li><a href="https://election.thestar.com.my/perak.html">Perak</a></li>
	                        <li><a href="https://election.thestar.com.my/perlis.html">Perlis</a></li>
	                        <li><a href="https://election.thestar.com.my/sabah.html">Sabah</a></li>
	                        <li><a href="https://election.thestar.com.my/sarawak.html">Sarawak</a></li>
	                        <li><a href="https://election.thestar.com.my/selangor.html">Selangor</a></li>
	                        <li><a href="https://election.thestar.com.my/terengganu.html">Terengganu</a></li>
	                        <li><a href="https://election.thestar.com.my/pinned.html"><b>Pinned Seats</b></a></li>
	                    </ul>
	                </div>

	                <div class="subNav for-more content-more">
	                    <ul>
	                        <li><a href="https://staging.thestar.com.my/ge15/pinned.asp">Pinned Seats</a></li>
	                        <li><a href="https://staging.thestar.com.my/ge15/live-feed.asp">Live Feed</a></li>
	                        <li><a href="https://election.thestar.com.my/candidates.html">Candidates</a></li>
	                        <li><a href="https://election.thestar.com.my/infographics.html">Infographics</a></li>
	                        <li><a href="https://election.thestar.com.my/parties.html">Parties</a></li>
	                        <li><a href="/">GE News ›</a></li>
	                        <li><a href="https://www.thestar.com.my/">The Star Online ›</a>
	                        </li>
	                    </ul>
	                </div>
	            </div>
	        </nav>
	    </header>
	</div>

    <div class="container ge14">
        <div class="col-xs-12">
		  	<div class="state-nav">
		    	<ul class="state-list">
		        <li>Results:</li>
		        <li><a href="https://election.thestar.com.my/ft.html">Federal Territories</a></li>
		        <li><a href="https://election.thestar.com.my/johor.html">Johor</a></li>
		        <li><a href="https://election.thestar.com.my/kedah.html">Kedah </a></li>
		        <li><a href="https://election.thestar.com.my/kelantan.html">Kelantan</a></li>
		        <li><a href="https://election.thestar.com.my/malacca.html">Melaka</a></li>
		        <li><a href="https://election.thestar.com.my/negerisembilan.html">Negri Sembilan</a></li>
		        <li><a href="https://election.thestar.com.my/pahang.html">Pahang </a></li>
		        <li><a href="https://election.thestar.com.my/penang.html">Penang</a></li>
		        <li><a href="https://election.thestar.com.my/perak.html">Perak</a></li>
		        <li><a href="https://election.thestar.com.my/perlis.html">Perlis</a></li>
		        <li><a href="https://election.thestar.com.my/sabah.html">Sabah </a></li>
		        <li><a href="https://election.thestar.com.my/sarawak.html">Sarawak</a></li>
		        <li><a href="https://election.thestar.com.my/selangor.html">Selangor</a></li>
		        <li><a href="https://election.thestar.com.my/terengganu.html">Terengganu</a></li>
		        <li><a href="https://election.thestar.com.my/pinned.html"><b>Pinned Seats</b></a></li>
		        </ul>
		    </div>
		</div>
    </div>

    <div class="wrapper-maincontent">
	    <section class="Inline Ads-slot">
	        <div class="container">
	            <div class="ads">
	                <div class="banner-ad"> 
	                	<a href="#">
	                		<img src="/images/billboard-ad.jpg">
	                	</a>
	                </div>
	            </div>
	        </div>
	    </section>
	</div>
        <div class="container">
            <div class="col-lg-12 col-centered overview-two mb-40">
                <h1 class="title">Events</h1>
            </div>

            <!-- Content : Events -->
            <div class="events">
                <form class="filter events__filter bg-grey mb-40" runat="server" action="" id="search_form">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="filter__drop">
                                <div class="dropdown bootstrap-select select-state bs3">
                            	    <asp:DropDownList ID="state" name="state" runat="server"  CssClass="select-state" title="Select state" tabindex="-98">

                                    </asp:DropDownList>
                                    <div class="dropdown-menu open">
                                        <div class="inner open" role="listbox" id="bs-select-state" tabindex="-1">
                            	            <ul class="dropdown-menu inner " role="presentation"></ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="filter__drop">
                                <div class="dropdown bootstrap-select show-tick select-party bs3">
                            
                                    <asp:ListBox ID="party" runat="server" SelectionMode="Multiple" CssClass="select-party" title="Can select one or more party" data-live-search="true"></asp:ListBox>
                                    <div class="dropdown-menu open">
	                                    <div class="inner open" role="listbox" id="bs-select-party" tabindex="-1">
	                        	            <ul class="dropdown-menu inner " role="presentation"></ul>
	                                    </div>
	                                </div>
                    		    </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="filter__drop">
                                <div class="dropdown bootstrap-select select-date bs3">
                            	    <asp:DropDownList ID="date" name="date" runat="server"  CssClass="select-date" title="Select date" tabindex="-98" data-live-search="true">

                                    </asp:DropDownList>
                                    <div class="dropdown-menu open">
                                        <div class="inner open" role="listbox" id="bs-select-date" tabindex="-1">
                            	            <ul class="dropdown-menu inner " role="presentation"></ul>
                                        </div>
                                    </div>
                    		    </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-8">
                            <div class="form-group filter__item filter__item--last">
                                <div class="input-group">
                                    <asp:TextBox ID="keyword" name="keyword" runat="server" style="width:100%" class="form-control" MaxLength="100" placeholder="Search Keyword - Location, Party" ></asp:TextBox>
                                    <div class="input-group-btn filter__close" id="btnClearKeyword">
                                        <i class="fa fa-times" aria-hidden="true"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="filter__buttons">
                                <asp:Button type="button" ID="btnSearch" OnClick="btnSearch_Click" class="btn btn--alpha" runat="server" Text="Search" CausesValidation="true"/>
                                <button type="button" class="btn btn--beta" id="btnReset">Clear</button>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="event__listing">
                    <asp:PlaceHolder ID = "event_div" runat="server" />
                </div>

                 <div class="row">
                     <div class="col-sm-12">
                        <nav class="pagination" role="navigation">
                            <ul class="pager" ID="pager_div" runat="server">
                            
                            
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>

        <footer>
			<div class="footerGE" id="footer">
			    <div class="container">
			      <div class="row">
			        <ul class="policies-links">
			          <li><a href="https://www.thestar.com.my/privacy/" target="_blank">Privacy Statement</a></li> |
			          <li><a href="https://www.thestar.com.my/terms/" target="_blank">Terms of Use</a></li>
			        </ul>
			        <p class="copyright">Copyright © 1995-2021 Star Media Group Berhad (ROC 10894D)</p>
			      </div>
			    </div>
			</div>
		</footer>

	<script type="text/javascript" src="/js/bootstrap-select.min.js"></script>
	<script>
	    $(document).ready(function () {
            $('.select-state').selectpicker();

            var groups = {};
            $("#party option[data-category]").each(function () {
                 groups[$(this).attr("data-category")] = true;
            });
            $.each(groups, function (c) {
                console.log(c);
                 $("#party option[data-category='"+c+"']").wrapAll('<optgroup label="' + c + '">');
            });
            $('.select-party').selectpicker();

            var groupsDate = {};
            $("#date option[data-category]").each(function () {
                 groupsDate[$(this).attr("data-category")] = true;
            });
            $.each(groupsDate, function (c) {
                 $("#date option[data-category='"+c+"']").wrapAll('<optgroup label="' + c + '">');
            });
            $('.select-date').selectpicker();

            $("#btnClearKeyword").click(function(){
				$('#keyword').val('');
            });

            $("#btnReset").click(function () {
                $('#keyword').val('');
                $('.select-state').val('');
                $('.select-party').val('');
                $('.select-date').val('');
                $('.select-state').selectpicker("refresh");
                $('.select-party').selectpicker("refresh");
                $('.select-date').selectpicker("refresh");
            });
        });
	</script>
</div>
</body>
</html>
