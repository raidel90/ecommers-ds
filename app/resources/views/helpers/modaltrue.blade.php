<!-- Modal -->
  <div id="suscriptiontrue" class="modal fade" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
        
          <h4 class="modal-title">Información:</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <p>{{$message}}</p>
        </div>
        <div class="modal-footer">
          <button type="button" id="aceptarContra" class="btn btn-form btn-primary display-4" data-dismiss="modal">Aceptar</button>
        </div>
      </div>

    </div>
  </div>
<script type="text/javascript">
$('#suscriptiontrue').modal();
$('#suscriptiontrue .hidden').removeClass("hidden");
</script>