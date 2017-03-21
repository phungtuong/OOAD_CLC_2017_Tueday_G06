<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WELCOME TO ICSSE 2017</title>
<link href="./WELCOME TO ICSSE 2017_files/show_img.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript"
	src="./WELCOME TO ICSSE 2017_files/jquery-1.7.2.min.js.download"></script>
<script src="./WELCOME TO ICSSE 2017_files/Common.js.download"
	type="text/javascript"></script>
<script src="./WELCOME TO ICSSE 2017_files/PagingContent.js.download"
	type="text/javascript"></script>
<link rel="shortcut icon" type="image/png"
	href="http://icsse2017.hcmute.edu.vn/Resources/Imagephoto/logo.png">
<link href="./WELCOME TO ICSSE 2017_files/lightbox.css" rel="stylesheet"
	type="text/css">
<script src="./WELCOME TO ICSSE 2017_files/lightbox.min.js.download"
	type="text/javascript"></script>
<link href="./WELCOME TO ICSSE 2017_files/search_Article.css"
	rel="stylesheet">
<link href="./WELCOME TO ICSSE 2017_files/nivo-slider.css"
	rel="stylesheet">
<link href="./WELCOME TO ICSSE 2017_files/default.css" rel="stylesheet">

<script>
        function SearchProcess(event) {
            if (event.keyCode == 13) {
                OnSearch(document.getElementById('txtSearchArticle').value);
                return false;
            }
            return true;
        }
        function OnSearch(query) {
            PSCPortal.Services.CMS.SearchAndPaging(query, currentPage, OnSearchSuccess, OnSearchFailed);
        }

        function OnSearchSuccess(results, context, methodName) {
            var position = results.indexOf('_');
            totalRecords = results.substring(0, position);
            results = results.substring(position + 1);
            LoadContentAndPaging(results);
        }
        function OnSearchFailed(results, context, methodName) {
        }

        function retitleUrl(str) {
            str = str.replace(/^\s+|\s+$/g, ''); // trim
            str = str.toLowerCase();
            // remove accents, swap ñ for n, etc
            var from = "àáảãạăằắẳẵặâầấẩẫậđèéẻẽẹêềếểễệìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵ·/_,:;";
            var to = "aaaaaaaaaaaaaaaaadeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuyyyyy------";
            for (var i = 0, l = from.length ; i < l ; i++) {
                str = str.replace(new RegExp(from.charAt(i), 'g'), to.charAt(i));
            }
            str = str.replace(/[^a-z0-9 -]/g, '') // remove invalid chars
              .replace(/\s+/g, '-') // collapse whitespace and replace by -
              .replace(/-+/g, '-'); // collapse dashes
            return str;
        };

        function popunder() {
            $('a').not('[href^="http"],[href^="https"],[href^="mailto:"],[href^="#"]').each(function () {
                $(this).attr('href', function (index, value) {
                    if (value != undefined) {
                        var index = value.indexOf("Default.aspx");
                        if (index >= 0)
                            return value = "/" + value.substring(index, value.length);
                    }
                });
            });
            var articleId = '' != '' ? '' : '';
            var topicId = '' != '' ? '' : '';
            var moduleId = '' != '' ? '' : '';
            if (articleId != '') {
                if (window.history.state == null) {
                    if (articleId.indexOf("/") > -1)
                        articleId = articleId.substr(0, articleId.indexOf("/"));
                    window.history.replaceState({ ArticleId: articleId }, "ArticleId", "/ArticleId/" + articleId + "/" + retitleUrl(''));
                }
            }
            if (topicId != '') {
                if (window.history.state == null) {
                    if (topicId.indexOf("/") > -1)
                        topicId = topicId.substr(0, topicId.indexOf("/"));
                    window.history.replaceState({ TopicId: topicId }, "TopicId", "/TopicId/" + topicId + "/" + retitleUrl(''));
                }
            }
            
        }
    </script>


<link href="./WELCOME TO ICSSE 2017_files/WebResource.axd"
	type="text/css" rel="stylesheet" class="Telerik_stylesheet">
<link href="./WELCOME TO ICSSE 2017_files/WebResource(1).axd"
	type="text/css" rel="stylesheet" class="Telerik_stylesheet">
<link href="./WELCOME TO ICSSE 2017_files/WebResource(2).axd"
	type="text/css" rel="stylesheet" class="Telerik_stylesheet">
