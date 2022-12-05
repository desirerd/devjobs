<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class NuevoCandidato extends Notification
{
    use Queueable;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($id_vacante, $nombre_vacante, $usuario_id)
    {

        // Constructor para obtener los datos

        $this->id_vacante = $id_vacante;
        $this->nombre_vacante = $nombre_vacante;
        $this->usuario_id = $usuario_id;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {

        // le decimos que esta notificación llega por email y también se almacena en la Base de Datos.

        return ['mail','database'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {

         // Configuramos el email.

        $url = url('/notificaciones');

        return (new MailMessage)
                    ->line('Has recibido un nuevo candidato en tu vacante.')
                    ->line('La vacante es: ' . $this->nombre_vacante)
                    ->action('Ver Notificaciones', $url)
                    ->line('Gracias por utilizar DevJobs!');
    }

   // Almacena las notificaciones en la BD

   public function toDatabase($notifiable){

    // Configuramos lo que se almacena en la Base de Datos.

        return [
            'id_vacante' => $this->id_vacante,
            'nombre_vacante' => $this->nombre_vacante,
            'usuario_id' => $this->usuario_id

        ];

}
   


}
