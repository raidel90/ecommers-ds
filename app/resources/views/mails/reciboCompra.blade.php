<!DOCTYPE html PUBLIC >
<html>
<head>
<style>
h2,h3,h4,.despedida,.footer,.hi{
  color:black !important;
}
  table {
    border-collapse: collapse;
    width: 100%;
  }

  .productos td {
    padding: 8px;
    text-align: left;
    border-bottom: 2px solid #ddd;
  }

  .top {
    background-color: #377e97;
    margin: 50px;
    padding-top: 30px;
    padding-bottom: 80px;
    width: 60%;
    height: 65px;
    color: white;
    text-shadow: 2px 1px 3px black;
  }

  .top h1 {
    color: rgb(231, 222, 222);
    font-size:45px;
  }

  .footer {
    background-color: #e6e3e3;
    width: 62%;
    margin: 40px;
    padding: 40px;
    height: 30px;
  }

  .total {
    border-top: 3px solid black;
    border-bottom: none;
  }

  thead {
    font-size: 20px;
  }

  .btn {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
      Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji",
      "Segoe UI Symbol";
    font-size: 25px;
    box-sizing: border-box;
    border-radius: 3px;
    color: white !important;
    display: inline-block;
    text-decoration: none;
    background-color: #3490dc;
    border-top: 10px solid #3490dc;
    border-right: 18px solid #3490dc;
    border-bottom: 10px solid #3490dc;
    border-left: 18px solid #3490dc;
    margin: 50px;
  }

  /*  tr:nth-child(even) {
      background-color: #464141;
  }
  
  */
</style>
</head>
<body>
  
<div class="" align="center" style="">
  <div class="top">
    <table class="" align="left">
      <tr>
        <td>
          <img style="width: 150px; margin-left: 50px;"
            src="assets/images/xycdi11704.png" />
        </td>
        <td style="padding-left: 0px;">
          <h1> Express Nutrition.</h1>
        </td>
      </tr>
    </table>
  </div>

  <div class="tabla">
    <h1 class="hi">Hola  {{$user->name}}.</h1>
    <h1 class="hi"> Detalle de su Orden:  {{$referencia}}.</h1>

    <table class="productos" style="width: 60%;">
      <thead align="center">
        <tr style="
            background-color: rgb(19, 56, 110);
            color: rgb(230, 230, 230);
            /*text-shadow: 2px 1px 3px black;*/
          ">
          <td></td>
          <td>Producto</td>
          <td>Cantidad</td>
          <td>Precio</td>
        </tr>
      </thead>
      <tbody align="center">
      
   @foreach($productos as $producto)

        <tr  style="border-bottom: 1px solid #ddd important !;">
          <td style="width: 30%;">
            <img src="{{ Voyager::image($producto->options->image) }}" />
          </td>
          <td>
            <h4>{{$producto->name}}</h4>
            <h5 style="color:gray;">{{$producto->options->presentation}}</h5>
          </td>

          <td>{{$producto->qty}} </td>
          <td>${{$producto->price}}</td>
        </tr>
   @endforeach

       
        <tr class="total">
          <td>
            <p>
            <h4>Fecha de pago:  {{$fecha}}</h4>
            <h4> Metodo de pago:  {{($metodo_pago!='' ? $metodo_pago : $referencia)}}</h4>
            </p>
          </td>
          <td></td>
          <td>
            <h2>Total:</h2>
          </td>
          <td align="rigth">
            <h2>$ {{$total}} </h2>
          </td>
        </tr>
      </tbody>
    </table>
  </div>

  <a href=" {{$url}}" class="btn" target="_blank">Ver Detalles</a>

  <div class="despedida" style="font-size: 18px;">
    Vuelva pronto, le esperamos con gusto!

  </div>

  <div class="footer">

    © 2020 ExpressNutrition. All rights reserved.


  </div>

</div>

</body>
</html>
