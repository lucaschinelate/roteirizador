<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route:: get('/site', ['uses' => 'RoteirizadorController@index']);

Route:: get('/listagemVeiculo',['as' => 'listagem.veiculo', 'uses' => 'VeiculosController@listaVeiculo' ]);
Route:: get('/layout/adcionarVeiculo',['as' =>'layout.adicionarVeiculo', 'uses' => 'VeiculosController@adicionar']);
Route:: post('/layout/salvar',['as' =>'layout.salvar', 'uses' => 'VeiculosController@salvar']);
Route::get('layout/editar/{id}', ['as' => 'layout.editar', 'uses' => 'VeiculosController@editar']);
Route::put('layout/atualizar/{id}',['as' => 'layout.atualizar', 'uses' => 'VeiculosController@atualizar']);


Route::get('/listagem/motorista', ['as' => 'listagem.motorista', 'uses' => 'MotoristaController@listaMotorista']);
Route::get('layout/adicionarMotorista', ['as' => 'layout.adicionarMotorista', 'uses' => 'MotoristaController@adicionarMotorista']);
Route::post('layout/salvarMotorista', ['as' => 'layout.salvarMotorista', 'uses' => 'MotoristaController@salvarMotorista']);
Route::get('layout/deleteMotorista/{id}', ['as' => 'layout.deleteMotorista', 'uses' => 'MotoristaController@deletarMotorista']);
