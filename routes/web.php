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

ROUTE:: get('/listagemVeiculo',['as' => 'listagem.veiculo', 'uses' => 'RoteirizadorController@listaVeiculo' ]);
Route:: get('/layout/adcionarVeiculo',['as' =>'layout.adicionarVeiculo', 'uses' => 'RoteirizadorController@adicionar']);
Route:: post('/layout/salvar',['as' =>'layout.salvar', 'uses' => 'RoteirizadorController@salvar']);
Route::get('layout/editar/{id}', ['as' => 'layout.editar', 'uses' => 'RoteirizadorController@editar']);
Route::put('layout/atualizar/{id}',['as' => 'layout.atualizar', 'uses' => 'RoteirizadorController@atualizar']);


Route::get('/listagem/motorista', ['as' => 'listagem.motorista', 'uses' => 'RoteirizadorController@listaMotorista']);
Route::get('layout/adicionarMotorista', ['as' => 'layout.adicionarMotorista', 'uses' => 'RoteirizadorController@adicionarMotorista']);
Route::post('layout/salvarMotorista', ['as' => 'layout.salvarMotorista', 'uses' => 'RoteirizadorController@salvarMotorista']);
Route::get('layout/deleteMotorista/{id}', ['as' => 'layout.deleteMotorista', 'uses' => 'RoteirizadorController@deletarMotorista']);
