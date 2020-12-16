<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Veiculos;
use App\Filiais;
use App\FiliaisVeiculos;

use Illuminate\Support\Facades\DB;

class VeiculosController extends Controller
{
    //

    public function index(){

      return view('layout.site');
    }

    public function listaVeiculo(){

      //$model = new Veiculos();
      //var_dump($model->teste());
      //exit();

      $veiculo = Veiculos::all();

      return view('listagem.listagemVeiculo', compact('veiculo'));
    }

    public function adicionar(){

      $filiais = Filiais::all();
      $veiculos = Veiculos::all();

      return view('layout.adicionarVeiculo',compact('filiais','veiculos'));
    }

    public function salvar(Request $req){

      $dados = $req->all();

      //dd($dados['idFilial']);
      //dd($dados['id']);
      $filial[] = $dados['idFilial'];

      //dd($filial);

      Veiculos::create($dados);

      $idVeiculo = $dados['id'];

      foreach($filial as $filiais){
          //dd(intval($filiais));
          //dd(intval($idVeiculo));

        //$idFilial[] = $filiais;
          //dd($idFilial);
       FiliaisVeiculos::create(['FILIAL_id' => $filiais, 'VEICULO_id' => intval($idVeiculo)]);
      }

      return redirect()->route('listagem.veiculo');

    }

    public function editar($id){

      $veiculo = Veiculos::find($id);
      $filiais = Filiais::all();
      return view('layout.editarVeiculo', compact('veiculo', 'filiais'));
    }

    public function atualizar(Request $req, $id){

      $dados = $req->all();

      Veiculos::find($id)->update($dados);

      return redirect()->route('listagem.veiculo');

    }

}
