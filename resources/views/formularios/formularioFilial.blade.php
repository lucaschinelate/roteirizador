<div class="input-field">
  <input type="text" name="cnpj" value="{{isset($filiais->cnpj) ? $filiais->cnpj : '' }}">
  <label>CNPJ</label>
</div>

<div class="input-field">
  <input type="text" name="telefone" value="{{isset($filiais->telefone) ? $filiais->telefone : '' }}">
  <label>TELEFONE</label>
</div>

<div class="input-field">
  <input type="text" name="pais" value="{{isset($filiais->pais) ? $filiais->pais : '' }}">
  <label>PAIS</label>
</div>

<div class="input-field">
  <input type="text" name="estado" value="{{isset($filiais->estado) ? $filiais->estado : '' }}">
  <label>ESTADO</label>
</div>


<div class="input-field">
  <input type="text" name="cidade" value="{{isset($filiais->cidade) ? $filiais->cidade : '' }}">
  <label>CIDADE</label>
</div>

<div class="input-field">
  <input type="text" name="bairro" value="{{isset($filiais->bairro) ? $filiais->bairro : '' }}">
  <label>BAIRRO</label>
</div>

<div class="input-field">
  <input type="text" name="cep" value="{{isset($filiais->cep) ? $filiais->cep : '' }}">
  <label>CEP</label>
</div>


<divc class="input-field">
  <select name="EMPRESA_id">
    <option value="" >Escolha uma Empresa</option>
    @foreach($empresas as $empresa)
      <option value="{{isset($empresa->id) ? $empresa->id : ''}}">{{$empresa->nome_empresa}}</option>
    @endforeach
  </select>
</div>
