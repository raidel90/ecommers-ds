<style>
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
    background-color: #13386e;
    margin: 50px;
    padding-top: 30px;
    padding-bottom: 50px;
    width: 60%;
    height: 65px;
    color: white;
    text-shadow: 2px 1px 3px black;
  }

  .top h1 {
    color: rgb(231, 222, 222);
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
    color: #fff;
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

<div class="" align="center" style="">
  <div class="top">
    <table class="" align="left">
      <tr>
        <td>
          <img style="width: 150px; margin-left: 50px;"
            src="https://estaticos.sport.es/resources/jpg/9/1/1594845884519.jpg" />
        </td>
        <td style="padding-left: 50px;">
          <h1> Gracias por su compra!</h1>
        </td>
      </tr>
    </table>
  </div>

  <div class="tabla">
    <h2>Hola {{$user->name}}.</h2>
    <h3> Detalle de su Orden: {{$referencia}}.</h3>

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
        <tr style="border-bottom: 1px solid #ddd important !;">
          <td style="width: 30%;">
            <img src="https://estaticos.sport.es/resources/jpg/9/1/1594845884519.jpg" />
          </td>
          <td>
            <h5>platano fruta</h5>
          </td>

          <td>2</td>
          <td>$1500</td>
        </tr>

        <tr style="border-bottom: 1px solid #ddd important !;">
          <td style="width: 30%;">
            <img src="https://estaticos.sport.es/resources/jpg/9/1/1594845884519.jpg" />
          </td>
          <td>
            <h5>platano fruta</h5>
          </td>

          <td>2</td>
          <td>$1500</td>
        </tr>

        <tr class="total">
          <td>
            <p>
            <h5>Fecha de pago: {{$fecha}}</h5>
            <h5> Metodo de pago: {{($metodo_pago!='' ? $metodo_pago : $referencia)}}</h5>
            </p>
          </td>
          <td></td>
          <td>
            <h2>Total:</h2>
          </td>
          <td align="rigth">
            <h2>${{$total}} </h2>
          </td>
        </tr>
      </tbody>
    </table>
  </div>

  <a href="{{$url}}" class="btn" target="_blank"
    data-saferedirecturl="https://www.google.com/url?q=https://cgabjbj.r.bh.d.sendibt3.com/tr/cl/gabnPX8_XQD-3-Q3EZDxC7iP0Pl26WeJvn84LzMcpArXU--23ILgS3dcbtfNT_p00kjVOlpTASqQ1YXkjTlkog95f5tMr0lNRVGJGYN9BYGbFIjY6_J5PXLfKk-OL4HjYSkK4Eam-Bqq317BsqsxfZdDE8NA7jDS0JMSsizcX84xB7W3F95RGOrqGTJHcvqmtgO1SuZS1zPamAmnVyzhJphkm8h-Ka93EPz-x1olz76L8ZiwcteRiPwUIqGlhyywpZlOhJM-IZYzLnZ0GJ-ZEeeXB-9tRdA5q1ML&amp;source=gmail&amp;ust=1594945939423000&amp;usg=AFQjCNHp8GQethfJvApf4wWfx_WB2F0mAg">Ver
    detalles</a>

  <div class="" style="font-size: 18px;">
    Vuelva pronto, le esperamos con gusto!

  </div>

  <div class="footer">

    © 2020 ExpressNutrition. All rights reserved.


  </div>

</div>