</head>
<body>

	<div id="pnTopDisplay" style="width: 1000px; float: left">
		<div id="ctl06_portlet_83a3e05a-eb99-4512-bd1a-5af90706fcf3"
			style="width: 574px; float: left">
			<div>
				<div class="P_top">
					<div class="P_logo">
						<div class="anh_logo">
							<img alt=""
								src="./WELCOME TO ICSSE 2017_files/Banner Hoi nghi quoc te sua.jpg"
								style="width: 800px; height: 188px;"><br>
						</div>
						<div class="name_ute"></div>
					</div>
				</div>

			</div>
		</div>

		<div id="ctl06_portlet_e28a24d5-befe-4213-a3d5-2e1ebcb2a71e"
			style="width: 1000px; float: left">
			<div>


				<script
					src="./WELCOME TO ICSSE 2017_files/jquery.nivo.slider.js.download"></script>




				<div class="container" style="height: 350px;">
					<div class="slider-wrapper theme-default">
						<div id="slider" class="nivoSlider" style="height: 350px;">

							<a href="http://icsse2017.hcmute.edu.vn/" target="_blank"
								class="nivo-imageLink" style="display: block;"> <img
								src="./WELCOME TO ICSSE 2017_files/HNQT3.jpg" title=""
								style="display: none; height: 350px;"></a> <a
								href="http://icsse2017.hcmute.edu.vn/" target="_blank"
								class="nivo-imageLink" style="display: none;"> <img
								src="./WELCOME TO ICSSE 2017_files/HNQT2.jpg" title=""
								style="display: none; height: 350px;"></a> <a
								href="http://icsse2017.hcmute.edu.vn/" target="_blank"
								class="nivo-imageLink" style="display: none;"> <img
								src="./WELCOME TO ICSSE 2017_files/HNQT1.jpg" title=""
								style="display: none; height: 350px;"></a> <img
								class="nivo-main-image"
								src="./WELCOME TO ICSSE 2017_files/HNQT3.jpg"
								style="display: inline; height: auto; width: 1000px;">
							<div class="nivo-caption"></div>
							<div class="nivo-directionNav">
								<a class="nivo-prevNav">Prev</a><a class="nivo-nextNav">Next</a>
							</div>
						</div>
						<div class="nivo-controlNav">
							<a class="nivo-control active" rel="0">1</a><a
								class="nivo-control" rel="1">2</a><a class="nivo-control"
								rel="2">3</a>
						</div>
					</div>
				</div>
				<script>
    $(document).ready(function(){
        $(".nivoSlider").nivoSlider({
            effect: 'random',
            slices: 15,
            boxCols: 8,
            boxRows: 4,
            animSpeed: 500,
            pauseTime: 3000,
            startSlide: 0,
            directionNav: true,
            controlNav: true,
            controlNavThumbs: false,
            pauseOnHover: true,
            manualAdvance: false,
            prevText: 'Prev',
            nextText: 'Next',
            randomStart: false,
            beforeChange: function () { },
            afterChange: function () { },
            slideshowEnd: function () { },
            lastSlide: function () { },
            afterLoad: function () { }
        });
        $('.nivoSlider').css('height', '350px');
        $('.nivoSlider img').css('height', '350px');
    })
   
