<script>
	function showBubble(x){
		x.style.opacity="1.0";
	}
	function hideBubble(x){
		x.style.opacity="0.0";
	}
</script>

<a href="?language=ko"><img src='./resources/images/junimo1.png';
	onmouseover="showBubble(korean_bubble)"; onmouseout="hideBubble(korean_bubble)"
	style="position:fixed; left:2%; top:83%; width:100px; height:100px;"></a>
<img src='./resources/images/korean.png' id="korean_bubble"
	style="position:fixed; left:2%; top:78%; width:100px; height:50px; opacity:0.0">
<a href="?language=en"><img src='./resources/images/junimo2.png';
	onmouseover="showBubble(english_bubble)"; onmouseout="hideBubble(english_bubble)"
	style="position:fixed; right:2%; top:83%; width:100px; height:100px"></a>
<img src='./resources/images/english.png' id="english_bubble"
	style="position:fixed; right:2%; top:78%; width:100px; height:50px; opacity:0.0">