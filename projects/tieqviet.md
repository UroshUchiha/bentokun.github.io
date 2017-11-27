<html>
<head>
	<meta charset=iso-8859-1>
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta name = "viewport" content="width=device-width, intial-scale=1">
	<title> TIEQ VIET </title>
</head>
<body>
<script>
function init() {
      //var channel = $.url().param('video');
	  var name = $.url().param('name');
	  
      var key = {
			'ch': 'c',
			'đ': 'd',
			'gh': 'g',
			'ph': 'f',
			'c': 'k',
			'tr', 'c',
			'q': 'k',
			'ng': 'q',
			'ngh?': 'q',
			'kh': 'x',
			'th': 'w',
			'd': 'z',
			'gi': 'z',
			'r': 'z',
			'nh': 'n\''
	  }
	  
	  function uppercase_first(str) {
		   return `${str.charAt(0).toUpperCase()}${str.slice(1)}`
	  }
	  
	  function convert(str) {
		
		  for (var k in key) {
			 str = str.replace(new RegExp(k, 'g'), key[k]).
							replace(new RegExp(uppercase_first(k), 'g'), uppercase_first(key[k]));
		  }
		  
		  return str;
	  }
	  
	  console.log(name);
}
init();
</script>
</body>
</html>