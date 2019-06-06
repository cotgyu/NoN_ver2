<%@ tag language="java" pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- 
jQuery 
<script src="//code.jquery.com/jquery.min.js"></script>
합쳐지고 최소화된 최신 CSS
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
부가적인 테마 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
합쳐지고 최소화된 최신 자바스크립트 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
기존 comment에서 쓰던 부트스트랩 
 --> 

  <!-- Bootstrap core CSS --> <!--toggle-->
  <link href="resources/indexresource/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">   

  <!-- Custom styles for this template -->
  <link href="resources/indexresource/css/simple-sidebar.css" rel="stylesheet">

  <!-- Bootstrap core JavaScript -->
  <script src="resources/indexresource/vendor/jquery/jquery.min.js"></script><!--toggle -->
  <script src="resources/indexresource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Menu Toggle Script -->
  <script>
    $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
    });
  </script>