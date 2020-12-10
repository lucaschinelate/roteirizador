<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Motoristas;


class MotoristaController extends Controller
{
    //

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
