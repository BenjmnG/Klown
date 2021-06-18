<!-- head -->

<head>
	<meta charset="utf-8"> 
	<title>{meta.page} - Le Klown</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="assets/css-compiled/main.css">
	<link rel="stylesheet" type="text/css" href="static/font/GeneralSans/stylesheet.css">

	<!-- block SEO -->
	<meta name="description" content="{meta.description}">
	<meta property="og:title" content="{{title}} - {{ _meta.acronyme | upper }}">  
	<meta property="og:description" content="{{_meta.description}}">
	<meta property="og:image" content="<!-- Image Oeuvre ELSE default.jpg -->">  
  <meta property="og:image:alt" content="Image description">
  <meta property="og:locale" content="fr_FR">
  <meta property="og:type" content="website">
  <meta property="og:url" content="{page.slug}">          
  <meta name="twitter:card" content="summary"> <!-- if Oeuvre → summary_large_image -->
  <link rel="canonical" href="{page.slug}">	
	<!-- END block  -->

	<!-- block Favicon // Init with data-bg -->
  <link rel="icon" href="static/favicon-k.ico"> <!-- Change w with data-bg -->
  <link rel="icon" type="image/png" sizes="32x32" href="static/favicon-k.png">
  <link rel="icon" type="image/png" sizes="192x192" href="static/favicon-192-k.png">
  <link rel="icon" type="image/svg+xml" href="static/favicon-k.svg"> <!-- Change w with data-bg -->
  <link rel="apple-touch-icon" sizes="120x120" href="static/apple-touch-icon-k.png"> <!-- Change w with data-bg -->
  <link rel="manifest" href="static/site.webmanifest">
  <meta name="theme-color" content="#333"> <!-- White → #ffffff || Black → #262626 || Red → #db0d06 -->
	<!-- END block -->
</head>



