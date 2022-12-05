<?php

namespace App\Http\Controllers;

use App\Models\Vacante;
use Illuminate\Http\Request;

class VacanteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // Esto previene el acceso a todo lo relacionado con este modelo, no queremos que un desarrollador cree vacantes.
        // Se le pasa el modelo porque no hay instancia de vacante

        $this->authorize('viewAny', Vacante::class);
        return view('vacantes.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $this->authorize('create', Vacante::class);
        return view('vacantes.create');
    }



    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Vacante $vacante)
    {
        return view('vacantes.show', [
            'vacante' => $vacante
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Vacante $vacante)
    {
        // Primero comprobamos el policy

        $this->authorize('update', $vacante);
        
        return view('vacantes.edit', [
            'vacante' => $vacante
        ]);
    }

  
}
