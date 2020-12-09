<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Veiculos;
use App\Motoristas;

class RoteirizadorController extends Controller
{
    public function index(){

      return view('layout.site');
    }

    public function listaVeiculo(){

      $veiculo = Veiculos::all();
      //dd($veiculo->all());

      return view('listagem.listagemVeiculo', compact('veiculo'));
    }

    public function adicionar(){

      return view('layout.adicionarVeiculo');
    }


    public function salvar(Request $req){

      $dados = $req->all();

      Veiculos::create($dados);

      return redirect()->route('listagem.veiculo');

    }

    public function editar($id){

      $veiculo = Veiculos::find($id);
      return view('layout.editarVeiculo', compact('veiculo'));
    }

    public function atualizar(Request $req, $id){

      $dados = $req->all();

      Veiculos::find($id)->update($dados);

      return redirect()->route('listagem.veiculo');

    }


// COntroller motorista

    public function listaMotorista(){

      $motoristas = Motoristas::all();


      return view('listagem.listagemMotorista', compact('motoristas'));

    }


    public function adicionarMotorista(){

      return view('layout/adicionarMotorista');
    }


    public function salvarMotorista(Request $req){

      $dados = $req->all();

      Motoristas::create($dados);

      return redirect()->route('listagem.motorista');
    }

    public function deletarMotorista($id){

        Motoristas::find($id)->delete();
        return redirect()->route('listagem.motorista');

    }

}
