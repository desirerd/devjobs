<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class NotificacionController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {

        $notificaciones = auth()->user()->unreadNotifications;

        // Limpiar notificaciones, si ya están vistas no las vuelve a mostrar
        // Como el globo de solicitudes de Facebook por ejemplo.

        auth()->user()->unreadNotifications->markAsRead();

        return view('notificaciones.index', [
            'notificaciones' => $notificaciones
        ]);
    }
}
