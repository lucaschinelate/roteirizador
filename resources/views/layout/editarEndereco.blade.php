@include('includes.header')

<div class="row">
  <h2><center> TELA EDITAR ENDEREÇO </center></h2>
</div>

<div class="container">
  <div class="row">
      <form class="" method="post" action="{{route('layout.atualizarEndereco', $endereco->id)}}">
        {{ csrf_field() }}

        <input type="hidden" name="_method" value="put">

        @include('formularios.formularioEndereco')

        <button class="btn deep-orange">ATUALIZAR</button>

      </form>
  </div>
</div>


@include('includes.footer')
