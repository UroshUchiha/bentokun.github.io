---
layout: page
comments: true
---

  <div id="posts" style="font-size: 30px; padding: 30px;">
    <div class="youtube"><span class = "view"></span><span class="count"></span><span class="goal"></span></div>
	<div class="ratio"><span class="ratio"></span></div>
  </div>
  <script async="" src="https://www.google-analytics.com/analytics.js"></script><script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-url-parser/2.3.1/purl.js"></script>
  <script>
  function init() {
      //var channel = $.url().param('video');
      
      function update() { 
      $.ajax({
          url: 'https://www.googleapis.com/youtube/v3/videos?part=statistics&id=rzUpGAmhgPc&key=AIzaSyAOgTK-Zv9xybEIlRr7R4P6cOdrJ2KbUHo',
          dataType: 'json',
          type: 'GET',
          success: function (data) {
			  var sub2 = data.items[0].statistics.likeCount + " SUNNIES LIKED! ";
              var subscribers = data.items[0].statistics.dislikeCount + " DISLIKES";
             
                $('#posts .count').text(sub2);
			    $('#posts .goal').text(subscribers);
				$('#posts .view').text(" "+data.items[0].statistics.viewCount + " VIEWS! ");
				$('#posts .ratio').text(" DISLIKE/LIKE: " + data.items[0].statistics.dislikeCount/(data.items[0].statistics.likeCount) * 100+"%");
          }
      });
      }
      setInterval(update, 4000);
      update();
  }
  init();
  </script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-2577731-3', 'auto');
  ga('send', 'pageview');

</script>
<iframe width="560" height="315" src="https://www.youtube.com/embed/rzUpGAmhgPc?autoplay=1&loop=1" frameborder="0" allowfullscreen></iframe>
