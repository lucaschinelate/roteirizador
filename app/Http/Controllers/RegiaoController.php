<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\regioes;

class RegiaoController extends Controller
{
    public function listaRegiao(){

      $listagemRegiaos = regioes::all();

      return view('listagem.listagemRegiao', compact('listagemRegiaos'));
    }



    public function adicionar(){

      return view('layout.adicionarRegiao');
    }


    public function salvar(Request $req){

        $dados = $req->all();

        regioes::create($dados);

        return redirect()->route('listagem.regiao');

    }


    public function editar($id){
      $regiao = regioes::find($id);

      return view('layout.editarRegiao', compact('regiao'));
    }

    public function atualizar(Request $req, $id){

      $dados = $req->all();

      regioes::find($id)->update($dados);

      return redirect()->route('listagem.regiao');
    }

    public function deletar($id){

      regioes::find($id)->delete();

      return redirect()->route('listagem.regiao');

    }


}
