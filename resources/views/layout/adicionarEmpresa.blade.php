@include('includes.header')

<div class="row">
  <h2><center> TELA CADASTRO DE EMPRESA </center></h2>
</div>

<div class="container">
  <div class="row">
      <form class="" method="post" action="{{route('layout.salvarEmpresa')}}" >
        {{ csrf_field() }}

        @include('formularios.formulariosEmpresa')

        <button class="btn deep-orange">SALVAR</button>

      </form>
  </div>
</div>


@include('includes.footer')
