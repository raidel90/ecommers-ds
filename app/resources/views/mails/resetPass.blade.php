<!DOCTYPE html PUBLIC >
<html>
<head>
<style>
        .top{
             background-color: #377e97; 
            width:60%; 
            color:white !important;
            padding:40px;
            margin:40px;
            height: 80px;
            text-shadows:30px;
            }
        .btn{

                font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,Helvetica,Arial,sans-serif,'Apple Color Emoji','Segoe UI Emoji','Segoe UI Symbol';
                box-sizing:border-box;
                border-radius:7px;
                color:#fff !important;
                display:inline-block;
                text-decoration:none;
                background-color:#3490dc;
                border-top:10px solid #3490dc;
                border-right:18px solid #3490dc;
                border-bottom:10px solid #3490dc;
                border-left:18px solid #3490dc;

            }
        .footer{
            background-color: #e6e3e3; 
            width:62%; 
            margin:40px;
            padding:40px;
            height: 30px;
            text-shadows:30px;
        }  
        h3, h4, .footer {
            color:black !important;
        }

</style>

</head>
<body>
<div align='center'>
    <div class="top" >
        <table>
            <tr>
                <td>
                    <img src="assets/images/xycdi11704.png" alt="">
                </td>

                <td>
                    <h1 style="color:#f4eeef !important; text-shadow: 2px 1px 3px black;">Express Nutrition</h1>
                    <h2 style="color:#f4eeef !important; text-shadow: 2px 1px 3px black;">Solicitud de Cambio de Contraseña!</h2>
                </td>

            </tr>

        </table>

    </div>


    <h3>Sino ha hecho tal solicitud ignore este correo y verifique la seguridad de su cuenta.</h3>

    <a class="btn" href="{{$url}}"  target="_blank"> Cambiar Contraseña  </a>

    <div align='left' style="margin:80px; margin-left:33%;">
        <h4>Muchas gracias por utilizar nuestra aplicación!</h4>
        <h4>Saludos,</h4>
        <h4>ExpressNutrition</h4>
    </div>


    <div style=" width:61%; ">
         Si tienes problemas haciendo click en el botón "Cambiar Contraseña", copia y pega el siguiente enlace en tu navegador:
         <a href="{{$url}}">{{$url}}</a>
    </div>

    <div class="footer"> ©2020 ExpressNutrition. All rights reserved.</div>

</div>
</body>
</html>