<?php

use App\Http\Controllers\CandidatoController;
use App\Http\Controllers\Homecontroller;
use App\Http\Controllers\NotificacionController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\VacanteController;

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

Route::get('/', Homecontroller::class)->name('home');

Route::get('/dashboard',[VacanteController::class,'index'])->middleware(['auth', 'verified','rol.reclutador'])->name('vacantes.index');
Route::get('/vacantes/create',[VacanteController::class,'create'])->middleware(['auth', 'verified'])->name('vacantes.create');
Route::get('/vacantes/{vacante}/edit',[VacanteController::class,'edit'])->middleware(['auth', 'verified'])->name('vacantes.edit');
Route::get('/vacantes/{vacante}',[VacanteController::class,'show'])->name('vacantes.show');
Route::get('/candidatos/{vacante}', [CandidatoController::class, 'index'])->name('candidatos.index');
// Notificaciones

Route::get('/notificaciones', NotificacionController::class)->middleware(['auth', 'verified', 'rol.reclutador'])->name('notificaciones');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
