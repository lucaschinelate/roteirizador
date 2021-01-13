<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Enderecos;

class EnderecoController extends Controller
{
    //

    public function listaEndereco(){

      $enderecos = Enderecos::all();

      return view('listagem.listaEndereco', compact('enderecos'));

    }

    public function adicionar(){
      
    }
}
