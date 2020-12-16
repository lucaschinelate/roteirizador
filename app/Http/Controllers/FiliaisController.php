<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Filiais;

class FiliaisController extends Controller
{
    //

    public function listaFiliais(){

      $filiais = Filiais::all();

      return view('listagem.listagemFiliais', compact('filiais'));

    }

    public function adicionar(){

      return view('layout.adicionarFilial');
    }


    public function salvar(Request $req){

        $dados = $req->all();

        Filiais::create($dados);

        return redirect()->route('listagem.filiais');

    }

    public function editar($id){

      $filiais = Filiais::find($id);
      return view('layout.editarFilial', compact('filiais'));
    }

    public function atualizar(Request $req, $id){

      $dados = $req->all();

      Filiais::find($id)->update($dados);


      return redirect()->route('listagem.filiais');


    }

    


}
