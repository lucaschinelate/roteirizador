<div class="input-field">
  <input type="number" name="id" value="{{isset($filiais->id) ? $filiais->id : '' }}">
  <label>ID</label>
</div>

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
