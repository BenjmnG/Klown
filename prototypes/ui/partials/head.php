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

	<!-- block Favicon -->
  <link rel="icon" href="/favicon.ico">
  <link rel="icon" href="/favicon.svg" type="image/svg+xml">
  <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
  <link rel="manifest" href="/site.webmanifest">
  <meta name="theme-color" content="#333">
	<!-- END block -->
</head>