</script>
			</div>
		</div>
		<div id="ctl06_portlet_800886a8-ccb5-40dd-813a-2c02ac0d2e92"
			style="padding: 10px 0px 0px 0px; width: 1000px; float: left">
			<div>

				<link href="./WELCOME TO ICSSE 2017_files/Menu.Green.css"
					rel="stylesheet" type="text/css">
				<div id="ctl06_portlet_800886a8-ccb5-40dd-813a-2c02ac0d2e92_RadMenu"
					class="RadMenu RadMenu_Green rmSized"
					style="height: 40px; z-index: 1; width: 100%;">
					<ul class="rmRootGroup rmHorizontal">
						<li class="rmItem rmFirst"><a
							href="http://icsse2017.hcmute.edu.vn/Default.aspx?PageId=8cb7e0c5-10f3-438b-8881-a74c24b373e3"
							class="rmLink rmRootLink"><span class="rmText">Home</span></a></li>
						<li class="rmItem "><a
							href="http://icsse2017.hcmute.edu.vn/Portlets/MenuRad/#"
							class="rmLink rmRootLink"><span class="rmText rmExpandDown">About</span></a>
							<div class="rmSlide">
								<ul class="rmVertical rmGroup rmLevel1">
									<li class="rmItem rmFirst"><a
										href="http://icsse2017.hcmute.edu.vn/Default.aspx?ArticleId=f9111384-c9ad-46ac-ba10-037bf3d691a4"
										class="rmLink"><span class="rmText">icsse</span></a></li>
									<li class="rmItem "><a
										href="http://icsse2017.hcmute.edu.vn/Default.aspx?ArticleId=c8018710-9562-44c6-bef0-2a0f22e73f6b"
										class="rmLink"><span class="rmText">HCMUTE</span></a></li>
									<li class="rmItem rmLast"><a
										href="http://icsse2017.hcmute.edu.vn/Default.aspx?ArticleId=dd21088d-cb55-4f9d-ac9c-73553c715cae"
										class="rmLink"><span class="rmText">Committees</span></a></li>
								</ul>
							</div></li>
						<li class="rmItem "><a
							href="http://icsse2017.hcmute.edu.vn/Default.aspx?ArticleId=fc8c1223-a9d2-46b5-9db3-665c778f0ac9"
							class="rmLink rmRootLink"><span class="rmText">Call
									for papers</span></a></li>
						<li class="rmItem "><a
							href="http://icsse2017.hcmute.edu.vn/Default.aspx?ArticleId=945864b5-165f-45a3-8e75-a9ba5ac1f9ef"
							class="rmLink rmRootLink"><span class="rmText">Submission</span></a></li>
						<li class="rmItem "><a
							href="http://icsse2017.hcmute.edu.vn/Default.aspx?ArticleId=707e0e24-5220-4821-a40f-4041eb76cc1a"
							class="rmLink rmRootLink"><span class="rmText">Registration</span></a></li>
						<li class="rmItem "><a
							href="http://icsse2017.hcmute.edu.vn/Default.aspx?ArticleId=be204435-0615-4fc3-aa86-392d871decc8"
							class="rmLink rmRootLink"><span class="rmText">Keynote
									Speakers</span></a></li>
						<li class="rmItem "><a
							href="http://icsse2017.hcmute.edu.vn/Portlets/MenuRad/#"
							class="rmLink rmRootLink"><span class="rmText">Program</span></a></li>
						<li class="rmItem "><a
							href="http://icsse2017.hcmute.edu.vn/Default.aspx?ArticleId=242b6486-aeb4-472f-b74f-779069bbd957"
							class="rmLink rmRootLink"><span class="rmText">Venue
									&amp; Hotel</span></a></li>
						<li class="rmItem rmLast"><a
							href="http://icsse2017.hcmute.edu.vn/Default.aspx?ArticleId=b4031ebe-e802-4402-a49a-5769943872a5"
							class="rmLink rmRootLink"><span class="rmText">Contact</span></a></li>
					</ul>
					<input
						id="ctl06_portlet_800886a8-ccb5-40dd-813a-2c02ac0d2e92_RadMenu_ClientState"
						name="ctl06_portlet_800886a8-ccb5-40dd-813a-2c02ac0d2e92_RadMenu_ClientState"
						type="hidden" autocomplete="off">
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
//<![CDATA[
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindowManager, {"clientStateFieldID":"RadWindowManager1_ClientState","formID":"form1","iconUrl":"","minimizeIconUrl":"","name":"RadWindowManager1","skin":"Default","windowControls":"[]"}, null, null, $get("RadWindowManager1"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadMenu, {"_childListElementCssClass":null,"_skin":"Green","attributes":{},"clientStateFieldID":"ctl06_portlet_800886a8-ccb5-40dd-813a-2c02ac0d2e92_RadMenu_ClientState","collapseAnimation":"{\"duration\":450}","expandAnimation":"{\"duration\":450}","itemData":[{"navigateUrl":"~/Default.aspx?PageId=8cb7e0c5-10f3-438b-8881-a74c24b373e3"},{"items":[{"navigateUrl":"~/Default.aspx?ArticleId=f9111384-c9ad-46ac-ba10-037bf3d691a4"},{"navigateUrl":"~/Default.aspx?ArticleId=c8018710-9562-44c6-bef0-2a0f22e73f6b"},{"navigateUrl":"~/Default.aspx?ArticleId=dd21088d-cb55-4f9d-ac9c-73553c715cae"}],"navigateUrl":"#"},{"navigateUrl":"~/Default.aspx?ArticleId=fc8c1223-a9d2-46b5-9db3-665c778f0ac9"},{"navigateUrl":"~/Default.aspx?ArticleId=945864b5-165f-45a3-8e75-a9ba5ac1f9ef"},{"navigateUrl":"~/Default.aspx?ArticleId=707e0e24-5220-4821-a40f-4041eb76cc1a"},{"navigateUrl":"~/Default.aspx?ArticleId=be204435-0615-4fc3-aa86-392d871decc8"},{"navigateUrl":"#"},{"navigateUrl":"~/Default.aspx?ArticleId=242b6486-aeb4-472f-b74f-779069bbd957"},{"navigateUrl":"~/Default.aspx?ArticleId=b4031ebe-e802-4402-a49a-5769943872a5"}]}, null, null, $get("ctl06_portlet_800886a8-ccb5-40dd-813a-2c02ac0d2e92_RadMenu"));
});
//]]>
</script>
	<div id="lightboxOverlay" class="lightboxOverlay"
		style="display: none;"></div>
	<div id="lightbox" class="lightbox" style="display: none;">
		<div class="lb-outerContainer">
			<div class="lb-container">
				<img class="lb-image" src="http://icsse2017.hcmute.edu.vn/">
				<div class="lb-nav">
					<a class="lb-prev" href="http://icsse2017.hcmute.edu.vn/"></a><a
						class="lb-next" href="http://icsse2017.hcmute.edu.vn/"></a>
				</div>
				<div class="lb-loader">
					<a class="lb-cancel"></a>
				</div>
			</div>
		</div>
		<div class="lb-dataContainer">
			<div class="lb-data">
				<div class="lb-details">
					<span class="lb-caption"></span><span class="lb-number"></span>
				</div>
				<div class="lb-closeContainer">
					<a class="lb-close"></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>