<html>
<head>
    <title><?php wp_title(); ?></title>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
    <style>
        * {
            margin: 0px; padding: 0px;
        }
        body {
            background: #1481c4;
            font-family: 'Open Sans', sans-serif;
            font-size: 20px;
            line-height: 34px;
            font-weight: bold;
            color: #333;
        }
        html, body {
            width: 100%;
            height: 100%;
        }
        .error-wrapper-bg {
            width: 100%;
            height: 100%;
            overflow: hidden;
            background-position: center top;
            background-size: cover;
            background-repeat: no-repeat;
        }
        .error-wrapper {
            width: 568px;
            text-align: center;
            height: 299px;
            background-size: 100%;
            background-position: center top;
            margin: 50px auto;
            max-width: 80%;
            background-repeat: no-repeat;
        }
        .error-wrapper div {
            overflow: hidden;
            padding: 0px 40px;
        }
        .error-wrapper h1 {
            font-size: 120px;
            line-height: 1;
            padding: 0;
            color: #fff;
            margin: 18px 0px 10px;
        }
        .error-wrapper p {
            margin: 0;
        }
        .error-wrapper a {
            color: #fff;
            text-decoration: none;
        }

        @media (max-height: 650px){
            .error-wrapper-bg {
                background-position-y: 70px;
            }
        }

        @media (max-width: 650px){
            body {
                font-size: 20px;
                line-height: 35px;
                font-weight: normal;
            }
            .error-wrapper div {
                padding: 0px 30px;
            }
            .error-wrapper h1 {
                font-size: 90px;
                margin: 20px 0px 10px;
            }
        }

        @media (max-width: 520px){
            body {
                font-size: 15px;
                line-height: 25px;
            }
            .error-wrapper div {
                padding: 0px 20px;
            }
            .error-wrapper h1 {
                font-size: 60px;
            }
            .error-wrapper {
                margin-top: 30px;
            }
        }

        @media (max-width: 340px){
            body {
                font-size: 13px;
                line-height: 22px;
            }
            .error-wrapper h1 {
                font-size: 40px;
            }
            .error-wrapper {
                max-width: 95%;
            }
        }
    </style>
</head>

<?php Global $redux_framework; ?>

<body style="background-color: <?php echo $redux_framework['section_404_full_bg']['background-color'] ?>">
    <div class="error-wrapper-bg" style="background-color: <?php echo $redux_framework['section_404_full_bg']['background-color'] ?>;background-repeat: <?php echo $redux_framework['section_404_full_bg']['background-repeat'] ?>;background-image: url(<?php echo $redux_framework['section_404_full_bg']['background-image'] ?>);">
        <div class="error-wrapper" style="
    background-image: url(<?php echo $redux_framework['section_404_quote_bg']['background-image'] ?>);background-repeat: <?php echo $redux_framework['section_404_full_bg']['background-repeat'] ?>;">
            <div>
                <h1><?php echo $redux_framework['section_404_title']; ?></h1>
                <?php echo $redux_framework['section_404_des']; ?>
            </div>
        </div>
    </div>
</body>
</html>